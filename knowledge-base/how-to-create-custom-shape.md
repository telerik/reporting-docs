---
title: Create custom shape
description: How to create and add custom shape to a report
type: how-to
page_title: Draw shapes with custom geometry
slug: how-to-create-custom-shape
position:
tags: customize,shape
ticketid: 1172132
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>

## Description

There are multiple Shapes already available out of the box to utilize in Telerik Reporting reports.
We provide also an option to create Custom Shapes. Here is how to do it.

## Solution

1. The [ShapeType ](/api/Telerik.Reporting.ShapeItemBase#Telerik_Reporting_ShapeItemBase_ShapeType) must be set to a new implementation of the [ShapeBase class](/api/telerik.reporting.drawing.shapes.shapebase), i.e. create new class to represent the new custom shape:

   ```C#
   class MyCustomShape : Telerik.Reporting.Drawing.Shapes.ShapeBase
   ```

2. The method [CreateShape()](/api/telerik.reporting.drawing.shapes.shapebase#collapsible-Telerik_Reporting_Drawing_Shapes_ShapeBase_CreateShape) of the new class should be overridden to create the corresponding shape/geometry of the custom shape:

   ```C#
   protected override void CreateShape()
   {
   	//DESCRIBE THE GEOMETRY OF THE CUSTOM SHAPE HERE

   	PointF[] seriesofPoints = new PointF[8];
   	seriesofPoints[0] = new PointF(-10, 10);
   	seriesofPoints[1] = new PointF(-10, 4);
   	seriesofPoints[2] = new PointF(-12, 4);
   	seriesofPoints[3] = new PointF(-12, 0);
   	seriesofPoints[4] = new PointF(12, 0);
   	seriesofPoints[5] = new PointF(12, 4);
   	seriesofPoints[6] = new PointF(10, 4);
   	seriesofPoints[7] = new PointF(10, 10);

   	base.AddLines(seriesofPoints, true);
   }
   ```

3. The [Clone()](/api/telerik.reporting.drawing.shapes.shapebase#collapsible-Telerik_Reporting_Drawing_Shapes_ShapeBase_Clone) method should also be overridden to return the new shape:

   ```C#
   public override object Clone()
   {
   	return new MyCustomShape()
   	{
   		Bounds = this.Bounds
   	};
   }
   ```

After the Custom Shape has been created, it can be instantiated and added to the report.

[Here is a sample](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/customshape.zip?sfvrsn=35af7bc9_2) demonstrating the approach.

## Notes

The geometry of _MyCustomShape_ in the sample should be changed according to the specific requirements by modifying the **CreateShape()** method body using the functionality of the [System.Drawing namespace](https://learn.microsoft.com/en-us/dotnet/api/system.drawing).

The project _ReportLibrary1_ should be built before previewing _Report1_, where a single _MyCustomShape_ item is added in the constructor.
