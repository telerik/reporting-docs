---
title: TypeError Cannot read properties of undefined (reading 'wrapper') in HTML5-based report viewers
description: Learn how to resolve the TypeError about 'wrapper' in HTML5-based report viewers when AI-powered insights dialog fails to initialize.
type: troubleshooting
page_title: TypeError Cannot read properties of undefined (reading 'wrapper') in HTML5-based report viewers
meta_title: TypeError Cannot read properties of undefined (reading 'wrapper') in HTML5-based report viewers
slug: cannot-read-properties-of-undefined-reading-wrapper
tags: reporting, html5 viewer, kendo ui, theme, ai insights, wrapper
res_type: kb
---

## Environment

<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td> Reporting </td>
        </tr>
        <tr>
            <td> Version </td>
            <td> 19.2.25.1001 </td>
        </tr>
    </tbody>
</table>

## Description

When initializing the HTML5 Report Viewer, a `TypeError: Cannot read properties of undefined (reading 'wrapper')` error appears in the browser console, preventing the report viewer from loading properly.

## Cause

This error occurs when a [Sass-based Kendo UI theme](https://www.telerik.com/design-system/docs/themes/get-started/introduction/) is missing from the page. The report viewer requires proper Kendo UI styling to initialize correctly.

## Solution

Include a valid Kendo UI theme in your page by adding a CSS reference such as:

````html
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" />
````

For more information about available themes, see [Telerik and Kendo UI Themes Introduction](https://www.telerik.com/design-system/docs/themes/get-started/introduction/).