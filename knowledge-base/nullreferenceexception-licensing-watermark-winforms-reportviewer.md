---
title: NullReferenceException Thrown When Showing Report in WinForms Report Viewer
description: "Learn how to resolve the NullReferenceException in Telerik Reporting when using the WinForms Report Viewer with no parent form."
type: troubleshooting
page_title: The WinForms Report Viewer Crashes When Not Inside a Parent Control
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

I encounter a `NullReferenceException` when attempting to display a report using the [WinForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}). My NET WinForms application utilizes the embedded report engine and includes the proper `Telerik.Licensing` and WinForms Report Viewer NuGet packages. 

While the build confirms a valid Telerik Reporting license, running the form crashes at `UILicenseProvider.cs` in the `ShowWatermark` method due to `base.LicenseInfo` being null.

## Error Message

```
Telerik.ReportViewer.WinForms.Licensing.UiLicensePresenter.ShowWatermark(Action showWatermarkCallback)
   at Telerik.ReportViewer.Common.TelerikLicensePresenterBase.PresentWatermark(Action showWatermarkCallback)
   at Telerik.ReportViewer.WinForms.WinViewer.OnPaint(PaintEventArgs eventArgs)
   at System.Windows.Forms.Control.PaintWithErrorHandling(PaintEventArgs e, Int16 layer)
   at System.Windows.Forms.Control.WmPaint(Message& m)
   at System.Windows.Forms.Control.WndProc(Message& m)
   at System.Windows.Forms.Control.ControlNativeWindow.WndProc(Message& m)
   at System.Windows.Forms.NativeWindow.Callback(HWND hWnd, MessageId msg, WPARAM wparam, LPARAM lpa
```

## Cause

The issue occurs when the [RefreshReport()](/api/telerik.reportviewer.winforms.reportviewerbase#Telerik_ReportViewer_WinForms_ReportViewerBase_RefreshReport) method is called before the WinForms Report Viewer is added to a parent form/control. This behavior results in the licensing logic failing.

The issue arises because the WinForms Report Viewer requires a parent form in order to properly execute its licensing logic. Without a parent form, the `base.LicenseInfo` property is `null`, causing the `NullReferenceException` to be thrown.

## Solution

To resolve the issue, ensure that the WinForms Report Viewer control is added to a parent form before it starts rendering the report. For example, the reference to the WinForms Report Viewer can be added to the `Controls` collection of the parent form before invoking the [RefreshReport()](/api/telerik.reportviewer.winforms.reportviewerbase#Telerik_ReportViewer_WinForms_ReportViewerBase_RefreshReport) method:

````C#
    private void Form1_Load(object sender, EventArgs e)
        {
            var reportSource1 = new UriReportSource();
            reportSource1.Uri = "Barcodes Report.trdp";
            var reportViewer = new Telerik.ReportViewer.WinForms.ReportViewer();
            reportViewer.ReportSource = reportSource1;
            reportViewer.Dock = System.Windows.Forms.DockStyle.Fill;
            reportViewer.Name = "reportViewer1";
            reportViewer.TabIndex = 1;
            reportViewer.Visible = true;
            reportViewer.Size = new System.Drawing.Size(800, 600);

            // add report viewer reference to the collection before the RefreshReport() method is invoked and the rendering begins
            this.Controls.Add(reportViewer);

            reportViewer.RefreshReport();
        }
````


## See Also

* [WinForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})
* [RefreshReport() Method](/api/telerik.reportviewer.winforms.reportviewerbase#Telerik_ReportViewer_WinForms_ReportViewerBase_RefreshReport)
* [Controls Collection in WinForms](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.control.controls?view=windowsdesktop-9.0)
* [Bug Report: NullReferenceException Thrown by WinForms Report Viewer](https://feedback.telerik.com/reporting/1691310-nullreferenceexception-thrown-by-the-winforms-report-viewer-when-there-is-no-parent-form)
