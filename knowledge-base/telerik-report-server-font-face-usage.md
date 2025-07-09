---
title: Using @font-face to Fix Missing Fonts in Telerik Report Server Viewer
description: Learn how to use @font-face to resolve missing fonts when rendering reports in the Telerik Report Server viewer.
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

I need to ensure that reports in Telerik Report Server use the Proxima Nova font in the Report Viewer, even if the font is not installed on the client machines. The issue arises when the Report Viewer falls back to a default sans-serif font for users who do not have Proxima Nova installed locally. Exporting the report to PDF works correctly and embeds the intended font.

This knowledge base article also answers the following questions:
- How can I apply a custom font in Telerik Report Server viewer?
- Why does the Report Viewer fallback to a sans-serif font?
- How to use @font-face to load custom fonts in Telerik Report Server?

## Solution

To resolve the issue, use the `@font-face` CSS rule to load the Proxima Nova font directly in the Report Viewer. Follow these steps:

1. Open the `Preview.cshtml` file of the Report Server.
2. Locate the `<head>` section of the HTML.
3. Add the following CSS code to define the `@font-face` rule and apply the font:

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
    </style>
</head>
```

4. Replace `"path-to-proximanova.ttf"` with the actual path or URL to the Proxima Nova font file.
5. Restart the Report Server to apply the changes.

### Additional Tips:
- Use the browser's Developer Tools (Inspect Element) to verify the font family applied to the text elements in the Report Viewer.
- Check the Network tab in Developer Tools to ensure the font file loads correctly.
- If the font does not load, ensure the file path or URL is accessible from the client machine.

## See Also

- [CSS @font-face Rule](https://www.w3.org/TR/css-fonts-3/#font-face-rule)
- [How to Customize Preview in Report Server](https://docs.telerik.com/report-server/knowledge-base/how-to-customize-preview-in-report-server)
- [Telerik Report Server Configuration](https://docs.telerik.com/report-server/configuration-overview)
