---
title: Overview
page_title: WPF Report Viewer at a Glance
description: "Learn about what are the minimum requirements to use the Telerik Reporting WPF Report Viewer and how it works."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview
tags: overview
published: True
reporting_area: WPF
position: 0
previous_url: /wpf-report-viewer-intro, /embedding-reports/display-reports-in-applications/wpf-application/, /wpf-report-viewer
---

# WPF Report Viewer Overview

The WPF Report Viewer allows developers to deliver reports produced by Telerik Reporting to any rich application developed with WPF.

![An image of the WPF Report Viewer with the Windows11 System theme](images/WpfViewer_Windows11SystemTheme02.png)

The toolbar of the WPF Report Viewer provides basic functionality for interacting with the currently loaded report:

* Navigate back in history
* Navigate forward in history
* Refresh
* Go to the first page
* Go to the previous page
* Go to a specific page
* Total number of pages
* Go to the next page
* Go to the last page
* Print Preview: switches between __Logical__ and __Physical__ page renderer. See [Rendering and Paging]({%slug telerikreporting/designing-reports/rendering-and-paging/overview%}) for more information.
* Print
* Export: see [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}) for the available export formats.
* Show/Hide document map
* Show/Hide parameters area
* Zooming
* Search in report contents
* Show/Hide the AI Prompt Dialog. Currently supported only when the viewer is connected to a remote Telerik Reporting REST Service that has the [AI-Powered Insights]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights%}) functionality enabled.

To use the WPF Report Viewer, you need a WPF application. To create such, you need the following tools installed:

## System Requirements

* Visual Studio 2012 or later.
* .NET Framework 4 or above (.NET Framework 4 __Client Profile__ is not supported)
* .NET {{site.mindotnetversion}}+
* (optional) Expression Blend

## How it works

The WPF ReportViewer control is a composite of Telerik UI for WPF controls. The viewer's functionality resides in `Telerik.ReportViewer.Wpf.dll` and the viewer's UI in `Telerik.ReportViewer.Wpf.xaml`.

> The WPF ReportViewer control's template can be modified through the corresponding theme's [Telerik.ReportViewer.Wpf.xaml]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/setting-a-theme-(using-implicit-styles)%}) file and the [WPF ReportViewer](/api/Telerik.ReportViewer.Wpf.ReportViewer).

The purpose of the WPF ReportViewer control is to display Telerik Reports and allow the user to interact with them. By default, reports are processed and rendered on the client machine unless a [Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is used. The report in the viewer is rendered in as standard `XAML` elements, as `Canvas` and `TextBlock`, through Telerik Reporting XAML for the WPF rendering mechanism.

## See Also

* [How to Add report viewer to a WPF.NET Framework project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project%})
* [Setting a Theme (Using Implicit Styles)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/setting-a-theme-(using-implicit-styles)%})
