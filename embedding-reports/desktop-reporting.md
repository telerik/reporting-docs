---
title: Desktop Reporting
page_title: Desktop Reporting – Telerik Reporting
description: "Desktop Reporting is a framework for generating and delivering dynamic reports in desktop apps for Microsoft Windows."
slug: desktop-reporting
tags: telerik, reporting, reports, desktop, net
published: True
position: 95
reportingArea: General
---

# Developing Desktop Reporting Applications

Microsoft provides different Desktop frameworks for Windows operating systems. This article offers an overview of the most popular approaches for integrating and using Telerik Reporting into Desktop Reporting applications.

## Displaying Reports in Desktop Reporting Applications

The Telerik Reporting product provides the following Report Viewers:

* [Windows Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})
* [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})
* [WinUI Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview%})

### Implementation

The Desktop Report Viewers may be embedded in .NET and .NET Framework projects. The steps for the corresponding viewers and environments are described in the following sections:

#### Implementing in projects targeting .NET {{site.mindotnetversion}} and above

* [Adding the Windows Forms Report Viewer Control to a Windows Forms .NET Project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-core-project%})
* [Integrating the WPF Report Viewer in .NET]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-core-project%})
* [Integrating the WinUI Report Viewer in .NET {{site.mindotnetversion}}]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/how-to-add-report-viewer-to-a-.net-5-application%})

#### Implementing in projects targeting .NET Framework 4.6.2 and above

* [Adding the Windows Forms Report Viewer to a Windows Forms .NET Framework Project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-framework-project%})
* [Integrating the WPF Report Viewer in .NET Framework]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project%})

## Generating Reports in Desktop Reporting Applications

The Desktop Report Viewers may use an Embedded Reporting Engine, a [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}), or a [Telerik Report Server](https://docs.telerik.com/report-server/introduction). The [Connection String to Report Engine]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}) determines the engine type used by the viewer.

The Embedded Reporting Engine is integrated within the viewer.

The Reporting REST Service provides an Application Programming Interface (API) over HTTP to the Reporting Engine that processes and renders [Telerik Reports]({%slug on-telerik-reporting%}#report-definition). The fully functional implementation of the service is available in the `Telerik.Reporting.Services.WebApi` (for the .NET Framework) and `Telerik.Reporting.Services.AspNetCore` (for .NET) assembly/package. It may be embedded in any Web Reporting Application and exposed in a custom controller (for example, `ReportsController`) inheriting the basic `ReportsControllerBase` class. The `ReportsController` may be used as a source of Report documents by Web Reporting, Desktop Reporting, and other third-party client applications.

The Report Server is a separate application exposing a [Web API](https://docs.telerik.com/report-server/implementer-guide/apis/rest-api/v2/api-reference) that may be used by the viewers to request reports.

## See Also

* [Displaying Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%})
* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
* [Telerik Report Viewer and Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%})
