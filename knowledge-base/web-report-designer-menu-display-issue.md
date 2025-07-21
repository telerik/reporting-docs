---
title: Fixing Web Report Designer Menu Display Issue in Blazor
description: Learn how to resolve menu display issues with the Web Report Designer in Blazor.
type: how-to
page_title: Resolving Menu Display Problems in Web Report Designer for Blazor
meta_title: Resolving Menu Display Problems in Web Report Designer for Blazor
slug: web-report-designer-menu-display-issue
tags: reporting, web-report-designer, menu, css, kendo
res_type: kb
ticketid: 1693136
---

## Environment

<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td> Reporting Web Report Designer </td>
        </tr>
        <tr>
            <td> Version </td>
            <td> 19.1.25.716 </td>
        </tr>
    </tbody>
</table>

## Description

I cannot see the menu in the Web Report Designer integrated into my Blazor application. The menu is covered by the areas below it. I suspect site.css configurations might be causing this issue. I am unsure if this is related to custom CSS or Kendo themes. 

## Solution

To resolve the menu display issue in the Web Report Designer, follow these steps:

1. Ensure the Web Report Designer uses its default theme. Switch from any custom theme (e.g., `default-ocean-blue.css`) to the default theme by using the following CSS configuration:

   ```html
   <link rel="stylesheet" id="TelerikThemeLink" href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" />
   ```

1. Remove any custom Kendo themes or manually included theme files. The Web Report Designer manages its required theme resources internally.

1. You do not need to manually update or install specific Kendo UI versions. The required resources are included with the Web Report Designer installation.

1. Ensure the correct loading order of JavaScript files. The `webReportDesigner.kendo-19.1.25.716.min.js` file must be loaded **before** the `webReportDesigner-19.1.25.716.min.js` file, as Kendo must initialize before the designer widget.

1. If issues persist, check the `kendo.version` in the browser console to ensure the Web Report Designer loads the required version. The Kendo JS subset can be found at:

   ```
   C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q2\Html5\ReportDesigner\js
   ```

## See Also

* [Web Report Designer Overview]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Kendo UI for jQuery Release History](https://www.telerik.com/support/whats-new/kendo-ui/release-history/kendo-ui-for-jquery-2025-1-227)
* [Kendo UI for jQuery Theme Compatibility](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/sass-themes/compatibility)
