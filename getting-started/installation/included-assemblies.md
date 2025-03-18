---
title: Included Assemblies
page_title: Available Assemblies and Assets
description: "Get to know the available assemblies and other resources you can use when working with Telerik Reporting. Learn where you may find them by default, and what you may use them for."
slug: included-assemblies
tags: telerik, reporting, included, assemblies, installation
published: True
position: 3
---

# Assemblies and Assets Included in the Installation

This article explains what assemblies and other assets are included in the [Telerik Reporting](https://www.telerik.com/products/reporting.aspx) product installation.

## General Organization

The assemblies come sorted in several folders so that you can use the ones you need. Depending on the .NET framework version your project targets, you will find the assemblies in the following corresponding directories:

* If you target `.NET Framework`, use the assemblies from the `Bin` folder.
* If you target `.NET Standard`, use the assemblies from the `\Bin\netstandard2.0` folder.
* If you target `.NET 6`, use the assemblies from the `\Bin\net6.0` and `\Bin\net6.0-windows` folders.
* If you target `.NET 8`, use the assemblies from the `\Bin\net8.0` and `\Bin\net8.0-windows` folders.

## Main Assemblies

The following table describes the folder structure for the Telerik Reporting main assemblies.

| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting {{site.suiteversion}}\Bin`|<ul><li>`Telerik.Reporting.dll`</li><li>`Telerik.ReportViewer.Mvc.dll`</li><li>`Telerik.ReportViewer.Html5.WebForms.dll`</li><li>`Telerik.ReportViewer.WinForms.dll`</li><li>`Telerik.ReportViewer.Wpf.dll`</li><li>`Telerik.ReportViewer.Wpf.Themes.dll`</li><li>`Telerik.Reporting.Adomd.dll`</li><li>`Telerik.Reporting.Services.ServiceStack.dll`</li><li>`Telerik.Reporting.Services.WebApi.dll`</li><li>`Telerik.Reporting.XpsRendering.dll`</li><li>`Telerik.Reporting.OpenXmlRendering.dll`</li><li>`Telerik.Reporting.Cache.Database.dll`</li><li>`Telerik.Reporting.Cache.StackExchangeRedis.dll`</li><li>`Telerik.Reporting.Data.Schema.dll`</li><li>`Telerik.Reporting.Data.Schema.Provider.dll`</li><li>`Telerik.Reporting.GraphQL.Client.dll`</li><li>`Telerik.Reporting.JsonSerialization.dll`</li><li>`Telerik.Reporting.OpenXmlRendering.2.7.2.dll`</li><li>`Telerik.Reporting.OpenXmlRendering.3.0.1.dll`</li><li>`Telerik.Reporting.Services.HttpClient.dll`</li><li>`Telerik.Reporting.WebServiceDataSource.dll`</li><li>`Telerik.WebReportDesigner.Services.dll`</li></ul>|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Bin\netstandard2.0`|<ul><li>`Telerik.Reporting.dll`</li><li>`Telerik.ReportViewer.Blazor.dll`</li><li>`Telerik.WebReportDesigner.Blazor.dll`</li><li>`Telerik.Reporting.WebServiceDataSource.dll`</li><li>`Telerik.Reporting.Services.HttpClient.dll`</li><li>`Telerik.Reporting.OpenXmlRendering.2.7.2.dll`</li><li>`Telerik.Reporting.OpenXmlRendering.3.0.1.dll`</li><li>`Telerik.Reporting.JsonSerialization.dll`</li><li>`Telerik.Reporting.Data.Schema.dll`</li><li>`Telerik.Reporting.Cache.StackExchangeRedis.dll`</li></ul>|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Bin\net6.0`|<ul><li>`Telerik.WebReportDesigner.Services.dll`</li><li>`Telerik.Reporting.Services.AspNetCore.dll`</li><li>`Telerik.Drawing.Skia.dll`</li><li>`Telerik.Reporting.Data.Schema.Provider.dll`</li></ul>|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Bin\net6.0-windows`|<ul><li>`Telerik.ReportViewer.WinForms.dll`</li><li>`Telerik.ReportViewer.Wpf.dll`</li><li>`Telerik.ReportViewer.Wpf.Themes.dll`</li><li>`Telerik.ReportViewer.WinUI.dll`</li><li>`Telerik.ReportViewer.WinUI.Themes.dll`</li></ul>|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Bin\net8.0`|<ul><li>`Telerik.WebReportDesigner.Services.dll`</li><li>`Telerik.Reporting.Services.AspNetCore.dll`</li></ul>|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Bin\net8.0-windows`|<ul><li>`Telerik.ReportViewer.WinForms.dll`</li><li>`Telerik.ReportViewer.Wpf.dll`</li><li>`Telerik.ReportViewer.Wpf.Themes.dll`</li></ul>|

## Installed Samples

The following table describes the folder structure for the Telerik Reporting installed samples.

| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting {{site.suiteversion}}\Examples\bin`|The external dependencies.|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp`|The C# example solutions.|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Examples\Data`|The AdventureWorks OLTP database installation scripts.|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Examples\VB`|The VB example solutions.|

## Standalone Report Designer

The following table describes the folder structure for the Standalone Report Designer.

| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting {{site.suiteversion}}\Report Designer`|The Standalone Report Designer.|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\Examples`|The example reports.|

## Web Report Designer

The following table describes the folder structure for the Web Report Designer files.

| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportDesigner\js`|The code and localization resources of the Web Report Designer.|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportDesigner\styles`|The CSS files for the Web Report Designer.|

## Report Viewer Files

The following table describes the folder structure for the miscellaneous Report Viewers files.

| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportViewer`|The JavaScript and CSS files, and the template for the HTML5 Report Viewer.|
|`...Progress\Telerik Reporting {{site.suiteversion}}\Wpf\Themes`|The WPF Report Viewer themes.|

## Administrative Utilities

The following table describes the folder structure for the miscellaneous administrative utilities.

| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting {{site.suiteversion}}\Tools`|The Database Cache Configurator.|
