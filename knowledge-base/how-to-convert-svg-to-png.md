---
title: Convert SVG graphics to PNG picture
description: This article demonstrates how to display SVG graphics in PictureBox by converting it to PNG
type: how-to
page_title: How to convert SVG to PNG
slug: how-to-convert-svg-to-png
position:
tags:
ticketid: 1400737
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.222</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

Currently, the [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) can hold only the formats supported by GDI+ (BMP, GIF, JPEG, EXIF, PNG, and TIFF).

This KB article demonstrates how to convert SVG graphics to PNG picture and to set it as a value of the picturebox. Note that a NuGet package called [Svg](https://www.nuget.org/packages/Svg/) should be added to the project.

The approach is approperiate for reports which are designed in the Standalone Designer, as well as in the Visual Studio Report Designer.

## Solution

1. A [UserFunction]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) should be implemented through the code snippet below

   ```C#
   public static Bitmap ConvertToBitmap(string url)
   {
   	var svgDocument = Svg.SvgDocument.Open(url);
   	svgDocument.ShapeRendering = SvgShapeRendering.Auto;

   	Bitmap bmp = svgDocument.Draw(120, 120); // Draw Bitmap in any Size you need - for example 120px x 120px
   	return bmp;
   }
   ```

2. Register the user function as explained in [Extending Report Designer article]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}). A reference to the Svg.dll should be also attached.

3. Then the value of the picture box should be set to the following expression:

   `= UserFunctionClassName.ConvertToBitmap(Parameters.url.Value)`

Note that the report parameter holds the URL for the picture.
