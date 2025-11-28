---
title: Manual Setup in .NET Framework
page_title: Integrating the WPF Report Viewer in a WPF .NET Framework
description: "Learn how the WPF Report Viewer can be manually set up in a .NET Framework project with a few simple steps in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project
tags: how,add,,manually,report,viewer,wpf,.net,framework,project
published: True
reportingArea: WPF
position: 3
previous_url: /wpf-report-viewer-manual-setup
---

# Manually setting up the WPF Report Viewer in .NET Framework

This article explains the steps needed to manually create an application that uses the WPF report viewer.

## Add the WPF Report Viewer to the application

1. Create a new `WPF Application` project in Visual Studio. Target `.NET Framework 4.0 or higher`.

1. Add references to the following [Telerik UI for WPF](https://www.telerik.com/products/wpf/overview.aspx) `NoXaml` assemblies:

	+ *Telerik.Windows.Controls.dll*
	+ *Telerik.Windows.Controls.Input.dll*
	+ *Telerik.Windows.Controls.Navigation.dll*
 	+ *Telerik.Windows.Controls.ConversationalUI.dll*
	+ *Telerik.Windows.Data.dll*

	In case you are still not prepared to migrate to *Implicit Styling*, you can use the binaries that include the XAML. However, you will still have to merge all the XAML files mentioned in the next step; otherwise, the Report Viewer will not show up, as it will have no styling.
	
	In case [Telerik UI for WPF](https://www.telerik.com/products/wpf/overview.aspx) is used only for the WPF Report Viewer, reference the *Telerik UI for WPF* assemblies available with Telerik Reporting. They are internally unlocked for the WPF Report Viewer, but can only be used with the report viewer. The `.NET Framework` assemblies containing *Telerik UI for WPF* are located in `%programfiles(x86)%\Progress\Telerik Reporting {{site.suiteversion}}\Bin\WpfViewerDependencies\Framework`.
	
	The WPF ReportViewer is built with the latest official release of [Telerik UI for WPF](https://www.telerik.com/products/wpf/overview.aspx). In this way, we provide a trouble-free upgrade for most users. This means that you can use the latest version of **Telerik UI for WPF** in your project and report viewer. The Telerik UI for WPF assemblies may have a greater version (service pack or internal build) than the one with which the WPF report viewer control targets. In this case, assembly binding redirects are required (see [Binding Redirects](#binding-redirects) topic below).

1. The Telerik UI for WPF XAML files are located in `%programfiles(x86)%\Progress\Reporting {{site.suiteversion}}\Wpf\Themes)`.

1. Drag and drop the **ReportViewer** control from the toolbox in a WPF window. If the ReportViewer is not available in the toolbox, you can add it using the instructions from the **How to add the WPF ReportViewer to the toolbox** topic below.

1. Add reference to the following `Telerik.Reporting` assemblies in your project:

   - _Telerik.Reporting.dll_
   - _Telerik.ReportViewer.Wpf.dll_
   - _Telerik.ReportViewer.Wpf.Themes.dll_

1. The next step is to merge these ResourceDictionaries in the App.xaml file:

   {{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\App.xaml}}

	For the above sample, we have used the __Fluent__ theme. The WPF Report Viewer supports all the Telerik UI for WPF themes. To style the viewer with another theme, change the above XAML snippet __Fluent__ with the desired theme name.

1. Set the `ReportSource` for the report viewer. For more information, see [How to Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%}). This can be done either declaratively or programmatically:

   - Specifying a report source declaratively, we would use type report source for this example:

     {{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window1.xaml}}

   - Setting a report source at run time. The following code snippet illustrates how to assign a report source to the WPF ReportViewer in the [`Window.Loaded`](https://learn.microsoft.com/en-us/dotnet/desktop/wpf/advanced/how-to-handle-a-loaded-event?view=netframeworkdesktop-4.8) event handler:

     {{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window3.xaml}}
     {{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window3.xaml.cs}}
     {{source=CodeSnippets\VB\API\Telerik\ReportViewer\Wpf\Window3.xaml}}
     {{source=CodeSnippets\VB\API\Telerik\ReportViewer\Wpf\Window3.xaml.vb}}

## Setting DataContext

Setting a `DataContext` to a parent element of ReportViewer leads to *BindingExpression path errors*, which can be safely __ignored__. This happens because ReportViewer, internally, uses a *view model* and the `DataContext` gets propagated to the control before the view model is initialized. This leads to a mismatch between the properties expected by ReportViewer and the ones in the DataContext. At a later stage, the DataContext of ReportViewer's child elements is set to the expected view model (`ReportViewModel`), the bindings in the control get evaluated, therefore the errors get resolved. To avoid the binding errors, you can set the `DataContext` of the parent element in the [`Loaded`](https://learn.microsoft.com/en-us/dotnet/api/system.windows.frameworkelement.loaded?view=windowsdesktop-7.0) event handler of ReportViewer.

## Binding Redirects

In case you use _Telerik UI for WPF_ version greater than the **latest official release** (service pack or internal build), you have to redirect all assemblies required by the _Telerik WPF ReportViewer_ to their latest versions. To do this, add the following **bindingRedirects** to your `app.config` and replace the `2010.1.421.35` with the exact version of _Telerik UI for WPF_ assemblies:

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\WpfViewerBindings.xml}}

> [Redirecting Assembly Versions](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/redirect-assembly-versions) is a standard .NET technique for resolving assembly version conflicts. `Visual Studio 2013` and newer allow automatic binding redirects. For more details, please check [How to: Enable and Disable Automatic Binding Redirection](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/how-to-enable-and-disable-automatic-binding-redirection).

## How to add the WPF ReportViewer to the toolbox

1. Select a WPF window file (e.g., `Window1.xaml`).
1. Open the toolbox and add your own tab or click on the General tab.
1. Right-click in the selected tab area and select **Choose Items…** from the context menu.
1. The previous step will open the **Choose Toolbox Items** dialog. Select the **WPF Components** tab and find the **ReportViewer** component from the **Telerik.ReportViewer.Wpf** assembly.
1. Click **OK**.

## See Also

- [Adding Report Viewer to a WPF .NET Framework Project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project%})
