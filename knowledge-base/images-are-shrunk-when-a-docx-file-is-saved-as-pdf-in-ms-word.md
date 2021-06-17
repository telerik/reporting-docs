---
title: Images are Shrunk when a DOCX file is Saved as PDF in MS Word
description: Images are Shrunk when a DOCX file is saved as PDF in MS Word.
type: how-to
page_title: Images are Shrunk when a DOCX file is saved as PDF in MS Word
slug: images-are-shrunk-when-a-docx-file-is-saved-as-pdf-in-ms-word
res_type: kb
---



    
## PROBLEM

**Images are Shrunk when a DOCX file is saved as PDF in MS Word.**  
  
## SOLUTION  

Graph, Map and Barcode items are exported as EMF in DOCX files - [Design Considerations for Word Rendering](../designing-reports-considerations-word). MS Word has issues with EMF content and fails to convert it correctly on an attempt to save the loaded DOCX file as PDF.   
  

You can configure the reporting engine to render Graph, Map and Barcode items as Bitmap images - [Word Device Information Settings](../device-information-settings-word) (UseMetafile parameter).  
  

For more details how to add the DOCX settings, please check [Telerik Reporting Configuration Section](../configuring-telerik-reporting) and  [Extensions element](../configuring-telerik-reporting-extensions).  
  



