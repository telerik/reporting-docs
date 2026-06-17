---
title: Migrate from the ASP.NET WebForms ReportViewer to the HTML5 Report Viewer
description: "Step-by-step guide to replacing the deprecated ASP.NET WebForms ReportViewer with the HTML5 Web Forms Report Viewer in Telerik Reporting."
type: how-to
page_title: ASP.NET WebForms ReportViewer to HTML5 Report Viewer Migration
slug: migrate-to-the-html5-viewer-from-the-old-asp.net-webforms-reportviewer-control
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
			<td>Web Projects</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>Legacy ASP.NET Report Viewer</td>
		</tr>
	</tbody>
</table>

  
## Description

>warning The ASP.NET WebForms ReportViewer control was declared obsolete in [Telerik Reporting Q3 2015](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q3-2015-(version-9-2-15-930)) and was removed from the product distribution starting with the [2024 Q4 release](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2024-q4-18-3-24-1112). Telerik strongly recommends migrating to the [HTML5 Web Forms Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview), which includes the latest features, performance improvements, and security updates.
  
The HTML5 Report Viewer, introduced in Q3 2013, is suitable for any web application and receives ongoing development. Use the HTML5 Viewer from the latest available Telerik Reporting version.  
  
The HTML5 Viewer can display reports created by both existing [Report Designers](slug:telerikreporting/designing-reports/report-designer-tools/overview). See the **How It Works** section in the [HTML5 Report Viewer overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview) and [How to Set ReportSource for Report Viewers](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers#for-report-viewers-operating-via-telerik-reporting-services) for background on how the viewer resolves and displays reports.
  
The HTML5 Viewer is a client-side HTML/JavaScript/CSS widget that can be added to any web application. For .NET projects, MVC and WebForms wrappers simplify viewer configuration. The wrappers render the same JavaScript object in the page as the standalone widget.  

The HTML5 Viewer communicates with a Reporting REST Service that processes and renders reports on the server. The viewer exchanges lightweight messages with the service; full data or report instances are never transferred across the wire.   
  
The service includes default report resolvers that resolve the viewer's `reportSource.Report` string as a `TypeReportSource` or a `UriReportSource`. You can also implement a custom report resolver to add logic for resolving a report by its string identifier. For details, see [REST Service Report Source Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview).
  
Rendered reports are stored in the configured cache, allowing the service to reuse already-rendered reports based on the [cache settings](slug:telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services).
  
## Solution  
  
 Details how to add an HTML5 Viewer or any of its wrappers are available in the following articles:

- [How To: Use HTML5 Report Viewer in an application](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service)
- [How To: Use HTML5 ASP.NET MVC Report Viewer in an application](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/how-to-use-html5-asp.net-mvc-report-viewer-with-rest-service)
- [How To: Use HTML5 ASP.NET Web Forms Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-rest-service)

  
> In case reports have to be modified or created in code, you need a custom resolver for the Reporting REST service, as reports must be resolved on the server where the Reporting REST service is running -  [REST Service Report Resolver.](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview).  
  
## Notes

- To troubleshoot the HTML5 Viewer, use [Fiddler Everywhere Reporter]( https://www.telerik.com/fiddler/fiddler-everywhere-reporter) or another proxy tool to inspect requests to the Reporting REST Service, verify that URLs are correct, and confirm that relative paths resolve as expected.
 
- Relative paths may need adjustment depending on how the application is hosted. See [ASP.NET Web Project Paths](https://docs.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)?redirectedfrom=MSDN) for guidance.

## See Also

- [HTML5 Report Viewer and Reporting REST Services](slug:telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services)
