---
title: Included Assemblies
page_title: Included Assemblies
description: "Learn more about the available assemblies you can use when working with Telerik Reporting."
slug: included-assemblies
tags: telerik, reporting, included, assemblies, installation
published: True
position: 2
---

# Included Assemblies

This article explains what assemblies are included in the Telerik UI for ASP.NET AJAX installation including the main `Telerik.Web.UI` assemblies, the	[Telerik ZIP library](https://www.telerik.com/products/silverlight/zip-library.aspx), and the Telerik Document processing libraries ([text processing](https://www.telerik.com/products/wpf/words-processing.aspx) and	[spreadsheet processing](https://www.telerik.com/products/wpf/spreadsheet-processing.aspx)).

## General Organization

The assemblies come sorted in several folders so that you can use the ones you need. Depending on the .NET framework version your project targets, you will find the assemblies in the following corresponding directories:

* If you target `.NET Framework`, use the assemblies from the `Bin` folder.
* If you target `.NET Standard`, use the assemblies from the `\Bin\netstandard2.0` folder.
* If you target `.NET Core`, use the assemblies from the `\Bin\netcoreapp3.1` folder.
* If you target `.NET 5`, use the assemblies from the `\Bin\net5.0` and `\Bin\net5.0-windows` folders.
* If you target `.NET 6`, use the assemblies from the `\Bin\net6.0` and `\Bin\net6.0-windows` folders.

>important Since .NET 6 is currently available as a Preview, compiling a.NET 6 application requires you to install the latest [.NET 6 SDK](https://dotnet.microsoft.com/download/dotnet/6.0) and use [Visual Studio 2019 Preview](https://visualstudio.microsoft.com/vs/preview/). Alternatively, allow the `Tools/Environment/Preview Features` in Visual Studio 2019 to use the .NET SDK previews. 

## Main Assemblies

The following table describes the folder structure for the Telerik Reporting main assemblies.

| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin`|<ul><li>`Telerik.Reporting.dll`</li><li>`Telerik.ReportViewer.Mvc.dll`</li><li>`Telerik.ReportViewer.WebForms.dll`</li><li>`Telerik.ReportViewer.WinForms.dll`</li><li>`Telerik.ReportViewer.Silverlight.dll`</li><li>`Telerik.ReportViewer.Wpf.dll`</li><li>`Telerik.Reporting.Adomd.dll`</li><li>`Telerik.Reporting.Service.dll`</li><li>`Telerik.Reporting.Services.ServiceStack.dll`</li><li>`Telerik.Reporting.Services.WebApi.dll`</li><li>`Telerik.Reporting.XpsRendering.dll`</li><li>`Telerik.Reporting.OpenXmlRendering.dll`</li><li>`Telerik.Reporting.Cache.Database.dll`</li></ul>|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\netstandard2.0`|<ul><li>`Telerik.Reporting.dll`</li><li>`Telerik.WebReportDesigner.Services.dll`</li><li>`Telerik.ReportViewer.Blazor.dll`</li><li>`Telerik.Reporting.WebServiceDataSource.dll`</li><li>`Telerik.Reporting.Services.HttpClient.dll`</li><li>`Telerik.Reporting.Services.AspNetCore.dll`</li><li>`Telerik.Reporting.OpenXmlRendering.2.7.2.dll`</li><li>`Telerik.Reporting.JsonSerialization.dll`</li><li>`Telerik.Reporting.Data.Schema.dll`</li><li>`Telerik.Reporting.Cache.StackExchangeRedis.dll`</li><li>`Telerik.Reporting.Cache.StackExchangeRedis.2.dll`</li></ul>|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\netcoreapp3.1`|<ul><li>`Telerik.Reporting.Services.AspNetCore.dll`</li><li>`Telerik.WebReportDesigner.Services.dll`</li><li>`Telerik.ReportViewer.WinForms.dll`</li><li>`Telerik.ReportViewer.Wpf.dll`</li><li>`Telerik.ReportViewer.Wpf.Themes.dll`</li></ul>|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\net5.0`|<ul><li>`Telerik.WebReportDesigner.Services.dll`</li><li>`Telerik.Reporting.Services.AspNetCore.dll`</li></ul>|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\net5.0-windows`|<ul><li>`Telerik.ReportViewer.WinForms.dll`</li><li>`Telerik.ReportViewer.Wpf.dll`</li><li>`Telerik.ReportViewer.Wpf.Themes.dll`</li><li>`Telerik.ReportViewer.WinUI.dll`</li><li>`Telerik.ReportViewer.WinUI.Themes.dll`</li><li>`Telerik.WinUI.Controls\`</li></ul>|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\net6.0`|<ul><li>`Telerik.WebReportDesigner.Services.dll`</li><li>`Telerik.Reporting.Services.AspNetCore.dll`</li></ul>|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\net6.0-windows`|<ul><li>`Telerik.ReportViewer.WinForms.dll`</li><li>`Telerik.ReportViewer.Wpf.dll`</li><li>`Telerik.ReportViewer.Wpf.Themes.dll`</li></ul>|


## Installed Samples

The following table describes the folder structure for the Telerik Reporting installed samples.


| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Examples\bin`|The external dependencies.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Examples\CSharp`|The C# example solutions.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Examples\Data`|The AdventureWorks OLTP database installation scripts.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Examples\VB`|The VB example solutions.|


## Standalone Report Designer

The following table describes the folder structure for the Standalone Report Designer.


| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Report Designer`|The Standalone Report Designer.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Report Designer\Examples`|The example reports.|


## Report Viewer Files

The following table describes the folder structure for the miscellaneous Report Viewers files.         


| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Html5\ReportViewer`|The JavaScript and CSS files, and the template for the HTML5 Report Viewer.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Silverlight\Themes`|The Silverlight Report Viewer themes.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Wpf\Themes`|The WPF Report Viewer themes.|


## Administrative Utilities

The following table describes the folder structure for the miscellaneous administrative utilities.         


| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Tools`|The Database Cache Configurator.|

