---
title: Shape
page_title: Shape Report Item Overview
description: "Learn more about the Telerik Reporting Shape report item and how to choose the shape type of the supported lines, arrows, stars, and more shapes."
slug: telerikreporting/designing-reports/report-structure/shape
tags: telerik, reporting, report, items, shape, types, arrows, lines, stars
published: True
position: 11
previous_url: /report-items-shape
---

# Shape Report Item Overview

The Shape report item displays a single selection of predefined shapes in a report. 

The following screenshot shows a Shape report item with its `ShapeType="Right Arrow"` on the report design surface. 

![A Shape report item having its shape set to right arrow](images/Shape.png)

You can use shapes to create visual effects within a report. You can set display and other properties to this item by using the Properties pane. 

The following table lists the `ShapeType` property modes supported by the Shape. 

|Lines|Stars|Arrows|Other
|:---|:---|:---|:---
|Vertical Line|3-ray star|Top Arrow|Ellipse           
|Horizontal Line|4-ray star|Bottom Arrow|Triangle          
|Slant Line|5-ray star|Left Arrow|Square          
|BackSlant Line|6-ray star|Right Arrow|Pentagon          
||8-ray star||Hexagon           
||||Octagon           
||||Cross           

The Shape enables you to create custom shapes programmatically. The following code snippet shows how to inherit the [`ShapeBase`](/reporting/api/Telerik.Reporting.Drawing.Shapes.ShapeBase) class and provide a custom set of `PointF` arrays that will form the Shape. The coordinates of the points are relative and do not depend on the size or position of the item in the report. 

{{source=CodeSnippets\CS\API\Telerik\Reporting\ShapeSnippets.cs region=CustomShapeClassDeclarationSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ShapeSnippets.vb region=CustomShapeClassDeclarationSnippet}}

You can create the Shape at runtime and add it to a report item container (Section, Panel, or other). The following snippet shows how to instantiate a Shape of the `CustomShape` type: 

{{source=CodeSnippets\CS\API\Telerik\Reporting\ShapeSnippets.cs region=CreateCustomShapeSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ShapeSnippets.vb region=CreateCustomShapeSnippet}}


## See Also

* [Using Styles to Customize Reports]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%}) 
* [(API) Shape](/reporting/api/Telerik.Reporting.Shape)  
* [(API) ShapeType](/reporting/api/Telerik.Reporting.Shape#Telerik_Reporting_Shape_ShapeType)  
* [(API) Stretch](/reporting/api/Telerik.Reporting.Shape#Telerik_Reporting_Shape_Stretch)
