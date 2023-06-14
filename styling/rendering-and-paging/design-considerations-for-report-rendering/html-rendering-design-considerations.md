---
title: HTML Rendering
page_title: HTML Rendering Design Considerations at a glance
description: "Learn important details about the behavior and limitations of the HTML5 and MHTML rendering formats, that need to be taken into account when designing a report with HTML rendering in mind."
slug: telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/html-rendering-design-considerations
tags: html, rendering, design, considerations
published: True
position: 1
previous_url: /designing-reports-considerations-html
---

# Design Considerations for the HTML Rendering

The HTML rendering extension renders a report into __HTML5__ or __MHTML__ format.

## HTML Output

The HTML5 rendering extension is based on the Image rendering extension, with some differences. For information common to both output formats, see [Image Rendering Design Considerations]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations%}). This topic describes features that are specific to the HTML output format.

### Rendering

* All report items are rendered as separate absolute positioned div elements.
* All output is generated with __UTF8 encoding.__
* The strings are measured using GDI+. This can lead to differences between Image rendering and the Web Browsers. Also justified text may require to be adjusted due to the difference in the measurement algorithms.
* In Interactive preview the Table/Crosstab/List item is rendered on a single page without page breaks.
* By default the Graph, Map and Barcode items are rendered as SVG elements. In older browsers without support for SVG, the items are rendered automatically as Bitmap objects displayed in IMG elements. The usage of SVG elements can be explicitly controlled through the [HTML5]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/html5-device-information-settings%}) and [HTML5Interactive]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/html5interactive-device-information-settings%}) device information settings. More details how to apply the settings are available in the [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%}) overview.

>note If the subreport report BackgroundColor is not Transparent (by default is White) subreport item borders may not be rendered. In order to avoid this set the subreport report BackgroundColor to Transparent.


### Pagination

Page size is calculated based on whether the report is rendered for __Interactive view__ or __Print Preview__.

### Interactivity

All [Actions]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/overview%}) are supported.

The legacy ASP.NET viewer renders tooltips on SVG elements using the `<title>` attribute and browsers support it in a different manner, that's why the tooltips on SVG elements are rendered as a single line.


### Browsers and limitations

* Internet Explorer Quirks Mode is not supported, since it is based on Internet Explorer 5.5. For more details check the [Defining document compatibility](https://learn.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/compatibility/cc288325(v=vs.85)) MSDN article.
* Compatibility View for Internet Explorer is not supported, since it is based on Internet Explorer 7. For more details check the [Defining document compatibility](https://learn.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/compatibility/cc288325(v=vs.85)) MSDN article.
* Internet Explorer has a limitation for the number of HTML elements that can be rendered on a single page. This limitation may prevent the displaying of reports with large amount of items rendered without page breaks. Displaying the report in Print preview will page the content.
* Depending on the browser's layout engine fonts can be measured differently, which may lead to displaying clipped text in reports. The used in the reports fonts should be considered with the targeted browsers.

## MHTML Output

### Rendering

Reports can be output as MHTML (Web archive or "MIME Encapsulation of Aggregate HTML Documents") standard. MHTML is used for including resources in the same file as the HTML code. This is particularly useful when sending email because all resources, such as image and sound files, are included in a single file.

The following rendering specifics apply to MHTML:

* Styles specified in report item properties are injected to the HEAD tag for use in the corresponding HTML elements.
* The size of report items is the same as in design-time and the browser is responsible for sizing them.

### Interactivity

* URL actions on report items are rendered as hyperlinks in HTML. When you click the hyperlink, the default Web browser opens and navigates to the specified URL.
* Table of contents interactivity (navigational links to report items) is not supported.

## See Also

* [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
* [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
