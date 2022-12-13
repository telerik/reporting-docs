---
title: Fonts Requirements
page_title: Fonts Requirements 
description: Fonts Requirements
slug: telerikreporting/designing-reports/rendering-and-paging/fonts-requirements
tags: fonts,requirements
published: True
position: 5
previous_url: /rendering-fonts-in-reports
---

# Fonts Requirements

Telerik Reporting engine uses GDI+ methods to create reports with native objects for the selected rendering format. This requires all used fonts to be supported by GDI+.

## Requirements

* .NET supports only __TrueType__  fonts. You can check your available fonts in __%windir%\fonts__;

* The selected fonts should be considered with the text that will be visualized. Special glyphs and icons will require you to use a font with Unicode characters support like Arial Unicode MS.

* The Report Designer will load all TrueType fonts __installed on the machine__. If in a Report Designer you open a Telerik Report that uses different than the available fonts, the Reporting Engine will replace the missing font with a default one;

* Font styling like `underline`, `bold`, `italic` may not appear in all rendering formats, if the used font does not have the corresponding variation e.g. Arial Bold, Arial Bold Italic. The IMAGE rendering is an exclusion, as the image is created by the Reporting engine that reads the report properties.

* Fonts used in the designed reports must be available on the server machine where reports are processed and rendered. If the fonts cannot be installed before starting the application, you can distribute them as [private fonts]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element%}).

* Depending on the tool used for reading the rendered Telerik Reports, the client machine may need to have the fonts installed. In the case of the PDF rendering, you can embed all custom fonts in the PDF file - [Design Considerations for PDF Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/pdf-rendering-design-considerations%}). In case of providing a web preview in browser, you can distribute fonts as [private fonts]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element%}).

For more details about each rendering format, you can check the corresponding article under [Design Considerations for Report Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/overview%}).
