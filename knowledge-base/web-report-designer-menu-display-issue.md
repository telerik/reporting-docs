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
    </tbody>
</table>

## Description

I cannot see the menu in the Web Report Designer integrated into my Blazor application. The menu is covered by the areas below it. 

## Solution

To resolve the menu display issue in the Web Report Designer (version 19.1.25.716 used in the samples):

* Ensure the Web Report Designer uses its default theme. This means to remove any custom Kendo themes or manually included theme files. The Web Report Designer manages its required theme resources internally.
* Ensure the correct loading order of JavaScript files. The `webReportDesigner.kendo-19.1.25.716.min.js` file must be loaded **before** the `webReportDesigner-19.1.25.716.min.js` file, as Kendo must initialize before the designer widget. The Kendo JS subset can be found in the installation folder of the Telerik Reporting product, for example, at `C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q2\Html5\ReportDesigner\js` for the version 2025 Q2.

If issues persist, check the `kendo.version` in the browser console to ensure the Web Report Designer loads the required version.

## See Also

* [Web Report Designer Overview]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Kendo UI for jQuery Release History](https://www.telerik.com/support/whats-new/kendo-ui/release-history/kendo-ui-for-jquery-2025-1-227)
* [Kendo UI for jQuery Theme Compatibility](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/sass-themes/compatibility)
