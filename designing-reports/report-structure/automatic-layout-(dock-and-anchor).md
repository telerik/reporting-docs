---
title: Automatic Layout (Dock and Anchor)
page_title: Automatic Layout (Dock and Anchor) | for Telerik Reporting Documentation
description: Automatic Layout (Dock and Anchor)
slug: telerikreporting/designing-reports/report-structure/automatic-layout-(dock-and-anchor)
tags: automatic,layout,(dock,and,anchor)
published: True
position: 17
---

# Automatic Layout (Dock and Anchor)



## Anchoring

Anchoring is used to dynamically resize report items with their container (for example section or panel). Simply put, an anchor maintains the distance between the edge of the report item and the corresponding edge of the container in which it is anchored. An item can be anchored to any combination of the edges of its container. If the item is anchored to two opposite edges of its container, it is resized when the container is resized. For example, if you anchor an item both to the top and bottom edges of its parent section, and the section height increases because of its content (for example a text box with longer text grows vertically), the item tries to keep the distance of its top edge to the top edge of the section and at the same time it tries to keep the distance of its bottom edge to the bottom edge of the section. By default, report items are not anchored.

## Docking

A report item can also be docked to its container (for example a section or a panel). Docking a report item causes its edges to adhere to the edges of its container. When a report item is docked to an edge of its container, it is always positioned to flush against that edge when the container is resized.

Like with anchoring, you specify an edge where the item is docked,  but unlike anchoring, the item is always resized to cover the edge it is docked to. If you dock two items to the same edge, then they will be "stacked up" one next to the other and the item with the lowest *z* -order(the 1st item in the items collection is considered with the lowest z-order and the last item is with the highest z-order) will be positioned closest to the edge. You can also use docking to indicate that an item should occupy the remaining area of a container which is not occupied by other items (fill).

Note that anchoring and docking are really effective only when the container can be resized. With regard to Telerik Reporting report sections and panels usually contain all report items in a report and there are a couple of reasons for why they can grow:

* A child TextBoxitem with CanGrowenabled can grow in height to accommodate the longer text that it should display;

* A SubReportitem can grow in width and height according to the source report it contains;

* A PictureBoxitem with auto sizing enabled (PictureBox.SizingMode= AutoSize) can grow to fit the bigger image when needed.

>note 

Anchor and Dock both require parent item to have KeepTogether turned on (KeepTogether=true). They cannot work with KeepTogether=false, as they are bound to the container in some way.


# See Also
 * [Anchoring](/reporting/api/Telerik.Reporting.ReportItem#Telerik_Reporting_ReportItem_Anchoring)  * [Docking](/reporting/api/Telerik.Reporting.ReportItem#Telerik_Reporting_ReportItem_Docking) 
