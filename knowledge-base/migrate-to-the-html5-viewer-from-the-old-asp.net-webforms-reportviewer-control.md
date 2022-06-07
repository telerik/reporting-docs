---
title: Upgrade your ASP.NET WebForms ReportViewer control to the new HTML5 Report Viewer.
description: Replace the old ASP.NET WebForms ReportViewer control with the HTML5 Report Viewer.
type: how-to
page_title: Switch to using the HTML5 Viewer instead of the old ASP.NET WebForms ReportViewer control
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

> The **ASP.NET ReportViewer control is obsolete** as of [Telerik Reporting Q3 2015](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q3-2015-(version-9-2-15-930)).  
  
In **Q3 2013** we introduced the HTML5 Report Viewer which is suitable for any web application and it will be further developed. It is recommended to use the HTML5 Viewer of the latest available Telerik Reporting version.  
  
The HTML5 Viewer can display reports created by both existing [Report Designers](../report-designers). Please check the *How it works* section in the overview of the [HTML5 Viewer](../html5-report-viewer) and [How to: Set ReportSource for Report Viewers.](../report-sources-viewers#for-report-viewers-operating-via-telerik-reporting-services)  
  
In general, it is a client-side HTML/JS/CSS based widget that can be added in any web application. For .NET projects there are MVC and WebForms wrappers to ease the configuration of the viewer, where wrappers render the same Javascript object in the page as the original widget will do.  

The HTML5 Viewer can be separated from the Reporting REST service. The viewer sends short messages to get resources which are processed and rendered on the server. Whole data and/or report instances cannot be transferred in a message from the viewer to the server. It is the Reporting REST service that handles the messages and that generates/delivers the requested resources.   
  
The service comes with default report resolvers which attempt to resolve the viewer's *reportSource.Report* string as a **TypeReportSource** or a **UriReportSource**. You can use also a custom report resolver and add custom logic for getting a report by the received string description, and then create other type of report source object. For more details check [REST Service Report Resolver.](../telerik-reporting-rest-service-report-resolver)  
  
Requested report are processed and rendered on the server. The service will place them in the configured cache storage and it will let you reuse the already rendered reports depending on the [service's cache settings](../using-telerik-reporting-in-applications-rest-service-cache-management-overview).  
  
## Solution  
  
 Details how to add an HTML5 Viewer or any of its wrappers are available in the following articles:

- [How To: Use HTML5 Report Viewer in an application](../html5-report-viewer-quick-start)
- [How To: Use HTML5 ASP.NET MVC Report Viewer in an application](../mvc-report-viewer-extension-embedding)
- [How To: Use HTML5 ASP.NET Web Forms Report Viewer](../webforms-report-viewer-controls-embedding)

  
> In case reports have to be modified or created in code, you need a custom resolver for the Reporting REST service, as reports must be resolved on the server where the Reporting REST service is running -  [REST Service Report Resolver.](../telerik-reporting-rest-service-report-resolver).  
  
## Notes

- The recommended troubleshooting approach for the HTML5 Viewer is to use [Fiddler Jam](https://jam.getfiddler.com/) or other proxy tool to check the requests, their responses and statuses. This will let you check requests to the Reporting REST service and if the URLs are correct, if relative paths are resolved correctly.  
 
- Relative paths may need adjustment depending on how the application is hosted - [ASP.NET Web Project Paths](https://docs.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)?redirectedfrom=MSDN).

### See Also

[HTML5 Report Viewer and Reporting REST services](../using-telerik-reporting-in-applications-rest-service-cache-management-overview)
