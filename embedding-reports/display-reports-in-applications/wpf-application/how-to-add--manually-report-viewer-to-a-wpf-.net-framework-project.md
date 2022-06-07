---
title: How to Add  manually report viewer to a WPF .NET Framework project
page_title: How to Add  manually report viewer to a WPF .NET Framework project 
description: How to Add  manually report viewer to a WPF .NET Framework project
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project
tags: how,to,add,,manually,report,viewer,to,a,wpf,.net,framework,project
published: True
position: 3
---

# How to Add  manually report viewer to a WPF .NET Framework project

This article explains the steps needed to manually create an application which uses the WPF report viewer. 

## Add the WPF viewer to the application

1. Create a new *WPF Application* project in Visual Studio. Target .NET Framework 4.0 or higher. 

1. Add references to the following *Telerik UI for WPF* NoXaml assemblies: 

	+ *Telerik.Windows.Controls.dll* 

	+ *Telerik.Windows.Controls.Input.dll* 

	+ *Telerik.Windows.Controls.Navigation.dll* 

	+ *Telerik.Windows.Data.dll* 
    
	In case you are still not prepared to migrate to Implicit Styling you can use the binaries that include the xaml. However you will still have to merge all the xaml files mentioned in the next step, otherwise the Report Viewer will not show up as it will have no style. 
	
	In case Telerik UI for WPF is used only for the report viewer, reference the Telerik UI for WPF assemblies available with Telerik Reporting. They are internally unlocked for the WPF Report Viewer but can only be used with the report viewer. The .NET Framework assemblies containing *Telerik UI for WPF* are located in _%programfiles(x86)%\Progress\Telerik Reporting {{site.suiteversion}}\Bin\WpfViewerDependencies\Framework_.
	
	The WPF ReportViewer is build with the latest official release of Telerik UI for WPF. In this way we provide trouble free upgrade for most of the users. This means that you can use the latest version of Telerik UI for WPF in your project and report viewer. It is possible that the Telerik UI for WPF assemblies have a greater version (service pack or internal build) than the one with which the WPF report viewer control targets. In this case assembly binding redirects are required (see [Binding Redirects](#binding-redirects) topic below). 

1. The Telerik UI for WPF xaml files are located in _%programfiles(x86)%\Progress\Reporting {{site.suiteversion}}\Wpf\Themes)_. 

1. Drag and drop the __ReportViewer__ control from the toolbox in a WPF window. If the ReportViewer is not available in the toolbox, you can add it using the instructions from the __How to add the WPF ReportViewer to the toolbox__ topic below. 

1. Add reference to the following __Telerik.Reporting__ assemblies in your project: 

	+ *Telerik.Reporting.dll* 

	+ *Telerik.ReportViewer.Wpf.dll* 

	+ *Telerik.ReportViewer.Wpf.Themes.dll* 

1. The next step is to merge these ResourceDictionaries in the App.xaml file: 

	{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\App.xaml}}
	````XML
<Application x:Class="WpfApplication1.App"
			 xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
			 xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
			 StartupUri="MainWindow.xaml">
		<Application.Resources>
			<ResourceDictionary>
				<ResourceDictionary.MergedDictionaries>
					<ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/System.Windows.xaml" />
					<ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/Telerik.Windows.Controls.xaml" />
					<ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/Telerik.Windows.Controls.Input.xaml" />
					<ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/Telerik.Windows.Controls.Navigation.xaml" />
					<ResourceDictionary Source="/Telerik.ReportViewer.Wpf.Themes;component/Themes/Fluent/Telerik.ReportViewer.Wpf.xaml" />
				</ResourceDictionary.MergedDictionaries>
			</ResourceDictionary>
		</Application.Resources>
	</Application>
````

	For the above sample we have used the Fluent theme. The WPF Report Viewer supports all the Telerik UI for WPF themes. In order to style the viewer with another theme, change the above XAML snippet __Fluent__ with the desired theme name. 

1. Set the __ReportSource__ for the report viewer. For more information, see [How to Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%}). This can be done either declaratively or programmatically: 

	+ Specifying a report source declaratively, we would use type report source for this example: 

		{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window1.xaml}}
		````XML
<Window x:Class="WpfApplication1.Window1"
			xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
			xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
			Title="Window1" Height="451" Width="683"
			xmlns:telerik="clr-namespace:Telerik.ReportViewer.Wpf;assembly=Telerik.ReportViewer.Wpf"
			xmlns:telerikReporting="clr-namespace:Telerik.Reporting;assembly=Telerik.Reporting">
			<Grid>
				<telerik:ReportViewer Name="reportViewer1">
					<telerik:ReportViewer.ReportSource>
						<telerikReporting:TypeReportSource TypeName="Telerik.Reporting.Examples.CSharp.BarcodesReport, CSharp.ReportLibrary" />
					</telerik:ReportViewer.ReportSource>
				</telerik:ReportViewer>
			</Grid>
		</Window>
````

	+ Setting a report source at run time. The following code snippet illustrates how to assign a report source to the WPF ReportViewer in the *Window.Loaded* event handler: 

		{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window3.xaml}}
		````XML
