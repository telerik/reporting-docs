---
title: Error building project after adding WPF report viewer
description: XamlParseException upon adding WPF viewer
type: troubleshooting
page_title: Compilation error due to Copy Local of Telerik.ReportViewer.Wpf.Themes set to False
slug: error-building-project-after-adding-wpf-report-viewer
position: 
tags: 
ticketid: 1179371
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.1.18.620</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>WPF</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>WPF Viewer</td>
	</tr>
</table>


## Description
Adding a WPF Report Viewer from the Visual Studio item templates to a project results _System.Windows.Markup.XamlParseException_.

## Error Message
```
_System.Windows.Markup.XamlParseException
  HResult=0x80131501
  Message='Set property 'System.Windows.ResourceDictionary.Source' threw an exception.' Line number '7' and line position '10'.
  Source=PresentationFramework
  StackTrace:
   at System.Windows.Markup.WpfXamlLoader.Load(XamlReader xamlReader, IXamlObjectWriterFactory writerFactory, Boolean skipJournaledProperties, Object rootObject, XamlObjectWriterSettings settings, Uri baseUri)_
_Inner Exception 1:
FileNotFoundException: Could not load file or assembly 'Telerik.ReportViewer.Wpf.Themes, Culture=neutral' or one of its dependencies. The system cannot find the file specified._
```

## Cause\Possible Cause(s)
Starting with [Telerik Reporting R2 2018 SP1 (12.1.18.620)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620) the Themes are provided with the _Telerik.ReportViewer.Wpf.Themes_ assembly. The assembly should be available in the **bin** folder of the application. Hence, the property **Copy Local** of the assembly should be set to **True**. With the specified version of Telerik Reporting when adding the WPF Report Viewer from the Visual Studio item templates the default value of **Copy Local** is **_False_**.

## Solution
Set manually the property **Copy Local** of the assembly _Telerik.ReportViewer.Wpf.Themes_ to **True**. 
