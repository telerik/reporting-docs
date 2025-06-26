---
title: NullReferenceException Thrown When Showing Report in WinForms Report Viewer
description: "Resolving NullReferenceException in Telerik Reporting when using the WinForms Report Viewer with no parent form."
type: troubleshooting
page_title: NullReferenceException in Telerik Reporting WinForms Report Viewer
meta_title: NullReferenceException in Telerik Reporting WinForms Report Viewer
slug: nullreferenceexception-licensing-watermark-winforms-reportviewer
tags: telerik reporting, winforms, licensing issue, nullreferenceexception, reportviewer
res_type: kb
ticketid: 1691214
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>19.1.25.521</td>
</tr>
</tbody>
</table>

## Description

I encounter a `NullReferenceException` when attempting to display a report using the Telerik Reporting WinForms Report Viewer. My VB.NET WinForms application utilizes the embedded report engine and includes the proper licensing and Report Viewer NuGet packages. While the build confirms a valid Telerik Reporting license, running the form crashes at `UILicenseProvider.cs` in the `ShowWatermark` method due to `base.LicenseInfo` being null.

The issue occurs when the `RefreshReport()` method is called before the Report Viewer is added to a parent form. This behavior results in the licensing logic failing.

## Cause

The issue arises because the Telerik Reporting WinForms Report Viewer requires a parent form in order to properly execute its licensing logic. Without a parent form, the `base.LicenseInfo` property is null, causing the `NullReferenceException`.

## Solution

To resolve the issue, ensure that the Report Viewer control is added to the `Controls` collection of the parent form before invoking the `RefreshReport()` method. Update the code as shown below:

### Updated Code Example

```vb.net
Private Sub ReportViewer_Load(sender As Object, e As EventArgs) Handles MyBase.Load
    Dim reportSource1 As UriReportSource = New UriReportSource()
    reportSource1.Uri = "Reports\SampleReport.trdp"

    Dim reportViewer = New Telerik.ReportViewer.WinForms.ReportViewer()
    reportViewer.ReportSource = reportSource1
    reportViewer.Dock = System.Windows.Forms.DockStyle.Fill
    reportViewer.Name = "reportViewer1"
    reportViewer.TabIndex = 1
    reportViewer.Visible = True
    reportViewer.Size = New System.Drawing.Size(800, 600)

    Me.Controls.Add(reportViewer) ' Add Report Viewer to parent form's Controls collection.

    reportViewer.RefreshReport() ' Call RefreshReport after adding to Controls.
End Sub
```

### Key Changes

1. Add the `reportViewer` instance to the form's `Controls` collection before calling `RefreshReport()`.
2. Ensure the control is properly initialized with visibility and size settings.

This adjustment prevents the `NullReferenceException` and allows the licensing logic to execute correctly.

## See Also

- [WinForms ReportViewer Documentation](https://docs.telerik.com/reporting/winforms-report-viewer-overview)
- [RefreshReport Method](https://docs.telerik.com/reporting/api/telerik.reportviewer.winforms.reportviewerbase#Telerik_ReportViewer_WinForms_ReportViewerBase_RefreshReport)
- [Controls Collection in WinForms](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.control.controls?view=windowsdesktop-9.0)
- [Bug Report: NullReferenceException Thrown by WinForms Report Viewer](https://feedback.telerik.com/reporting/1691310-nullreferenceexception-thrown-by-the-winforms-report-viewer-when-there-is-no-parent-form)
