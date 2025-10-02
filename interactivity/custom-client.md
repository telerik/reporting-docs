## Extensibility

If necessary, the Reporting engine can use a custom `Telerik.Reporting.AI.IClient` implementation, which can be registered in the Reporting REST Service configuration:

````.NET
builder.Services.TryAddSingleton<IReportServiceConfiguration>(sp => new ReportServiceConfiguration
    {
        HostAppId = "MyApp",
        AIClientFactory = GetCustomAIClient,
        // ...
    });
    
    static Telerik.Reporting.AI.IClient GetCustomAIClient()
    {
        return new MyCustomAIClient(...);
    }
````
````.NET·Framework
public class CustomResolverReportsController : ReportsControllerBase
    {
        static ReportServiceConfiguration configurationInstance;
    
        static CustomResolverReportsController()
        {
            configurationInstance = new ReportServiceConfiguration
            {
                HostAppId = "MyApp",
                AIClientFactory = GetCustomAIClient,
                // ...
            };
        }
    }
    
    static Telerik.Reporting.AI.IClient GetCustomAIClient()
    {
        return new MyCustomAIClient(...);
    }
````