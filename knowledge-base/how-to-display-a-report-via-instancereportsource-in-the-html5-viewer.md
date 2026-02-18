---
title: How to display a report via InstanceReportSource in the HTML5 Viewer
description: "Learn how to use InstanceReportSource to display reports in the Telerik Reporting HTML5 Report Viewers."
type: how-to
page_title: Preview a report in the report viewer through an InstanceReportSource
slug: how-to-display-a-report-via-instancereportsource-in-the-html5-viewer
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5 Report Viewer</td>
	</tr>
</table>

## Description

The [HTML5 Viewer]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview %}) and [Reporting REST service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview %}) use client-server technology, different than the MVC model. Whole data objects cannot be sent in a request to the server. Even if the content is serialized, it may reach technology limitations in the size of requests. The HTML5 viewer sends short string messages describing which report, what parameters, and the rendering format to be used on the server. Reports are processed and rendered on the server.

The available MVC and WebForms wrappers of the HTML5 Viewer let you specify which report to display through the viewer's *ReportSource.Report*and *ReportSource.Parameters,* in code in a declarative manner.

- When you use a client-side **TypeReportSource** (Report = *TypeReportSource.TypeName* and Parameters = *TypeReportSource.Parameters*). The type name is an [assembly qualified name](https://docs.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname) of a report class.
- When you use a client-side **UriReportSource** (Report = *UriReportSource.Uri* and Parameters=_UriReportSource.Parameters_). The URI is a relative path to a file on the server where the Reporting REST service is hosted. The relative path is mapped to the folder specified by the service's `ReportFileResolver`.

The HTML5 Javascript widget lets you specify directly the *reportSource.report* as string, and the *reportSource.parameters* as key-value pairs.

The **InstanceReportSource** is generally used alongside a **custom ReportSourceResolver** as it is a great approach for updating the report's/a report item's **DataSource** at runtime. The **ObjectDataSource** and the **JsonDataSource** are the data source components usually used when such scenarios occur.

## Solution

The following is an example of how to update a **TRDP** report's **DataSource** with a new **JsonDataSource**. The example code could used in a custom ReportSourceResolver's [Resolve method](/api/telerik.reporting.services.ireportsourceresolver#collapsible-Telerik_Reporting_Services_IReportSourceResolver_Resolve_System_String_Telerik_Reporting_Services_OperationOrigin_System_Collections_Generic_IDictionary_System_String_System_Object__). This method is called whenever the engine needs to create a **ReportSource** instance based on the parameter named _report_.

```C#
 Report report;
 var reportPackager = new Telerik.Reporting.ReportPackager();
 var reportSource = new Telerik.Reporting.UriReportSource();
 reportSource.Uri = "someReport.trdp";

 using (var sourceStream = File.OpenRead(reportSource.Uri))
{
	report = reportPackager.Unpackage(sourceStream);
}

 report.DataSource = new JsonDataSource() { Source = ... };
 // For example, if instead a report item, such as a table, needs to have its DataSource updated
 // Table item = (Table)report.Items.Find("table1", true).FirstOrDefault();
 // item.DataSource = new JsonDataSource() { Source = ... };

  return new InstanceReportSource() { ReportDocument = report };
```

## Notes

Each HTML5 Viewer provides means to let you send a custom string and parameters collection, in case of using a [custom resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) for the reporting rest service. Such a resolver is required if you need to create/customize a report before displaying it.

After creating/modifying the report on the server, you can return an [InstanceReportSource](/api/telerik.reporting.instancereportsource) instance from the resolver's [Resolve method](/api/telerik.reporting.services.ireportsourceresolver#collapsible-Telerik_Reporting_Services_IReportSourceResolver_Resolve_System_String_Telerik_Reporting_Services_OperationOrigin_System_Collections_Generic_IDictionary_System_String_System_Object__).

## See Also

- [How to Set ReportSource for Report Viewers.]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%})
- [How to Implement a Custom Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%})
