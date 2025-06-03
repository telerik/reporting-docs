---
title: TypeError undefined is not iterable in Telerik ReportViewer
description: Resolving the 'TypeError: undefined is not iterable' error when previewing a report with Telerik ReportViewer.
type: troubleshooting
page_title: Fix TypeError undefined is not iterable in HTML5-based report viewer
slug: telerik-reportviewer-typeerror-undefined-is-not-iterable
tags: telerik reporting, telerik reportviewer, initialization, error, typeerror, javascript
res_type: kb
ticketid: 1688944
---

## Environment
<table>
<tbody>
<tr>
<td>Product</td>
<td>
Progress® Telerik® Reporting
</td>
</tr>
<tr>
<td>Version</td>
<td>19.1.25.521</td>
</tr>
</tbody>
</table>

## Description

When attempting to preview a report using an HTML5-based report viewer, the following error appears in the console:

`TypeError: undefined is not iterable (cannot read property Symbol(Symbol.iterator))`

## Cause

This issue occurs due to a breaking change in the latest version, where the report viewer is no longer fully initialized immediately after the `$("#reportViewer1").telerik_ReportViewer` call. As a result, subsequent calls like `reportViewer.reportSource()` immediately after initialization do not behave as expected.

## Solution

Use the `ready` event to ensure the report viewer is fully initialized before setting the report source. For example, in the HTML5 report viewer, this would look as follows:

````javascript
    $("#reportViewer1")
        .telerik_ReportViewer({
            serviceUrl: "api/reports",
            viewMode: telerikReportViewer.ViewModes.PRINT_PREVIEW,
            scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
            scale: 1,
            enableAccessibility: false,
            sendEmail: { enabled: false },

            ready: function (e, args) {
                const reportViewer = $("#reportViewer1").data("telerik_ReportViewer");

                if (reportViewer !== undefined) {
                    reportViewer.reportSource({
                        report: 'Report1'
                    });
                }
            }
        });
}
````

## See Also

- [Kendo UI Themes Documentation](https://docs.telerik.com/kendo-ui/styles-and-layout/themes-overview)
