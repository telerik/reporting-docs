---
title: Images are Shrunk when a DOCX file is Saved as PDF in MS Word
description: Images are rendered with wrong size when a DOCX file is saved as PDF in MS Word.
type: troubleshooting
page_title: Images are rendered smaller when a DOCX file is saved as PDF in MS Word
slug: images-are-shrunk-when-a-docx-file-is-saved-as-pdf-in-ms-word
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
   <tr>
		<td>Rendering Extensions</td>
		<td>DOCX, PDF</td>
	</tr>
  	<tr>
		<td>Report Items</td>
		<td>Graph, Map and Barcode</td>
	</tr>
</table>

    
## Description

Graph, Map and Barcode items are exported as EMF in DOCX files - [Design Considerations for Word Rendering](../designing-reports-considerations-word).

MS Word has issues with EMF content and fails to convert it correctly on an attempt to save the loaded DOCX file as PDF.  
  
## Solution   
  
You can configure the reporting engine to render Graph, Map and Barcode items as **Bitmap** images - [Word Device Information Settings](../device-information-settings-word) (**UseMetafile** parameter).  
  
## See Also
 
[Telerik Reporting Configuration Section](../configuring-telerik-reporting).

[Extensions element](../configuring-telerik-reporting-extensions).  
