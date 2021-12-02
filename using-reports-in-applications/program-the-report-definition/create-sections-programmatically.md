---
title: Create Sections Programmatically
page_title: Create Sections Programmatically | for Telerik Reporting Documentation
description: Create Sections Programmatically
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/create-sections-programmatically
tags: create,sections,programmatically
published: True
position: 2
---

# Create Sections Programmatically



## 



To create sections in code, instantiate the appropriate object, set its properties, and add it to the __Report__  object's __Items__  collection. The objects you will need to work with are:

*  __DetailSection__  - for a detail section

*  __GroupHeaderSection__  - for a group header

*  __GroupFooterSection__  - for a group footer

*  __PageHeaderSection__  - for a page header

*  __PageFooterSection__  - for a page footer

*  __ReportHeaderSection__  - for a report header

*  __ReportFooterSection__  - for a report footer

For example, this code creates a detail section and adds it to the report:

	
````C#
DetailSection detail = new DetailSection();
this.detail.Height = new Telerik.Reporting.Drawing.Unit(3.0, Telerik.Reporting.Drawing.UnitType.Inch);
this.detail.Name = "detail";
report.Items.Add((ReportItemBase)detail);
````
````VB.NET
Dim detail As New DetailSection()
Me.detail.Height = New Telerik.Reporting.Drawing.Unit(3, Telerik.Reporting.Drawing.UnitType.Inch)
Me.detail.Name = "detail";
report.Items.Add(DirectCast(detail, ReportItemBase)
````



# See Also
 * [ReportHeaderSection](/reporting/api/Telerik.Reporting.ReportHeaderSection)  * [ReportFooterSection](/reporting/api/Telerik.Reporting.ReportFooterSection)  * [DetailSection](/reporting/api/Telerik.Reporting.DetailSection)  * [GroupHeaderSection](/reporting/api/Telerik.Reporting.GroupHeaderSection)  * [GroupFooterSection](/reporting/api/Telerik.Reporting.GroupFooterSection)  * [PageHeaderSection](/reporting/api/Telerik.Reporting.PageHeaderSection)  * [PageFooterSection](/reporting/api/Telerik.Reporting.PageFooterSection) 
