---
title: Create Sections
page_title: Creating Sections with code
description: "Create Telerik Reporting sections programmatically, by instantiating the appropriate object, setting its properties, and adding it to the Report object's Items."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/create-sections-programmatically
tags: create, sections, programmatically, code
published: True
position: 2
previous_url: /programmatic-creating-sections
---

# Create Sections Programmatically

To create sections in code, instantiate the appropriate object, set its properties, and add it to the __Report__ object's __Items__ collection. The objects you will need to work with are:

* __DetailSection__ - for a detail section
* __GroupHeaderSection__ - for a group header
* __GroupFooterSection__ - for a group footer
* __PageHeaderSection__ - for a page header
* __PageFooterSection__ - for a page footer
* __ReportHeaderSection__ - for a report header
* __ReportFooterSection__ - for a report footer

For example, this code creates a detail section and adds it to the report:

````C#
Telerik.Reporting.DetailSection detail = new Telerik.Reporting.DetailSection();
this.detail.Height = new Telerik.Reporting.Drawing.Unit(3.0, Telerik.Reporting.Drawing.UnitType.Inch);
this.detail.Name = "detail";
report.Items.Add((Telerik.Reporting.ReportItemBase)detail);
````
````VB.NET
Dim detail As New Telerik.Reporting.DetailSection()
Me.detail.Height = New Telerik.Reporting.Drawing.Unit(3, Telerik.Reporting.Drawing.UnitType.Inch)
Me.detail.Name = "detail";
report.Items.Add(DirectCast(detail, Telerik.Reporting.ReportItemBase))
````


## See Also

* [ReportHeaderSection](/api/Telerik.Reporting.ReportHeaderSection)
* [ReportFooterSection](/api/Telerik.Reporting.ReportFooterSection)
* [DetailSection](/api/Telerik.Reporting.DetailSection)
* [GroupHeaderSection](/api/Telerik.Reporting.GroupHeaderSection)
* [GroupFooterSection](/api/Telerik.Reporting.GroupFooterSection)
* [PageHeaderSection](/api/Telerik.Reporting.PageHeaderSection)
* [PageFooterSection](/api/Telerik.Reporting.PageFooterSection)
