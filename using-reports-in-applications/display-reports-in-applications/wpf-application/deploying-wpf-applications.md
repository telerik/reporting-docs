---
title: Deploying WPF Applications
page_title: Deploying WPF Applications | for Telerik Reporting Documentation
description: Deploying WPF Applications
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/deploying-wpf-applications
tags: deploying,wpf,applications
published: True
position: 7
---

# Deploying WPF Applications



This article describes how to deploy WPF Application that use Telerik Reporting.

## 

To deploy a WPF Application project containing [WPF report viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%}) used to deliver           reports produced by Telerik Reporting you need to make sure the assemblies physically exist           in the bin folder of your application:         

__Required assemblies:__ 

* __Telerik.Reporting.dll__ 

* __Telerik.ReportViewer.Wpf.dll__ 

* __Telerik.ReportViewer.Wpf.Themes.dll__  If embedded implicit XAML styles are used.             

__Optional assemblies:__ 

These assemblies add up to the core reporting functionality and should be used only if you need the specific feature.           They are responsible for additional support formats, database session or retrieving data from an OLAP cube.         

* XPS rendering extension requires __Telerik.Reporting.XpsRendering__  assembly (Telerik.Reporting.XpsRendering.dll).             

* DOCX/PPTX/XLSX rendering extensions require __Telerik.Reporting.OpenXmlRendering.dll__                and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (*DocumentFormat.OpenXml.dll*                v.2.0.5022.0 or above with                 [binding redirect](http://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx) ).             

* [Database Session State Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%})               requires __Telerik.Reporting.Cache.Database.dll__  and __Telerik Data Access__ .             

* [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) requires               __Telerik.Reporting.Adomd.dll__  and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%})               (*Microsoft.AnalysisServices.AdomdClient.dll*  v.10.0.0.0 or [above with proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%})).             

The WPF report viewer requires the corresponding            [Telerik UI WPF](http://www.telerik.com/products/wpf/whats-new/release-history.aspx)  assemblies, available at the time of the Telerik Reporting release:         

* __Telerik.Windows.Data.dll__ 

* __Telerik.Windows.Controls.dll__ 

* __Telerik.Windows.Controls.Input.dll__ 

* __Telerik.Windows.Controls.Navigation.dll__ 

# See Also

