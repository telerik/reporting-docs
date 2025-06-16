---
title: TypeError undefined is not iterable in HTML5-based report viewers
description: Learn how to resolve the 'TypeError undefined is not iterable' error when previewing a report in HTML5-based report viewers.
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

This issue occurs due to a breaking change in the 19.1.25.521 version, where the report viewer is no longer fully initialized immediately after the `$("#reportViewer1").telerik_ReportViewer` call. As a result, subsequent calls like `reportViewer.reportSource()` will fail because the viewer instance is not yet ready.

## Solution

Place logic that relies on the report viewer being fully initialized, such as the `reportViewer.reportSource()` calls, inside the `ready` event instead. For example, in the [HTML5 report viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), this would look as follows:

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
````

## See Also

- [Kendo UI Themes Documentation](https://docs.telerik.com/kendo-ui/styles-and-layout/themes-overview)
