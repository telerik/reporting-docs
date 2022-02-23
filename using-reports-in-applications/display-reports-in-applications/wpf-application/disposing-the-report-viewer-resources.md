---
title: Disposing the Report Viewer Resources
page_title: Disposing the Report Viewer Resources 
description: Disposing the Report Viewer Resources
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/disposing-the-report-viewer-resources
tags: disposing,the,report,viewer,resources
published: True
position: 4
---

# Disposing the Report Viewer Resources



The WPF Report Viewer can be hosted in different types of controls, producing a number of scenarios where the resources, occupied by the viewer,          cannot be disposed automatically, thus causing a memory leak.         The default behavior of WPF Report Viewer is to create its model when instantiated and dispose it when its owner window is closed.         The Report Viewer instance adds a handler to the owner window's          [Closed event](https://docs.microsoft.com/en-us/dotnet/api/system.windows.window.closed?view=netframework-4.0)          to ensure that the model and its resources will be disposed when the window is closed.         This corresponds with the most common case of hosting the WPF Report Viewer in a WPF Window.         However, in some scenarios an additional action must be taken to ensure the correct workflow and resources disposal.         Below are shown some specific cases of embedding the WPF Report Viewer in another control.       

## Hosting WPF Report Viewer in a RadWindow

When the            [RadWindow](https://docs.telerik.com/devtools/wpf/controls/radwindow/overview)            is closed, the report viewer disposes its resources. The RadWindow is optimized to be shown again without being instantiated,           which would put the Report Viewer in an invalid state, because the report viewer model is already disposed, but not yet created.           In this scenario it is necessary to set the property  [AutoDisposeModel](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_AutoDisposeModel)  to __false__ to prevent disposing it when the RadWindow is closed.           The model can be explicitly disposed when necessary with calling the  [DisposeModel](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_DisposeModel)  method.         

## Hosting WPF Report Viewer in a RadTabItem which is not being removed from its RadTabControl

In this scenario the WPF Report Viewer is hosted in a            [RadTabItem](https://docs.telerik.com/devtools/wpf/api/telerik.windows.controls.radtabitem)            that is being activated and deactivated while the user navigates through the tabs in the            [RadTabControl](https://docs.telerik.com/devtools/wpf/controls/radtabcontrol/overview2)         . The report viewer and its model are not disposed when the tab loses focus in order to persist the viewer state and avoid reloading it when the tab receives focus again.           In this scenario the report viewer is kept in memory until the owner window is closed. The default behavior of the WPF report viewer will ensure that the resources are properly released.         

## Hosting WPF Report Viewer in a RadTabItem which is being removed from its RadTabControl

In this scenario the WPF Report Viewer is hosted in a            [RadTabItem](https://docs.telerik.com/devtools/wpf/api/telerik.windows.controls.radtabitem)            that is being removed from its            [RadTabControl](https://docs.telerik.com/devtools/wpf/controls/radtabcontrol/overview2)            host.           Since the owner window is not closed, the disposal routine is not called and the report viewer doesn't release the occupied memory, because it holds a reference to its owner window.           In this scenario it is necessary to call the method  [DisposeViewerResources](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_DisposeViewerResources)  and make sure           the property  [AutoDisposeModel](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_AutoDisposeModel)  is set to its default value __true__.           The disposal method can be called on            [Unloaded](https://docs.microsoft.com/en-us/dotnet/api/system.windows.frameworkelement.unloaded)             event of either the viewer or the RadTabItem host.         


The scenarios above are a few of the available variations of embedding the WPF Report Viewer in another control.            It is always advised to examine the memory consumption of the application and use the explicit methods of disposing the viewer resources if necessary.         


# See Also
 

* [AutoDisposeModel](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_AutoDisposeModel)  

* [DisposeViewerResources](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_DisposeViewerResources)  

* [DisposeModel](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_DisposeModel)

