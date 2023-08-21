---
title: Select page of TIFF image
description: "Learn how to render a certain page of a mulri-page TIFF file using a custom user function in Telerik Reporting."
type: how-to
page_title: Choose page to render from a TIFF
slug: select-page-of-tiff-image
position: 
tags: TIFF
ticketid: 1620320
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

By default, the [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) report item will render the first page of the TIFF image file. This can be a problem when a multipage TIFF file is used as there would be no way to display any of the other pages.

## Solution

In order to render a certain page from the TIFF file, a [custom user function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) that selects that image is required. The function may look as bellow:

````CSharp
public static Image GetPageFromTiff(string path, int page)
		{
			Image tiffImage;
			List<Image> images;

			tiffImage = Image.FromFile(path);
			images = GetAllPages(tiffImage);

			return images[page];
		}

		private static List<Image> GetAllPages(Image multiPageImage)
		{
			List<Image> images = new List<Image>();
			int count = multiPageImage.GetFrameCount(FrameDimension.Page);
			for (int i = 0; i < count; i++)
			{
				multiPageImage.SelectActiveFrame(FrameDimension.Page, i);
				MemoryStream byteStream = new MemoryStream();
				multiPageImage.Save(byteStream, ImageFormat.Tiff);
				images.Add(Image.FromStream(byteStream));
				byteStream.Dispose();
			}
			return images;
		}
````

Then, in the Report Designer, to call the function we need to provide a path to the TIFF image and the desired page to be displayed, for example:

`= Namespace.Class.GetPageFromTiff("c:\temp\test.tif", 1)`

> The indexing is 0-based so when we give a 1 as the second argument, the second page's image will be rendered.

## See Also

* [Custom User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%})

