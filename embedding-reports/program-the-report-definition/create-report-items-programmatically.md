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

````C#
Telerik.Reporting.Panel panel1 = new Telerik.Reporting.Panel();
Telerik.Reporting.TextBox textBox1 = new Telerik.Reporting.TextBox();
// panel1
panel1.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(1.0, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(1.0, Telerik.Reporting.Drawing.UnitType.Cm));
panel1.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(8.5, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(3.5, Telerik.Reporting.Drawing.UnitType.Cm));
panel1.Style.BorderStyle.Default = Telerik.Reporting.Drawing.BorderType.Solid;
// textBox1
textBox1.Location = new Telerik.Reporting.Drawing.PointU(new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0, Telerik.Reporting.Drawing.UnitType.Cm));
textBox1.Name = "NameDataTextBox";
textBox1.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(5.0, Telerik.Reporting.Drawing.UnitType.Cm), new Telerik.Reporting.Drawing.Unit(0.6, Telerik.Reporting.Drawing.UnitType.Cm));
textBox1.Style.BorderStyle.Default = Telerik.Reporting.Drawing.BorderType.Solid;
textBox1.StyleName = "Data";
textBox1.Value = "=Fields.CustomerID";
panel1.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {textBox1});
detail.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {panel1});
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ProgrammaticReportCreationSnippets.vb region=CreatePanelWithTextBox}}
## See Also

* [TextBox](/api/Telerik.Reporting.TextBox)
* [PictureBox](/api/Telerik.Reporting.PictureBox)
* [Panel](/api/Telerik.Reporting.Panel)
* [SubReport](/api/Telerik.Reporting.SubReport)
* [Shape](/api/Telerik.Reporting.Shape)
* [Table](/api/Telerik.Reporting.Table)
* [CheckBox](/api/Telerik.Reporting.CheckBox)
