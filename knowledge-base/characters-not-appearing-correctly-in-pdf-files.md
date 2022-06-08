---
title: Characters do not appear correctly in PDF files
description: Characters not displayed correctly in PDF files.
type: troubleshooting
page_title: Characters are not rendered correctly in PDF files
slug: characters-not-appearing-correctly-in-pdf-files
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
       <tr>
	    	<td>Rendering Format</td>
	    	<td>PDF</td>
	    </tr>
    </tbody>
</table>

## Description  

The Telerik Reporting rendering mechanisms use native objects for the selected media.
  
In order to produce a PDF that visualizes content correctly via Telerik Reporting, the report must be designed with **TrueType font** that is available on the machine where reports are processed and rendered. Reports are processed and rendered server-side.  

## Possible Causes

- The used font is not TrueType;

- The used font does not support the characters you need to display;

- The used font is not available on the server and/or the client machines.

  
## Solution
  
- If the text contains special characters like **custom glyphs, icons**, you need to check if the font supports them. You may need to switch to a font with **Unicode characters support** e.g. Arial Unicode MS.  
  
- If the **font cannot be installed on the server machine**, where reports are processed and rendered, you can use <a href="../configuring-telerik-reproting-privatefonts" target="_blank">**Telerik Reporting privateFonts settings**</a>. The settings are applicable only through the configuration file of the application. You will need to <a href="../configuring-telerik-reporting" target="_blank">declare a Telerik.Reporting section first</a>.  
  
- If the **font is not available on the client machine**, you can fully embed the fonts in the PDF file during its generation. You will need to <a href="../configuring-telerik-reporting" target="_blank">declare a Telerik.Reporting section first</a>. Then you need to configure the PDF extension and its <a href="../device-information-settings-pdf" target="_blank">**FontEmbedding**</a> parameter:  

```html
<Telerik.Reporting>
   <extensions>
     <render>
       <extension name="PDF" >
         <parameters>
           <parameter name="FontEmbedding" value="Full"/>
         </parameters>
       </extension>
     </render>
   </extensions>
</Telerik.Reporting>
```

```	json
"telerikReporting": {
  "extensions": [
    {
      "name": "PDF",
      "description":  "PDF Description",
      "parameters": [
        {
          "Name": "FontEmbedding",
          "Value": "Full"
        }
      ]
    }
  ]
}
```
  
## Notes

The settings can be edited in code if you export programmatically - <a href="../configuring-telerik-reporting-extensions#set-rendering-parameters-programmatically" target="_blank">Set rendering parameters programmatically</a>.  
  
## See Also

[PDF Rendering Design Considerations](../designing-reports-considerations-pdf)

[PDF Device Information Settings](../device-information-settings-pdf)
