---
title: Overview
page_title: Report Items Overview
description: "Learn more about the items a Telerik Reporting report can contain."
slug: telerikreporting/designing-reports/report-structure/overview
previous_url: /report-items/how-to/how-to-layout-report-items
tags: telerik, reporting, report, items, overview
published: True
position: 0
---

# Report Items Overview

Report items are used in the report depending on the data that should be displayed e.g. [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) item for static or data bound text, [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) for displaying images, [Barcode]({%slug telerikreporting/designing-reports/report-structure/barcode/overview%}) for showing barcode in a label report etc. Every report item is an instance of the [ReportItemBase](/reporting/api/Telerik.Reporting.ReportItemBase) class. Report items can reside inside report sections or containers (e.g. [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}) or [Table/Crosstab/List]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) items). 

## Arranging Report Items

Content on reports is displayed in report items. To use report items, you select them from the Toolbox and place them on your report.

In Visual Studio:

1. Open the report in design view. 

1. Expand the __Telerik Reporting__ tab of the Toolbox. 

1. Select the report item that you want to place. 

1. Drag the report item from the Toolbox to the report's design surface. Alternatively, you may select the section of the report where you want the report item to appear by clicking the section header, and then double-click the report item in the Toolbox. Or you can select the report item in the toolbox and draw a bounding rectangle to indicate the area that the report item should occupy. 

In the Standalone Designer:

1. Open the report in design view. 

1. Click the __Insert__ tab of the ribbon. 

1. Select the report item that you want to place and click on it. 
  

To move a report item, hover over the report item. When the cross hair cursor appears, click and drag the report item.

![](images/ReportDesign002.png)

## Changing the Size 

1. Click on the report item to select it.

1. Click and drag one of the size handles on the edge of the report item to the desired size. 

  ![](images/ReportDesign003.png)

## Controlling the Height

To remove blank vertical space in a container (report section or panel item), whenever you control the visibility of report items in runtime, set its respective height to a very small value (e.g. 1mm). Section/Panel item can grow to accommodate their children but cannot shrink/take space that is no longer occupied. If you want a section/panel to shrink only at runtime you can set its Height property in the report constructor. Place the Height property assignment code just after the _IntializeComponent()_ method call. 