<Window x:Class="WpfApplication1.Window3"
			xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
			xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
			Title="Window3" Height="328" Width="618" xmlns:my="clr-namespace:Telerik.ReportViewer.Wpf;assembly=Telerik.ReportViewer.Wpf" Loaded="Window_Loaded">
			<Grid>
				<my:ReportViewer Name="reportViewer1" />
			</Grid>
		</Window>
````
		{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\Window3.xaml.cs}}
		````C#
namespace WpfApplication1
		{
			using System.Windows;

			/// <summary>
			/// Interaction logic for Window3.xaml
			/// </summary>
			public partial class Window3 : Window
			{
				public Window3()
				{
					InitializeComponent();
				}

				private void Window_Loaded(object sender, RoutedEventArgs e)
				{
					var typeReportSource = new Telerik.Reporting.TypeReportSource();
					typeReportSource.TypeName = "Telerik.Reporting.Examples.CSharp.ListBoundReport, CSharp.ReportLibrary";
					this.reportViewer1.ReportSource = typeReportSource;
				}
			}
		}
````
		{{source=CodeSnippets\VB\API\Telerik\ReportViewer\Wpf\Window3.xaml}}
		````XML
<Window x:Class="Window3"
			xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
			xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
			Title="Window3" Height="489" Width="687" xmlns:my="clr-namespace:Telerik.ReportViewer.Wpf;assembly=Telerik.ReportViewer.Wpf" Name="Window3">
			<Grid>
				<my:ReportViewer Name="ReportViewer1" />
			</Grid>
		</Window>
````
		{{source=CodeSnippets\VB\API\Telerik\ReportViewer\Wpf\Window3.xaml.vb}}
		````VB
Imports System.Windows

		' Interaction logic for Window3.xaml
		Partial Public Class Window3
			Inherits Window
			Public Sub New()
				InitializeComponent()
			End Sub

			Private Sub Window_Loaded(sender As Object, e As RoutedEventArgs)
				Dim typeReportSource = New Telerik.Reporting.TypeReportSource()
				typeReportSource.TypeName = "Telerik.Reporting.Examples.CSharp.ListBoundReport, CSharp.ReportLibrary"
				Me.ReportViewer1.ReportSource = typeReportSource
			End Sub
		End Class
````


## Setting DataContext

Setting a DataContext to a parent element of ReportViewer leads to BindingExpression path errors, which can be safely ignored. This happens because ReportViewer internally uses a view model and the DataContext gets propagated to the control before the view model is initialized. This leads to mismatch between the properties expected by ReportViewer and the ones in the DataContext. At a later stage, the DataContext of ReportViewer's child elements is set to the expected view model (ReportViewModel), the bindings in the control get evaluated, therefore the errors get resolved. To avoid the binding errors you can set the DataContext of the parent element in the Loaded event handler of ReportViewer. 

## Binding Redirects

In case you use *Telerik UI for WPF* version greater than the __latest official release__ (service pack or internal build) you have to redirect all assemblies required by the *Telerik WPF ReportViewer* to their latest versions. To do this, add the following __bindingRedirects__ to your __app.config__ and replace the "__2010.1.421.35__" with the exact version of *Telerik UI for WPF* assemblies: 

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\Wpf\WpfViewerBindings.xml}}
````XML
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
  <runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <dependentAssembly>
        <assemblyIdentity name="Telerik.Windows.Controls" culture="neutral" publicKeyToken="5803cfa389c90ce7"/>
        <bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535" newVersion="2010.1.421.35"/>
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="Telerik.Windows.Controls.Input" culture="neutral" publicKeyToken="5803cfa389c90ce7"/>
        <bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535" newVersion="2010.1.421.35"/>
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="Telerik.Windows.Controls.Navigation" culture="neutral" publicKeyToken="5803cfa389c90ce7"/>
        <bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535" newVersion="2010.1.421.35"/>
      </dependentAssembly>
    </assemblyBinding>
  </runtime>
</configuration>
````

> [Redirecting Assembly Versions](http://msdn.microsoft.com/en-us/library/7wd6ex19(v=vs.110).aspx) is a standard .NET technique for resolving assembly versions conflicts. __Visual Studio 2013__ allows automatic binding redirects. For more details check MSDN: [How to: Enable and Disable Automatic Binding Redirection](http://msdn.microsoft.com/en-us/library/2fc472t2(v=vs.110).aspx). 

## How to add the WPF ReportViewer to the toolbox

1. Select a WPF window file (e.g. Window1.xaml). 

1. Open the toolbox and add your own tab or click on the General tab. 

1. Right click in the selected tab area and select *Choose Items…* from the context menu. 

1. The previous step will open *Choose Toolbox Items* dialog. Select the *WPF Components* tab and find the *ReportViewer* component from the *Telerik.ReportViewer.Wpf* assembly. 

1. Click *OK*.

## See Also

* [How to Add report viewer to a WPF .NET Framework project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project%})
