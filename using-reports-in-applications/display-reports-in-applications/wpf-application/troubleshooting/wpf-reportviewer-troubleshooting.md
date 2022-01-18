---
title: WPF ReportViewer Troubleshooting
page_title: WPF ReportViewer Troubleshooting | for Telerik Reporting Documentation
description: WPF ReportViewer Troubleshooting
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/troubleshooting/wpf-reportviewer-troubleshooting
tags: wpf,reportviewer,troubleshooting
published: True
position: 0
---

# WPF ReportViewer Troubleshooting



The article provides troubleshooting for commonly met issues with the WPF ReportViewer control.

The WPF ReportViewer displays content rendered through the Reporting WPF XAML Rendering mechanism that produces XAML loaded by the control.       

## The viewer throws a MethodAccessException

When connecting the WPF Report Viewer to Telerik Report Server or Telerik Reporting REST API Service, the following exception may occur:         

    
          Attempt by method 'Telerik.Reporting.Services.HttpClient.HttpRequestHelper.GetResponseFromPost(System.Net.Http.HttpResponseMessage)'
          to access method 'Telerik.Reporting.Services.HttpClient.HttpRequestHelper.GetResponseFromPost<T>
          (System.Net.Http.HttpResponseMessage, System.Collections.Generic.IEnumerable`1<System.Net.Http.Formatting.MediaTypeFormatter>)' failed.
        

The most common reason for this exception is an incorrect version of the web client assemblies. The viewer requires the            [Microsoft.AspNet.WebApi.Client](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.Client/4.0.30506)            NuGet package. The assemblies required by the viewer can be installed via Visual Studio NuGet Package Manager or            [Visual Studio Package Manager Console](https://docs.nuget.org/consume/package-manager-console).           For more details, please check the following article:            [How To: Use WPF Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-report-server%}).         

## The WPF ReportViewer is not visible on running the application.

As of Telerik Reporting Q1 2014, the WPF ReportViewer control uses implicit styles.           When the viewer's template (__Telerik.ReportViewer.Wpf.xaml__) file is not loaded correctly, the viewer            is not displayed.           Double-check if XAML resources are loaded in the application.         

More details about the settings required by the WPF ReportViewer are available in            [WPF ReportViewer: Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%}).         

Other possible causes for the issue are described in the following article:            [Missing Controls in the UI](https://docs.telerik.com/devtools/wpf/common-information/troubleshooting/invisible-controls).         

## The WPF application cannot be built.

In some cases the application build process fails with the following or a similar message, related to XAML resources:         

                      
        The name "XYZControl" does not exist in the namespace "clr-namespace:Telerik.XXXX;assembly=Telerik.XXXX". [path]\Themes\[theme_name]\Telerik.XXXX.xaml.
        

This message can appear after upgrading to a newer version of Telerik Reporting or when the styles applied to the WPF Report Viewer are not implicit.           As of Telerik Reporting Q1 2014, the WPF ReportViewer control uses implicit styles.           When the viewer's template (__Telerik.ReportViewer.Wpf.xaml__) file is not loaded correctly, the viewer is not displayed.           Also if the additionally required XAML files are not loaded or they are not of a version synchronized with Telerik Reporting, you may receive such errors.           Double-check if XAML resources are loaded in the application and if dependencies between Telerik Reporting and Telerik UI for WPF are considered           - [WPF Dependenices per release]({%slug telerikreporting/upgrade/overview%}).         

More details about the settings required by the WPF ReportViewer are available in [WPF ReportViewer: Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%}).         

> [Telerik Reporting Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) will update only references to Telerik Reporting assemblies and configuration settings.             You will have to manually update the related  __Telerik.ReportViewer.Wpf.xaml__ files, and Telerik UI             for WPF XAML files distributed by Telerik Reporting. This includes manual update of Telerik UI for WPF assemblies distributed by Telerik Reporting.           If you use Telerik UI for WPF as a separate product, you can run  [Telerik UI for WPF Upgrade Wizard](http://docs.telerik.com/devtools/wpf/visual-studio-extensions/for-wpf-vs-extensions-upgrading)  which will update Telerik UI for WPF assembly references and XAML resources automatically.           

## "Cannot resolve dependency to assembly 'Telerik.Windows.XXXX...'." error on running the application.

The WPf ReportViewer control is built against a specific version of Telerik UI for WPF on each official release. Please check the dependencies           for the used Telerik Reporting version - [WPF Dependenices per release]({%slug telerikreporting/upgrade/overview%}). You can           update assembly references accordingly or add  [binding redirect](http://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx).         

More details about the settings required by the WPF ReportViewer are available in [WPF ReportViewer: Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%}).         

## The report in the WPF ReportViewer is messed or different than the design-time preview.

The WPF ReportViewer displays the report rendered in XAML format. External styles may affect the produced XAML that contains standard elements like Canvas, TextBlock and etc.           Test excluding styles to check if they change the displayed content, or test exporting in a format like PDF.

