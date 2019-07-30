---
title: Inject custom dependency in the ReportsController of a .NET Core application
description: How to inject custom dependency in the ReportsController of a .NET Core application
type: how-to
page_title: Dependency injection in the ReportsController of a .NET Core application
slug: how-to-inject-custom-dependency-in-reports-controller-of-dot-net-core-application
position: 
tags: 
ticketid: 1418590
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
	    <tr>
	    	<td>Project Type</td>
	    	<td>ASP.NET Core</td>
	    </tr>
    </tbody>
</table>


## Description
ASP.NET Core provides built-in functionality for dependency injection. By default, the ReportsController, where the Telerik Reporting REST Service gets configured receives only an object of custom configuration class (e.g. _ConfigurationService_ in our examples), where the [IHostingEnvironment](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.hosting.ihostingenvironment?view=aspnetcore-2.2) and [IConfiguration](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=aspnetcore-2.2) are passed.  
If you need to pass additional dependency, you may do it as explained below.

## Solution

Let's demonstrate the approach with an example - how to provide a data source through inversion of control in the report dynamically.
The Telerik Reporting uses [System.Reflection](https://docs.microsoft.com/en-us/dotnet/api/system.reflection?view=netcore-2.2) to create instances of the custom objects at run-time. Therefore, they need public parameterless constructor in order to be successfully created. Hence, the ObjectDataSource cannot use a provider (e.g. **ProductRepository**) where a dependency (e.g. the database context) is injected, for example like :

```CSharp
public class ProductRepository : IProductRepository
{
    private readonly ApplicationDbContext context;

    public ProductRepository(ApplicationDbContext context)
    {
        this.context = context;
    }

    public IEnumerable<Product> GetProducts()
    {
        // return the data here, e.g.
        return this.context.Product.Take(20).ToList();
    }
}
```  
In this case you may use [Custom Resolver](../telerik-reporting-rest-custom-report-resolver) for resolving the TRDP reports and add the DataSource at run-time after instantiating the report. For the purpose it will be necessary to :  

1) Change the **Configure** method of the **Startup** class to pass the **IProductRepository** with the **ReportsController**, for example like :  

```CSharp
public void ConfigureServices(IServiceCollection services)
{
    this.services = services;
    this.services.AddDbContext<...>(options => ...);
    ...
    this.services.AddScoped<IProductRepository, ProductRepository>();
    ...
}

public void Configure(IApplicationBuilder app, IHostingEnvironment env)
{
    var svc = this.services.FirstOrDefault(s => s.ServiceType == typeof(IProductRepository));
    this.services.AddTransient(ctx => new ReportsController(new ConfigurationService(env), (IProductRepository)svc.ImplementationInstance));
    ...
}
```  
2)  Pass a second parameter of **IProductRepository** in the **ReportsController**. Note that you can have only one constructor of the **ReportsController** (seems to be a limitation of the framework), hence you need to modify the existing constructor of the controller to receive the second parameter and pass it to the custom resolver :  

```CSharp
public ReportsController(ConfigurationService configSvc, IProductRepository productRepository)
{
    ...
    var resolver = new CustomReportResolver(productRepository);
    ...
}
```  
3) In the **CustomReportResolver** introduce a constructor that receives the repository and use the repository as required :  
  
```CSharp
public class CustomReportResolver : IReportResolver
{
    ...
    private IProductRepository repository;
 
    public CustomReportResolver(IProductRepository repository)
    {
        this.repository = repository;
    }
     
    ReportSource IReportResolver.Resolve(string reportName)
    {
        // use **this.repository** as required in the Resolve method
        // For example the following code unpackages the TRDP report with name in 'reportName'
        // and sets the data source of 'table1' in its detail section 'detailSection1' to
        // the data returned by the GetProducts() method of the ProductRepository :
		
        var reportPackager = new ReportPackager();
        Report report = null;
        using (var sourceStream = System.IO.File.OpenRead(reportName))
        {
          report = (Report)reportPackager.UnpackageDocument(sourceStream);
        }

        DetailSection detail = (DetailSection)report.Items["detailSection1"];
        Table table = (Table)detail.Items["table1"];
        table.DataSource = this.repository.GetProducts();
        
        InstanceReportSource instanceReportSource = new InstanceReportSource();
        instanceReportSource.ReportDocument = report;
        
        return instanceReportSource;
     }
}
```
