---
title: Images Missing when Opening DOCX Reports in OneDrive
description: "Learn why the images may be missing when opening a Word report exported with Telerik Reporting R2 2023 SP1 or older in OneDrive."
type: troubleshooting
page_title: Microsoft Word doesn't display images on OneDrive
slug: images-missing-from-docx-in-onedrive
tags: 
ticketid: 1628194
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>17.1.23.718 and older</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Rendering Format</td>
			<td>Word Document</td>
		</tr>
	</tbody>
</table>

## Description

When I export a report that contains an image to DOCX with the Reporting version R2 2023 SP1 or older, the image may not be displayed when the Word document is kept on OneDrive.

## Error Message

`The linked image cannot be displayed. The file may have been moved, renamed, or deleted. Verify that the link points to the correct file and location.`

## Cause/Possible Causes

Microsoft have deprecated some previously supported tags in the OpenXML.

With [R3 2023 (17.2.23.1010)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010) we started replacing these tags in the reports rendered in OpenXML formats - `PictureBox item uses DrawingML instead of VML in OpenXML rendering extensions`.

Here is how the XML generated for an image embedded in the OpenXML looks like in:

* R2 2023 SP1 and before:

````XML
<w:pict><v:image style="width:108pt;height:51pt" xmlns:v="urn:schemas-microsoft-com:vml"><v:imagedata cropleft="-0.5794312" croptop="0" cropright="-0.5794313" cropbottom="0" r:pict="Rb91251125dcc43d0" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" /></v:image></w:pict>
````

* R3 2023 and later:

````XML
<w:drawing><wp:inline xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"><wp:extent cx="1368000" cy="647999" /><wp:docPr id="2" name="" /><a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"><a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture"><pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"><pic:nvPicPr><pic:cNvPr id="2" name="" /><pic:cNvPicPr /></pic:nvPicPr><pic:blipFill><a:blip r:embed="R6f68189fed5f4494" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" /><a:srcRect l="-57943" t="0" r="-57943" b="0" /><a:stretch><a:fillRect /></a:stretch></pic:blipFill><pic:spPr><a:xfrm><a:ext cx="1368000" cy="647999" /></a:xfrm><a:prstGeom prst="rect" /></pic:spPr></pic:pic></a:graphicData></a:graphic></wp:inline></w:drawing>
````

## Solution

To fix the problem you need to use our latest version R3 2023 (17.2.23.1010) as we switched to the supported tags starting from this version.

## See Also

* [R3 2023 (17.2.23.1010)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010)
