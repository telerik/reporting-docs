---
title: How to Resolve the "You can assign System.String, IImage, System.Drawing.Image" Error in Telerik Reporting
description: "Learn how to resolve the error message 'You can assign System.String, IImage, System.Drawing.Image (for GDI rendering), or SKBitmap (for Skia rendering) instances only'."
type: how-to
page_title: Resolving the "You can assign System.String, IImage, System.Drawing.Image" Error in Telerik Reporting
slug: embedded-image-clr-report-skia-error
tags: telerik-reporting, error, graphicsEngine, migration
res_type: kb
---

## Environment

| Property | Value |
| --- | --- |
| Product | Progress® Telerik® Reporting |
| Version | 17.2.23.1010+ |

## Description

I received an error message `You can assign System.String, IImage, System.Drawing.Image (for GDI rendering), or SKBitmap (for Skia rendering) instances only` when using the `graphicsEngine` property with Telerik Reporting version 18.0.24.130. This error occurred while migrating from Telerik Report version 17.1.23.606 to version 18.0.24.130.

## Solution
To resolve this error, you need to change the type of image used in your CS reports to a type that is valid for both Skia and System.Drawing (GDI) rendering. Skia does not support all types from the GDI namespace `System.Drawing`.

Follow these steps to fix the error:

1. Open the RESX file that contains the code referencing the image.
2. Locate the code that references the image as a `Bitmap` instance:

```xml
<assembly alias="System.Drawing" name="System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" />
<data name="pictureBox2.Value" type="System.Drawing.Bitmap, System.Drawing" mimetype="application/x-microsoft.net.object.bytearray.base64">
  <value>
    ...
  </value>
</data>
```

3. Replace the code referencing the image with a pure base64 string:

```xml
<data name="pictureBox2.Value" xml:space="preserve">
  <value>
    ...
  </value>
</data>
```

4. If you assign the PictureBox value with code, you can also cast the `Bitmap` to `Telerik.Drawing.ImageBase` or `byte[]` before assigning it to the report item.

Following these steps will resolve the "You can assign System.String, IImage, System.Drawing.Image" error when using the `graphicsEngine` property in Telerik Reporting version 18.0.24.130.

Note: I have also linked a video that demonstrates the process of changing the hard-coded images in your CS reports to avoid this problem.
