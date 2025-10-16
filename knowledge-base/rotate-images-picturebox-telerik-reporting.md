---
title: Rotating Images in PictureBox
description: Learn how to programmatically rotate images displayed in the PictureBox of Telerik Reporting when they are rotated due to device orientation metadata.
type: how-to
page_title: How to Rotate Images in PictureBox in Telerik Reporting
meta_title: Rotate Images in PictureBox in Telerik Reporting
slug: rotate-images-picturebox-telerik-reporting
tags: reporting, picturebox, rotate-image, exif-tags, rotatefliptype, custom-function
res_type: kb
ticketid: 1554867
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Telerik Reporting PictureBox</td>
</tr>
<tr>
<td>Version</td>
<td>Current</td>
</tr>
</tbody>
</table>

## Description

Images captured with mobile devices sometimes appear rotated in the [PictureBox](https://docs.telerik.com/reporting/designing-reports/item-types/reportitems/picture-box) component by 90, 180, or 270 degrees. This happens because mobile devices save orientation data into an Exif tag in the image metadata, which is then read by the Telerik Reporting PictureBox.

This knowledge base article also answers the following questions:
- How can I rotate images in a PictureBox in Telerik Reporting?
- How can I handle Exif orientation metadata in Telerik Reporting PictureBox?
- How can I reset the orientation of an image in Telerik Reporting PictureBox?

## Solution

To rotate an image in the Telerik Reporting PictureBox and reset its Exif orientation, follow these steps:

1. Implement a custom function to programmatically rotate the image. Use the following code example:

```csharp
public static class ImageHelper
{
    public static Image RotateImageAndResetExif(string imagePath, int rotateFlipType)
    {
        const int OrientationId = 0x0112;

        Image image = Image.FromFile(imagePath);

        // Rotate the image pixels
        image.RotateFlip(GetRotateFlipTypeFromInt(rotateFlipType));

        // Reset EXIF orientation to '1' (normal)
        if (image.PropertyIdList.Contains(OrientationId))
        {
            PropertyItem prop = image.GetPropertyItem(OrientationId);
            prop.Value = BitConverter.GetBytes((short)1);
            image.SetPropertyItem(prop);
        }

        return image;
    }

    public static RotateFlipType GetRotateFlipTypeFromInt(int value)
    {
        switch (value)
        {
            case 0:
                return RotateFlipType.RotateNoneFlipNone;
            case 1:
                return RotateFlipType.Rotate90FlipNone;
            case 2:
                return RotateFlipType.Rotate180FlipNone;
            case 3:
                return RotateFlipType.Rotate270FlipNone;
            case 4:
                return RotateFlipType.RotateNoneFlipX;
            case 5:
                return RotateFlipType.Rotate90FlipX;
            case 6:
                return RotateFlipType.Rotate180FlipX;
            case 7:
                return RotateFlipType.Rotate270FlipX;
            default:
                throw new ArgumentOutOfRangeException(nameof(value), "Invalid rotation value");
        }
    }
}
```

2. Register and load the assembly containing the `RotateImageAndResetExif` function in the Telerik Report Designer or Reporting REST Service.

3. Use the function in your report expressions with the syntax:

   ```
   = UserFunctions.ImageHelper.RotateImageAndResetExif("C:\images\img1.jpg", 1)
   ```

   - The first parameter specifies the absolute path to the image.
   - The second parameter is the rotation `RotateFlipType` that the image pixels should be rotated to. Review the available options in the official [RotateFlipType documentation](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.rotatefliptype?view=windowsdesktop-9.0).

### Additional Notes
Refer to [Custom User Functions Explained - Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions) for detailed instructions on using custom functions in reports.

## See Also

- [PictureBox Overview - Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/item-types/reportitems/picture-box)
- [Custom User Functions Explained - Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions)
- [RotateFlipType Documentation](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.rotatefliptype?view=windowsdesktop-9.0)
- [EXIF Tags Documentation](https://exiftool.org/TagNames/EXIF.html)
