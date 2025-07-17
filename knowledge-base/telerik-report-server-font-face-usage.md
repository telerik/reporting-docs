---
title: Fixing Missing Fonts in HTML Rendering
description: "Learn how to use @font-face rule to resolve missing fonts when rendering reports on a web page."
type: how-to
page_title: Resolving Font Rendering Issues in Web Report Viewers
meta_title: Resolving Font Rendering Issues in Web Report Viewers
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
            <td> Progress® Telerik® Reporting </td>
        </tr>
        <tr>
            <td> Report Viewer </td>
            <td> Web Report Viewers </td>
        </tr>
    </tbody>
</table>

## Description

To ensure that reports stored in the [Telerik Report Server](https://www.telerik.com/report-server) and displayed in a web report viewer, such as the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), consistently use a font, even when the font is not installed on client machines. The issue occurs when the Report Viewer defaults to a generic sans-serif font for users who do not have the custom font installed locally. Exporting the report to PDF correctly embeds the intended font because the font is available on the server.

This knowledge base article also answers the following questions:

* How can I apply a custom font in the Web Report Viewers?
* Why does the Report Viewer fallback to a sans-serif font?
* How to use @font-face to load custom fonts in Telerik Report Server?

## Solution

To resolve the issue, use the [@font-face](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face) CSS rule to load the custom font on the web page:

````html
<head>
    <style>
        @font-face {
          font-family: "Bitstream Vera Serif Bold";
          src: url("https://mdn.github.io/shared-assets/fonts/VeraSeBd.ttf");
        }
        #reportViewer1 {
            font-family: "Bitstream Vera Serif Bold", serif;
        }
    </style>
</head>
````


### Additional Tips

* Use the browser's [Developer Tools](https://developer.chrome.com/docs/devtools) to verify the font family applied to the text elements in the Report Viewer.
* Check the **Network** tab in Developer Tools to ensure the font file loads correctly.
* If the font does not load, ensure the file path or URL is accessible from the client machine.

## See Also

* [CSS @font-face Rule](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face)
