---
title: Export Options
page_title: Configuring Export Options in the Native Blazor Report Viewer
description: "Learn how to enable Export Options in the Native Blazor Report Viewer and configure a rendering format's available device settings before export."
slug: native-blazor-report-viewer-export-options-dialog
tags: blazor,export,native,settings,viewer
tag: new
published: True
position: 4
reportingArea: NativeBlazor
---

# Configuring Export Options in the Native Blazor Report Viewer

Use the Export Options dialog to configure rendering-format device settings before you export a report from the Native Blazor Report Viewer.

> The feature was introduced with [Telerik Reporting 2026 Q3 (20.2.26.1007)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q3-(20-2-26-1007)).

<p style="text-align: center;"><strong>Export Options Dialog in the Native Blazor Report Viewer</strong></p>

<div style="max-width: 75%; margin: 0 auto; text-align: center;" markdown="1">

![The Export Options dialog with the PDF format selected and its configurable export settings.](../images/export-options-dialog.png)

</div>

## Prerequisites

- A Blazor application that uses the Native Blazor Report Viewer and connects to a Reporting REST service or Telerik Report Server.
- At least one available rendering extension that provides configurable settings.

## Enable Export Options

Pass an `ExportDialogOptions` object to the viewer's `ExportDialog` parameter:

```CSharp
@using System.Collections.Generic
@using Telerik.ReportViewer.BlazorNative

<ReportViewer ServiceType="@ReportViewerServiceType.REST"
              ServiceUrl="@ServiceUrl"
              @bind-ReportSource="@ReportSource"
              ExportDialog="@ExportDialog">
</ReportViewer>

@code {
    private string ServiceUrl { get; set; } = "https://localhost:5001/api/reports";

    private ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions(
        "Report Catalog.trdp",
        new Dictionary<string, object>());

    private ExportDialogOptions ExportDialog { get; } = new ExportDialogOptions
    {
        Enabled = true
    };
}
```

The `Enabled` property defaults to `true`. Set it to `false` to hide **Export Options** while keeping direct exports available. The command appears only when the dialog is enabled and at least one available rendering extension has configurable settings.

## Configure a Format

1. Open a report in the Native Blazor Report Viewer.
1. Select **Export** and then **Export Options**.
1. Select a format and change its available settings.
1. Select **Save** to apply the settings and close the dialog.
1. Select the format in the **Export** menu to export the report with the saved settings.

<p style="text-align: center;"><strong>Export Options Workflow</strong></p>

![The report viewer opens Export Options, changes PDF settings, saves them, and then exports the report.](../images/export-dialog-workflow.gif)

## Next Steps

- [Customize Export Options settings on the Reporting REST Service](slug:customize-export-options)
- [Review Export Options across Telerik Reporting web viewers](slug:web-report-viewers-export-options-dialog)

## See Also

- [Native Blazor Report Viewer Overview](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview)
- [Using the Native Blazor Report Viewer](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer)
