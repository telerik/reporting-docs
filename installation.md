---
title: 
page_title:  
description: 
slug: included-assemblies
tags: telerik, reporting, included, assemblies, installation
published: True
position: 2
---

# Included Assemblies

By default, the Wizard installs Telerik Reporting in the following locations:         

* For 64-bit machines, in ` C:\Program Files\Progress\Telerik Reporting {{site.suiteversion}}`.             

* For 32-bit machines, in ` C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}`.             

The assemblies targeting different versions of.NET are placed in separate folders, as shown in the list below:         

*.NET Framework - *\Bin* 

*.NET Standard - *\Bin\netstandard2.0* 

*.NET Core - *\Bin\netcoreapp3.1* 

*.NET 5 - *\Bin\net5.0*  and *\Bin\net5.0-windows* 

*.NET 6 - *\Bin\net6.0*  and *\Bin\net6.0-windows* 

>important Since.NET 6 is currently available as a Preview, compiling a.NET 6 application requires installing the latest [.NET 6 SDK](https://dotnet.microsoft.com/download/dotnet/6.0)  and using [Visual Studio 2019 Preview](https://visualstudio.microsoft.com/vs/preview/), or allowing to use the previews of the.NET SDK in the __Tools/Environment/Preview Features__ in Visual Studio 2019. 


The following tables describe the folder structure for the redistributable assemblies. 


| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin`|* `Telerik.Reporting.dll`<br/>* `Telerik.ReportViewer.Mvc.dll`<br/>* `Telerik.ReportViewer.WebForms.dll`<br/>* `Telerik.ReportViewer.WinForms.dll`<br/>* `Telerik.ReportViewer.Silverlight.dll`<br/>* `Telerik.ReportViewer.Wpf.dll`<br/>* `Telerik.Reporting.Adomd.dll`<br/>* `Telerik.Reporting.Service.dll`<br/>* `Telerik.Reporting.Services.ServiceStack.dll`<br/>* `Telerik.Reporting.Services.WebApi.dll`<br/>* `Telerik.Reporting.XpsRendering.dll`<br/>* `Telerik.Reporting.OpenXmlRendering.dll`<br/>* `Telerik.Reporting.Cache.Database.dll`|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\netstandard2.0`|* `Telerik.Reporting.dll`<br/>* `Telerik.WebReportDesigner.Services.dll`<br/>* `Telerik.ReportViewer.Blazor.dll`<br/>* `Telerik.Reporting.WebServiceDataSource.dll`<br/>* `Telerik.Reporting.Services.HttpClient.dll`<br/>* `Telerik.Reporting.Services.AspNetCore.dll`<br/>* `Telerik.Reporting.OpenXmlRendering.2.7.2.dll`<br/>* `Telerik.Reporting.JsonSerialization.dll`<br/>* `Telerik.Reporting.Data.Schema.dll`<br/>* `Telerik.Reporting.Cache.StackExchangeRedis.dll`<br/>* `Telerik.Reporting.Cache.StackExchangeRedis.2.dll`|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\netcoreapp3.1`|* `Telerik.Reporting.Services.AspNetCore.dll`<br/>* `Telerik.WebReportDesigner.Services.dll`<br/>* `Telerik.ReportViewer.WinForms.dll`<br/>* `Telerik.ReportViewer.Wpf.dll`<br/>* `Telerik.ReportViewer.Wpf.Themes.dll`|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\net5.0`|* `Telerik.WebReportDesigner.Services.dll`<br/>* `Telerik.Reporting.Services.AspNetCore.dll`|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\net5.0-windows`|* `Telerik.ReportViewer.WinForms.dll`<br/>* `Telerik.ReportViewer.Wpf.dll`<br/>* `Telerik.ReportViewer.Wpf.Themes.dll`<br/>* `Telerik.ReportViewer.WinUI.dll`<br/>* `Telerik.ReportViewer.WinUI.Themes.dll`<br/>* `Telerik.WinUI.Controls\`|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\net6.0`|* `Telerik.WebReportDesigner.Services.dll`<br/>* `Telerik.Reporting.Services.AspNetCore.dll`|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Bin\net6.0-windows`|* `Telerik.ReportViewer.WinForms.dll`<br/>* `Telerik.ReportViewer.Wpf.dll`<br/>* `Telerik.ReportViewer.Wpf.Themes.dll`|


The following table describes the folder structure for the installed samples.         


| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Examples\bin`|The external dependencies.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Examples\CSharp`|The C# example solutions.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Examples\Data`|The AdventureWorks OLTP database installation scripts.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Examples\VB`|The VB example solutions|


The following table describes the folder structure for the Standalone Report Designer.         


| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Report Designer`|The Standalone Report Designer.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Report Designer\Examples`|The example reports|


The following table describes the folder structure for miscellaneous ReportViewers files.         


| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Html5\ReportViewer`|The JavaScript and CSS files, and the template for the HTML5 Report Viewer.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Silverlight\Themes`|The Silverlight Report Viewer themes.|
|`...Progress\Telerik Reporting{{site.suiteversion}}\Wpf\Themes`|WPF Report Viewer themes|


The following table describes the folder structure for miscellaneous administrative utilities.         


| Directory | Description |
| ------ | ------ |
|`...Progress\Telerik Reporting{{site.suiteversion}}\Tools`|The Database Cache Configurator|

