---
title: Fixing "Error Loading the Report Viewer’s Templates" in Telerik Reporting 20.3.26.1110
description: Resolve the "Error loading the report viewer's templates" issue in Telerik Reporting 20.3.26.1110 caused by Kendo UI icon name changes.
type: troubleshooting
page_title: Telerik Reporting Template Error After Upgrade
meta_title: Telerik Reporting Template Error After Upgrade
slug: error-loading-report-viewer-templates-kendo-2026-q4
tags: reporting, templates, error, kendo ui, rest service
res_type: kb
ticketid: 1720508
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
<td> 20.3.26.1110 </td>
</tr>
</tbody>
</table>

## Description

After upgrading Telerik Reporting to version 20.3.26.1110, the error "Error loading the report viewer’s templates" appears when trying to generate a report in a .NET 4.8 project using the Telerik Report Viewer. This issue occurs even after ensuring that the JavaScript files and DLLs have been updated and no configuration changes have been made. 

This problem is caused by the latest version of Kendo UI (2026.4.1111), which includes changes to icon names, specifically renaming the icon used for closing notifications from `x-outline` to `x-circle`. The mismatch in icon names in the viewer's template results in the error.

## Cause

The issue arises because the default template of the report viewer tries to load the `x-outline` icon, which was renamed to `x-circle` in the latest version of Kendo UI (2026.4.1111). This icon change causes the error when the template is loaded.

## Solution

To resolve the issue, use one of the following solutions:

### Solution 1: Use an Older Version of Kendo UI

1. Downgrade the Kendo UI version to 2026.3.1015.
2. Use the following URL to reference the older Kendo UI version in your project:

   ```html
   <script src="https://cdn.jsdelivr.net/npm/@progress/kendo-ui@2026.3.1015/umd/kendo.all.min.js"></script>
   ```

### Solution 2: Update the Template Locally

1. Download the default template from the following URL or use the response template:
   [Telerik Report Viewer Template](https://cdn.jsdelivr.net/npm/@progress/telerik-jquery-report-viewer@20.3.26.1110/dist/templates/telerikReportViewerTemplate.html)
   
2. Save the template locally in your project directory.

3. Open the downloaded template file and locate the line that specifies the `x-outline` icon (usually line 20).

4. Replace `x-outline` with `x-circle`.

5. Update your viewer's configuration to reference the local template. For configuration instructions, refer to step 9 in the [HTML5 ASP.NET MVC Report Viewer Manual Setup documentation](https://www.telerik.com/products/reporting/documentation/embedding-reports/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/manual-setup).

Example configuration for referencing the local template:

```javascript
$("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "https://your-server/ReportService",
    templateUrl: "path-to-local-template/telerikReportViewerTemplate.html",
    reportSource: {
        report: "ReportName"
    }
});
```

## See Also

- [Telerik Reporting Documentation](https://www.telerik.com/products/reporting/documentation/overview.aspx)
