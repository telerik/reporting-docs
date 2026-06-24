---
title: Create Report Items
page_title: Creating Report Items with code
description: "Create a Telerik Reporting report item programmatically, by instantiating a report item object, setting its properties, and adding it to the Items collection of the section where you wish the control to appear."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/create-report-items-programmatically
tags: create, report, items, programmatically, code
published: True
position: 3
previous_url: /programmatic-creating-controls
reportingArea: General
---

# Create Report Items Programmatically

To create a report item in code, instantiate a report item object, set its properties, and add it to the _Items_ collection of the section where you wish the control to appear. For example, this code will add one __TextBox__ report item in a __Panel__ inside the __detail__ section of the report:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportItemValueSnippets.cs region=CreatePanelWithTextBox}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ProgrammaticReportCreationSnippets.vb region=CreatePanelWithTextBox}}
## See Also

* [TextBox](/api/Telerik.Reporting.TextBox)
* [PictureBox](/api/Telerik.Reporting.PictureBox)
* [Panel](/api/Telerik.Reporting.Panel)
* [SubReport](/api/Telerik.Reporting.SubReport)
* [Shape](/api/Telerik.Reporting.Shape)
* [Table](/api/Telerik.Reporting.Table)
* [CheckBox](/api/Telerik.Reporting.CheckBox)
