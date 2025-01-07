---
title: VB Reporting
page_title: VB – Telerik Reporting
description: "VB Reporting is generating and delivering dynamic reports through the Microsoft Visual Basic programming language."
slug: vb-reporting
tags: telerik, reporting, reports, vb, net
published: True
position: 99
---

# Developing VB Reporting Applications

Microsoft provides different programming language for its most popular `.NET` and `.NET Framework` environments. The Visual Basic (VB or VB.NET) is an advanced programming language fully supported by Telerik Reporting.
This article elaborates on developing Telerik Reporting Type [report definitions]({%slug on-telerik-reporting%}#report-definition) with VB, and integrating Telerik Reporting into Web and Desktop Reporting applications.

## Developing VB Report Definitions

The VB Type report definitions are VB Types inheriting the Telerik Reporting base [Report](/api/telerik.reporting.report) type.

The easiest and recommended approach for creating such a report in the .NET Framework is with the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}). The designer offers also a converter from declarative report definitions (TRDP and TRDX files) as explained in the article [Importing Reports Created with the Standalone or Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/how-to-import-reports-created-with-standalone-report-designer%}).

VB reports are supported also in .NET. The Visual Studio Report Designer is not yet available for .NET and the recommended approach for developing such reports is described in the KB article [How to use Visual Studio Report Designer to edit CS Reports in .NET Projects]({%slug how-to-use-vs-designer-in-dotnet-core%}).

## VB Desktop Reporting Applications

### Displaying Reports in VB Desktop Reporting Applications

The Telerik Reporting product provides the following Report Viewers:

* [Windows Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})
* [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})
* [WinUI Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview%})

#### Implementation

The Desktop Report Viewers may be embedded in .NET and .NET Framework Visual Basic projects. The steps for the corresponding viewers and environments are described in the following sections:

##### Implementing in VB projects targeting .NET Framework 4.6.2 and above

* [Adding the Windows Forms Report Viewer to a Windows Forms .NET Framework Project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-framework-project%})
* [Integrating the WPF Report Viewer in .NET Framework]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project%})

##### Implementing in VB projects targeting .NET 6.0 and above

The following Report Viewers may be configured manually in VB desktop projects. There are no Visual Studio Reporting templates available for Visual Basic projects targeting .NET:

* [Adding the Windows Forms Report Viewer Control to a Windows Forms .NET Project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-report-viewer-to-a-windows-forms'-.net-core-project%})
* [Integrating the WPF Report Viewer in .NET]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-core-project%})
* [Integrating the WinUI Report Viewer in .NET 6]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/how-to-add-report-viewer-to-a-.net-5-application%})

### Generating Reports in VB Desktop Reporting Applications

The VB Desktop Report Viewers may use an Embedded Reporting Engine, a [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}), or a [Telerik Report Server](https://docs.telerik.com/report-server/introduction). The [Connection String to Report Engine]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine%}) determines the engine type used by the viewer.

The Embedded Reporting Engine is integrated within the viewer of the VB Reporting project.

The Reporting REST Service provides an Application Programming Interface (API) over HTTP to the Reporting Engine that processes and renders [Telerik Reports]({%slug on-telerik-reporting%}#report-definition). The fully functional implementation of the service is available in the `Telerik.Reporting.Services.WebApi` (for the .NET Framework) and `Telerik.Reporting.Services.AspNetCore` (for .NET) assembly/package. It may be embedded in any Web VB Reporting Application and exposed in a custom controller (for example, `ReportsController`) inheriting the basic `ReportsControllerBase` class. The `ReportsController` may be used as a source of Report documents by Web VB Reporting, Desktop VB Reporting, and other third-party client applications.

The Report Server is a separate application exposing a [Web API](https://docs.telerik.com/report-server/implementer-guide/apis/rest-api/v2/api-reference) that may be used by the viewers in VB Reporting applications to request reports.

## VB Web Reporting Applications

### Displaying Reports in VB Web Reporting Applications

#### Web Implementation

##### Implementing in VB Web projects targeting .NET Framework 4.6.2 and above

##### Implementing in VB Web projects targeting .NET 6.0 and above


### Generating Reports in VB Web Reporting Applications

## See Also

* [Report Definitions]({%slug on-telerik-reporting%}#report-definition)
* [Displaying Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%})
* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
* [Telerik Report Viewer and Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%})
