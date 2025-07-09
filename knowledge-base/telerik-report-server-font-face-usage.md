---
title: Fixing Missing Fonts in Telerik Report Server Viewer
description: Learn how to use @font-face to resolve missing fonts when rendering reports
type: how-to
page_title: Resolving Font Rendering Issues in Telerik Report Server Viewer
meta_title: Resolving Font Rendering Issues in Telerik Report Server Viewer
slug: telerik-report-server-font-face-usage
tags: report-server, report-viewer, font-face, proxima-nova, css
res_type: kb
ticketid: 1688723
---

## Environment
<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td> Progress® Telerik® Report Server </td>
        </tr>
        <tr>
            <td> Version </td>
            <td> 10.3.24.1218 </td>
        </tr>
    </tbody>
</table>

## Description

To ensure that reports in the Telerik Report Server consistently use a font in the Report Viewer, even when the font is not installed on client machines. The issue occurs when the Report Viewer defaults to a generic sans-serif font for users who do not have Proxima Nova installed locally. Exporting the report to PDF correctly embeds the intended font, ensuring consistent appearance across different platforms.

This knowledge base article also answers the following questions:
* How can I apply a custom font in Telerik Report Server viewer?
* Why does the Report Viewer fallback to a sans-serif font?
* How to use @font-face to load custom fonts in Telerik Report Server?

## Solution

To resolve the issue, use the `@font-face` CSS rule to load the Proxima Nova font directly in the Report Viewer. Follow these steps:

1. Open the `Preview.cshtml` file of the Report Server.
1. Locate the `<head>` section of the HTML.
1. Add the following CSS code to define the `@font-face` rule and apply the font:

```html
<head>
    <!-- Other head elements -->
    <style>
        @font-face {
            font-family: 'Proxima Nova';
            src: url("path-to-proximanova.ttf") format("truetype");
        }
        #reportViewer1 {
            font-family: 'Proxima Nova', Verdana, Arial, sans-serif;
        }
    </style>****
</head>
```

1. Replace `"path-to-proximanova.ttf"` with the actual path or URL to the Proxima Nova font file.
1. Restart the Report Server to apply the changes.

### Additional Tips:
* Use the browser's Developer Tools (Inspect Element) to verify the font family applied to the text elements in the Report Viewer.
* Check the Network tab in Developer Tools to ensure the font file loads correctly.
* If the font does not load, ensure the file path or URL is accessible from the client machine.

## See Also

* [CSS @font-face Rule](https://www.w3.org/TR/css-fonts-3/#font-face-rule)
* [How to Customize Preview in Report Server]({%slug how-to-customize-preview-in-report-server%})
