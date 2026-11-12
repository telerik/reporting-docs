---
title: Migrate from the ASP.NET WebForms ReportViewer to the HTML5 Report Viewer
description: "Step-by-step guide to replacing the deprecated ASP.NET WebForms ReportViewer with the HTML5 Web Forms Report Viewer in Telerik Reporting."
type: how-to
page_title: ASP.NET WebForms ReportViewer to HTML5 Report Viewer Migration
slug: migrate-to-the-html5-viewer-from-the-old-asp.net-webforms-reportviewer-control
res_type: kb
---

## Environment

The article applies to the following environment:

| Product | Project type | Report viewer |
|---|---|---|
| Progress® Telerik® Reporting | Web projects | Legacy ASP.NET Report Viewer |

## Description

>warning The ASP.NET WebForms ReportViewer control was declared obsolete in [Telerik Reporting Q3 2015](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q3-2015-(version-9-2-15-930)) and was removed from the product distribution starting with the [2024 Q4 release](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2024-q4-18-3-24-1112). Telerik strongly recommends migrating to the [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}), which includes the latest features, performance improvements, and security updates.
The HTML5 Report Viewer, introduced in Q3 2013, supports web applications and continues to receive updates. Use the viewer from the latest available Telerik Reporting version.

The HTML5 Viewer displays reports created with existing [report designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}). For background about report resolution, see [how the HTML5 Viewer works]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and [how to set `ReportSource` for report viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%}#set-up-report-viewers-that-operate-via-telerik-reporting-services).

The HTML5 Viewer is a client-side HTML, JavaScript, and CSS widget that you can add to any web application. MVC and Web Forms wrappers simplify configuration in .NET projects. The wrappers render the same JavaScript object as the standalone widget.

The HTML5 Viewer communicates with a Reporting REST Service that processes and renders reports on the server. The viewer exchanges lightweight messages with the service. Full data and report instances remain on the server.

The service includes default report resolvers that interpret the viewer's `reportSource.Report` string as a `TypeReportSource` or `UriReportSource`. Implement a custom report resolver when you need to resolve a report by its string identifier. For details, see the [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}).

The service stores rendered reports in the configured cache. It can reuse rendered reports according to the [HTML5 Viewer and Reporting REST Service cache settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%}).

## Solution

Articles that explain how to add the HTML5 Viewer or its wrappers are available here:

- [Add the HTML5 Report Viewer to an application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%})
- [Add the HTML5 ASP.NET MVC Report Viewer to an application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/how-to-use-html5-asp.net-mvc-report-viewer-with-rest-service%})
- [Add the HTML5 ASP.NET Web Forms Report Viewer to an application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-rest-service%})

>important If you modify or create reports in code, implement a custom resolver for the Reporting REST service. The service must resolve reports on the server where it runs. See the [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}).

## Notes

- To troubleshoot the HTML5 Viewer, use [Fiddler Everywhere Reporter](https://www.telerik.com/fiddler/fiddler-everywhere-reporter) or another proxy tool. Inspect requests to the Reporting REST Service, verify URLs, and confirm that relative paths resolve as expected.

- Adjust relative paths based on how you host the application. See [ASP.NET Web Project Paths](https://docs.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)?redirectedfrom=MSDN) for guidance.

## See Also

- [Configure caching for the HTML5 Report Viewer and Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%})
