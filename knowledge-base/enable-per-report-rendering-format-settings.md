---
title: Enable per-report allowed export formats configuration.
description: Configure device information settings for each report individually.
type: how-to
page_title: Set report-specific device configuration.
slug: enable-per-report-rendering-format-settings
position: 
tags: 
ticketid: 1397565
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>15.1.21.512</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Rendering Format</td>
			<td>All</td>
		</tr>
	</tbody>
</table>


## Description

As of [Progress® Telerik® Reporting R2 2021 (15.1.21.512)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2021-15-1-21-512), you can specify device information settings per particular report as part of its definition, configuring the [RuntimeSettings](../p-telerik-reporting-report-runtimesettings) report property. 

Besides setting the export parameters for particular extension, it allows hiding it and changing its description when listed to the end-user. 

The property in question can be set up from the report designer tools as well as through code. 

> In case of a report book document, the settings of the first report in the book get respected.

## Solution

### Set the RuntimeSettings in the Report Designers

![Set RuntimeSettings from the Designers](resources/RuntimeSettings.PNG)

### Set the RuntimeSettings through code

```cs
Report report = new Report()           

var pdfSettings = new RenderingSettings() { Name = "PDF" , Visible = false }; 
// Setting Visible to false of a rendering extension means that that rendering extension will not be visible in the export dropdown 
// when the report is displayed in a report viewer.
pdfSettings.Parameters.Add(new Parameter() { Name = "DocumentAuthor", Value = "Dimitar" });
report.RuntimeSettings.Add(pdfSettings);
```

## Notes

When exporting a report programmatically, you may also provide it with specific to the report device information settings.

The respective method takes a [HashTable](https://docs.microsoft.com/en-us/dotnet/api/system.collections.hashtable?redirectedfrom=MSDN&view=net-5.0) argument representing the desired export parameters for this particular rendering operation: [RenderReport](../overload-telerik-reporting-processing-reportprocessor-renderreport).

## See Also

[extensions Element](../configuring-telerik-reporting-extensions)

[How to limit export options in the report viewer](./limit-export-options-in-report-viewer)
