---
title: Characters not appearing correctly in PDF files
description: Characters not appearing correctly in PDF files.
type: how-to
page_title: Characters not appearing correctly in PDF files
slug: characters-not-appearing-correctly-in-pdf-files
res_type: kb
---

## Description  
Characters not appearing correctly in PDF files.  
  
Strange symbols and squares appearing at the place of text in a PDF produced by Telerik Reporting.  
 Possible causes are

- The used font is not TrueType;
- The used font does not support the characters you need to display;
- The used font is not available on the server and/or the client machines.

  
## Solution
The Telerik Reporting rendering mechanisms use native objects for the selected media.
  
 In order to produce a PDF that visualizes content correctly via Telerik Reporting, the report must be designed with **TrueType font** that is available on the machine where reports are processed and rendered. Reports are processed and rendered server-side.  
  
 If the text contains special characters like **custom glyphs, icons**, you need to check if the font supports them. You may need to switch to a font with **Uncode characters support** e.g. Arial Unicode MS.  
  
 If the **font cannot be installed on the server machine**, where reports are processed and rendered, you can use <a href="../configuring-telerik-reproting-privatefonts" target="_blank">**Telerik Reporting privateFonts settings**</a>. The settings are applicable only through the configuration file of the application. You will need to <a href="../configuring-telerik-reporting" target="_blank">declare a Telerik.Reporting section first</a>.  
  
 If the **font is not available on the client machine**, you can fully embed the fonts in the PDF file during its generation. You will need to <a href="../configuring-telerik-reporting" target="_blank">declare a Telerik.Reporting section first</a>. Then you need to configure the PDF extension and its <a href="../device-information-settings-pdf" target="_blank">**FontEmbedding**</a> parameter:  


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

  
 The settings can be done in code if you export programmatically - <a href="../configuring-telerik-reporting-extensions#set-rendering-parameters-programmatically" target="_blank">Set rendering parameters programmatically</a>.  
  


