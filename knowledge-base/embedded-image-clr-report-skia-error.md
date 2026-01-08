---
title: How to Resolve the "You can assign System.String, IImage, System.Drawing.Image" Error in Telerik Reporting
description: "Learn how to resolve the error message 'You can assign System.String, IImage, System.Drawing.Image (for GDI rendering), or SKBitmap (for Skia rendering) instances only'."
type: how-to
page_title: Resolving the "You can assign System.String, IImage, System.Drawing.Image" Error in Telerik Reporting
slug: embedded-image-clr-report-skia-error
tags: telerik-reporting, error, graphicsEngine, skia, system-drawing, image
res_type: kb
---

## Environment

| Property        | Value                        |
| --------------- | ---------------------------- |
| Product         | Progress® Telerik® Reporting |
| Version         | 17.2.23.1010+                |
| Graphics Engine | Skia                         |

## Description

I have a CLR report definition created with the [Visual Studio Report Designer for the .NET Framework]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}).

I received an error message `You can assign System.String, IImage, System.Drawing.Image (for GDI rendering), or SKBitmap (for Skia rendering) instances only` when using Telerik Reporting with the Skia graphics engine.

## Solution

When you embed images in reports in the Visual Studio Report Designer, they get added as resources in the `resx` file of the report definition.

If you open the resource file with a text editor like Notepad++, the corresponding asset looks like the next snippet that represents a `System.Drawing.Bitmap` object:

```XML
<assembly alias="System.Drawing" name="System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
<data name="pictureBox2.Value" type="System.Drawing.Bitmap, System.Drawing" mimetype="application/x-microsoft.net.object.bytearray.base64">
	<value>
		iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAAAXNSR0I....
	</value>
</data>
```

Skia does not support the types from the GDI namespace `System.Drawing`. To resolve this error, you need to change the type of the above image to a type that is valid for both Skia and System.Drawing (GDI) graphic engines.

Follow these steps to fix the error:

1. Open the RESX file that contains the code referencing the image.
1. Locate the code that references the image as a `Bitmap` instance:

   ```XML
   <assembly alias="System.Drawing" name="System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
   <data name="{pictureBoxNameHere}.Value" type="System.Drawing.Bitmap, System.Drawing" mimetype="application/x-microsoft.net.object.bytearray.base64">
   	<value>
   		{the value of the image base64 string here}
   	</value>
   </data>
   ```

1. Replace the code referencing the image with a pure base64 string:

   ```XML
   <data name="{pictureBoxNameHere}.Value" xml:space="preserve">
   	<value>
   		{the value of the image base64 string here}
   	</value>
   </data>
   ```

The result for the sample image above would be:

```XML
<data name="pictureBox2.Value" xml:space="preserve">
	<value>
		iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAAAXNSR0I....
	</value>
</data>
```

## Note

If you assign the PictureBox value with code, you can also cast the `Bitmap` to `Telerik.Drawing.ImageBase` or `byte[]` before assigning it to the report item.
