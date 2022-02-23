---
title: Run Time
page_title: Run Time 
description: Run Time
slug: telerikreporting/troubleshooting/run-time
tags: run,time
published: True
position: 2
---

# Run Time



## Cannot create an object of type 'Telerik.Reporting.Report' from its string representation 'MyNameSpace.MyClass, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null' for the 'Report' property.

This error might occur if you are using website and you have the           report class in the website directly. This is due to the fact that when           using a website, after rebuild the following will always be different           and it will not match with the originally assigned report:           App_Code.__unch8s_n__.           Thus we recommend following our [          best practices        ](66CD7D60-7708-42D5-8BB4-506676E8679E) and have the report in a separate class library that           is referenced in the aplication/website.         

## Unable to serialize the session state. In 'StateServer' and 'SQLServer' mode, ASP.NET will serialize the session state objects, and as a result non-serializable objects or MarshalByRef objects are not permitted. The same restriction applies if similar serialization is done by the custom session state store in 'Custom' mode.

This exception might surface if you try to use objects which           do not implement ISerializable for a Report/Data Item data source. For example, if           this is an IList, you can try using a List instead as shown in our            [cars example](http://demos.telerik.com/reporting/list-bound-report).           You can also use the NeedDataSource event of the report and assign the data source to the "processing report", thus avoiding any need for serialization/deserialization.           Another approach is to use a DataSet/DataTable:         

    
````C#
DataTable dt = new DataTable();
DataColumn col = new DataColumn("ColumnName", typeof(string));
//....
dt.Columns.Add(col);
foreach (object Item in MyIList)
{
    DataRow row = dt.NewRow();
    row["ColumnName"] = Item;
    //.....
    dt.Rows.Add(row);
}
````

         
      

## When deploying a project with Telerik Reporting on a server, you  get the following error: Could not load file or assembly 'Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' or one of its dependencies. The system cannot find the file specified.

During the installation of Telerik Reporting on a dev machine,           the Telerik Reporting assemblies are added to GAC. When deploying a project           using Visual Studio's built-in functionality, the assemblies from the GAC           are not copied automatically, so you need to make sure the assemblies physically exist in the bin folder of your application.           Full details are available in the [Deploying Web Applications]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/deploying-web-applications%}) help article.         

## The expression contains undefined function call MyUserFunction()

There are three cases in which this error message occurs:

* The function name is typed in manually in the expression, without building the class library, and it does not exist yet.

* Using the function with incorrect number/type of parameters. The passed fields must match the function signature.

* The field specified in the function is null. Make sure such cases are handled in the user function.

## My ASP.NET Web Forms ReportViewer looks messed up - its styles and images are missing

1. Check if runat="server" is present in your web page's head tag.

1. Check if the web report viewer's http handler is registered in the web.config file. If the app is deployed on IIS7 and setup to work in integrated mode,                make sure preCondition attribute is present at the end of Telerik.ReportViewer handler:             

    
      ````XML
<add
    name="Telerik.ReportViewer.axd_*"
    type="Telerik.ReportViewer.WebForms.HttpHandler, Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
    path="Telerik.ReportViewer.axd" verb="*"
    preCondition="integratedMode"
/>
````

1. Check if the report viewer's styles are registered on the page. This can be accomplished with http debugging proxy like Fiddler.

1. Check for global styles defined in the application which affect the page with the report viewer and conflict with the report viewer's styles.
            Remove any style declarations from the page. Make sure the global style rules do not affect HTML elements directly, but are applied through the CssClass property.

