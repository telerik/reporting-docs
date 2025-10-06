---
title: Deploying
page_title: Deploying the WPF Report Viewer in Applications
description: "Learn about the required and optional assemblies/packages needed for deploying the WPF Report Viewer in applications."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/deploying-wpf-applications
tags: deploying,wpf,applications
published: True
reporting_area: WPF
position: 7
previous_url: /installation-deploying-on-wpf-application
---

# Deploying in WPF Applications Overview

This article describes how to deploy WPF Applications that use Telerik Reporting.


To deploy a WPF Application project containing [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%}), used to deliver reports produced by Telerik Reporting, you need to make sure the assemblies physically exist in the `bin` folder of your application:

__Required assemblies:__

* `Telerik.Reporting.dll`
* `Telerik.ReportViewer.Wpf.dll`
* `Telerik.ReportViewer.Wpf.Themes.dll` (if embedded implicit XAML styles are used)

The WPF report viewer requires the corresponding [Telerik UI WPF](https://www.telerik.com/products/wpf/overview.aspx) assemblies, available at the time of the Telerik Reporting release:

* `Telerik.Windows.Data.dll`
* `Telerik.Windows.Controls.dll`
* `Telerik.Windows.Controls.Input.dll`
* `Telerik.Windows.Controls.Navigation.dll`

>note The corresponding NuGet packages can be referenced instead of the assemblies - [Adding the Telerik Private NuGet Feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%})

__*Optional assemblies*__:

Those assemblies add up to the core reporting functionality and should be used only if you need the specific feature. They are responsible for additional support formats, database session or retrieving data from an `OLAP` cube.

* XPS rendering extension requires `Telerik.Reporting.XpsRendering` assembly.
* DOCX/PPTX/XLSX rendering extensions require `Telerik.Reporting.OpenXmlRendering.dll` and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (`DocumentFormat.OpenXml.dll` v.2.0.5022.0 or above with [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element).
* [Database Session State Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%}) requires `Telerik.Reporting.Cache.Database.dll` and `Telerik Data Access`.
* [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) requires `Telerik.Reporting.Adomd.dll` and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (`Microsoft.AnalysisServices.AdomdClient.dll` v.10.0.0.0 or above with [proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%})).
