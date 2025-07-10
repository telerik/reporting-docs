---
title: Upgrading to 19.1.25.521 Breaks Project Due to Licensing Issues
description: Learn how to resolve project issues after upgrading to Telerik Reporting 19.1.25.521, including browser caching problems and deployment concerns.
type: how-to
page_title: Fixing Licensing Issues After Upgrading to Telerik Reporting 19.1.25.521
meta_title: Fixing Licensing Issues After Upgrading to Telerik Reporting 19.1.25.521
slug: fixing-licensing-issues-upgrading-telerik-reporting-19-1-25
tags: telerik-reporting, licensing, cache, incognito, hard-refresh, edge-browser, deployment, nuget
res_type: kb
ticketid: 1690549
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Progress® Telerik® Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 19.1.25.521 </td>
</tr>
</tbody>
</table>

## Description

After upgrading to Telerik Reporting version 19.1.25.521, the project fails due to licensing issues. The problem is specific to the Edge browser and is resolved in incognito mode. Hard-refreshing the browser resolves the issue, but concerns arise about users encountering caching problems after deployment. You want to ensure that the browser loads the latest JavaScript files without caching old resources.

This knowledge base article also answers the following questions:
- How to fix browser caching issues with Telerik Reporting after upgrading?
- How to ensure users don't load outdated JS files from previous versions?
- How to resolve Edge-specific errors with Telerik Reporting Viewer?

## Solution

To resolve the issue, follow these steps:

1. Perform a hard refresh by pressing `CTRL+F5` in the Edge browser.
2. If the hard refresh doesn’t work:
   - Open the browser's DevTools (`F12` or right-click and select "Inspect").
   - Navigate to the "Network" tab.
   - Check the "Disable cache" checkbox.
   - Restart the browser and perform another hard refresh (`CTRL+F5`).
3. Verify that all JavaScript resources are returned with a status code 200, indicating no cache usage.

To avoid similar problems for end-users after deployment, use a cache-busting technique by appending a query string (e.g., version or timestamp) to the script URLs. For example:

```html
<script src="_content/Telerik.UI.for.Blazor/js/telerik-blazor.js?v=1.1"></script>
<script src="_content/Telerik.ReportViewer.BlazorNative/js/reporting-blazor-viewer.js?v=1.1"></script>
```

This forces browsers to reload the updated files.

## See Also

- [Setting Up Your Telerik Reporting License Key](https://docs.telerik.com/reporting/licensing/setting-up-your-telerik-reporting-license-key#setting-up-your-telerik-reporting-license-key)
- [ASP.NET Core Blazor Static Files](https://learn.microsoft.com/en-us/aspnet/core/blazor/fundamentals/static-files?view=aspnetcore-9.0)
- [Errors and Warnings in Telerik Reporting Licensing](https://docs.telerik.com/reporting/licensing/license-errors-and-warnings?_gl=1*132vqlm*_ga_9JSNBCSF54*czE3NTAxNDM5MjkkbzIkZzEkdDE3NTAxNTI2NjYkajUzJGwwJGgw)
