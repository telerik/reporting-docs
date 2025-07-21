---
title: Fixing Web Report Designer Menu Display Issue in Blazor Server
description: Learn how to resolve menu display issues with the Web Report Designer in a Blazor Server application.
type: how-to
page_title: Resolving Menu Display Problems in Web Report Designer for Blazor Server
meta_title: Resolving Menu Display Problems in Web Report Designer for Blazor Server
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

I cannot see the menu in the Web Report Designer integrated into my Blazor Server application. The menu is covered by the areas below it. I suspect site.css configurations might be causing this issue. I am unsure if this is related to custom CSS or Kendo themes. 

This knowledge base article also answers the following questions:
- How to resolve Web Report Designer menu display issues in Blazor Server?
- Do I need to manually update Kendo UI versions for Web Report Designer?
- What theme configuration is required for Web Report Designer?

## Solution

To resolve the menu display issue in the Web Report Designer, follow these steps:

1. Ensure the Web Report Designer uses its default theme. Switch from any custom theme (e.g., `default-ocean-blue.css`) to the default theme by using the following CSS configuration:
   ```html
   <link rel="stylesheet" href="css/kendo.default-main.min.css" />
   ```

2. Remove any custom Kendo themes or manually included theme files. The Web Report Designer manages its required theme resources internally.

3. You do not need to manually update or install specific Kendo UI versions (e.g., Kendo UI 2025.2.702). The required resources are included with the Web Report Designer installation.

4. Ensure the correct loading order of JavaScript files. The `webReportDesigner.kendo-19.1.25.716.min.js` file must be loaded **before** the `webReportDesigner-19.1.25.716.min.js` file, as Kendo must initialize before the designer widget.

5. If using NuGet packages for the Web Report Designer, verify the following package versions are installed:
   ```xml
   <PackageReference Include="Telerik.WebReportDesigner.Blazor" Version="19.1.25.716" />
   <PackageReference Include="Telerik.WebReportDesigner.Services" Version="19.1.25.716" />
   ```

6. If issues persist, check the `kendo.version` in the browser console to ensure the Web Report Designer loads the required version. The Kendo JS subset can be found at:
   ```
   C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q2\Html5\ReportDesigner\js
   ```

## See Also

- [Web Report Designer Overview](https://docs.telerik.com/reporting/web-report-designer)
- [Kendo UI for jQuery Release History](https://www.telerik.com/support/whats-new/kendo-ui/release-history/kendo-ui-for-jquery-2025-1-227)
- [Kendo UI for jQuery Theme Compatibility](https://www.telerik.com/kendo-jquery-ui/documentation/styles-and-layout/sass-themes/compatibility)
