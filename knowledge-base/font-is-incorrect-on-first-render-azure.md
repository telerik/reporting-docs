---
title: The Report Item is Rendered with an Incorrect Font on the First Render in Azure
description: When viewing a report that is rendered in Azure environment the font is replaced with a default one on the first instance
type: troubleshooting
page_title: The first instance of a report item is with different font than the rest
slug: font-is-incorrect-on-first-render-azure
position: 
tags: Azure, Fonts, Report Viewer 
ticketid: 1562648
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>ASP.NET Core</td>
		</tr>
	</tbody>
</table>


## Description

When viewing a report that is rendered in Azure environment, the font is replaced on the first instance of that report item/section with the default font for the OS. The rest of the report is rendered with the custom font as expected. The same report renders correctly(including the first instance) locally.

Our reporting engine requires the fonts to either be installed in the hosting environment or to be referenced through the use of the [privateFonts element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element%}).

Installing a font on an Azure app service can sometimes be not an easy task so people end up using the `privateFonts` variant.

This turns out to also be tricky because the `wwwroot` folder gets [duplicated in Azure Web apps](https://stackoverflow.com/questions/50747590/azure-web-app-wwwroot-duplicates-on-publish) and if the font is in there, that could mess up the path where the reporting engine looks for to find the font.

## Steps to Reproduce

Host an .NET Core web application project on Azure, then use it to render a report that display text with custom font.

## Solution

- Ensure that the fonts are present in the `wwwroot` folder of the project(which is the root folder of the app when it is run in Azure App service) 

	````JavaScript
"telerikReporting": {
		"privateFonts": [{
			"fontFamily": "ubuntu",
			"path": "Ubuntu-R.ttf",
		}]
	}
````


- Invoke the `UseStaticFiles` method at the end of the `Configure` method in `Startup.cs`/`Program.cs` to resolve the wwwroot duplicate problem.

	````CSharp
public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
	{
		....
		app.UseStaticFiles();
	}
````


## See Also

* [Azure Web App wwwroot duplicates on publish](https://stackoverflow.com/questions/50747590/azure-web-app-wwwroot-duplicates-on-publish)
* [Fonts Requirements]({%slug telerikreporting/designing-reports/rendering-and-paging/fonts-requirements%})
* [Problems When Rendering Teleik Reports in Azure]({%slug azure-reporting-problems%})
