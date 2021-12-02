---
title: How to Add  manually report viewer to a WPF .NET Framework project
page_title: How to Add  manually report viewer to a WPF .NET Framework project | for Telerik Reporting Documentation
description: How to Add  manually report viewer to a WPF .NET Framework project
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project
tags: how,to,add,,manually,report,viewer,to,a,wpf,.net,framework,project
published: True
position: 3
---

# How to Add  manually report viewer to a WPF .NET Framework project



This article explains the steps needed to manually create an application which uses the WPF report viewer.         Another way to add a WPF Report Viewer to your application       

## Setting DataContext

Setting a DataContext to a parent element of ReportViewer leads to BindingExpression path errors, which can be safely ignored.          This happens because ReportViewer internally uses a view model and the DataContext gets propagated to the control before          the view model is initialized. This leads to mismatch between the properties expected by ReportViewer and the ones in the DataContext.          At a later stage, the DataContext of ReportViewer's child elements is set to the expected view model (ReportViewModel), the bindings in          the control get evaluated, therefore the errors get resolved. To avoid the binding errors you can set the DataContext of the parent element          in the Loaded event handler of ReportViewer.         

## Binding Redirects

In case you use *Telerik UI for WPF*  version greater           than the __latest official release__ (service pack or internal build) you have to redirect all assemblies required           by the *Telerik WPF ReportViewer*  to their latest versions.           To do this, add the following __bindingRedirects__  to your           __app.config__  and replace the "__2010.1.421.35__ "           with the exact version of *Telerik UI for WPF*  assemblies:         

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



>note  [Redirecting Assembly Versions](http://msdn.microsoft.com/en-us/library/7wd6ex19(v=vs.110).aspx)  is a standard .NET technique for resolving assembly versions conflicts.  __Visual Studio 2013__  allows automatic binding redirects. For more details check MSDN:  [How to: Enable and Disable Automatic Binding Redirection](http://msdn.microsoft.com/en-us/library/2fc472t2(v=vs.110).aspx) .           


## How to add the WPF ReportViewer to the toolbox

###

1. Select a WPF window file (e.g. Window1.xaml).                 

1. Open the toolbox and add your own tab or click on the General tab.                 

1. Right click in the selected tab area and select *Choose Items…*  from the context menu.                 

1. The previous step will open *Choose Toolbox Items*  dialog. Select the                   *WPF Components*  tab and find the *ReportViewer*  component                   from the *Telerik.ReportViewer.Wpf*  assembly.                 

1. Click *OK* 

# See Also


 * [How to Add report viewer to a WPF .NET Framework project]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add-report-viewer-to-a-wpf-.net-framework-project%})
