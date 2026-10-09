---
title: Export Options
page_title: Configuring Export Options in Telerik Reporting Web Viewers
description: "Learn how to enable Export Options across Telerik Reporting web viewers and configure format-specific device settings before you export reports."
slug: web-report-viewers-export-options-dialog
tags: export,settings,viewer,web
tag: new
published: True
position: 10
reportingArea: General
components: [general]
---

# Configuring Export Options in Telerik Reporting Web Viewers

The Export Options dialog lets users choose a rendering format and configure its available device settings before they export a report. This article describes the shared behavior and the configuration surfaces across Telerik Reporting web viewers.

> The feature was introduced with [Telerik Reporting 2026 Q3 (20.2.26.1007)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q3-(20-2-26-1007)).

<p style="text-align: center;"><strong>Export Options Dialog</strong></p>

<div style="max-width: 75%; margin: 0 auto; text-align: center;" markdown="1">

![The Export Options dialog with the PDF format selected and its configurable export settings.](images/export-options-dialog.png)

</div>

## Overview

The dialog uses the settings provided by the rendering extensions available to the report viewer. Users select a format, change its available settings, and save their choices. They then select that format from the export menu to export the report.

> note By default, the Telerik Reporting REST service hides PDF settings in the **Security** group and the **JavaScript** setting(PDF rendering). To change the default policy, refer to [Customizing Export Options in Telerik Reporting Web Viewers](slug:customize-export-options).

## When the Command Appears

The **Export Options** command appears only when both conditions are met:

- The `exportDialog.enabled` setting is `true`.
- At least one available rendering extension provides configurable settings.

The setting defaults to `true`. Set it to `false` to hide the command. Disabling the dialog does not disable direct exports from the export menu.

## Configure the Setting

Use the `exportDialog` object for JavaScript-based viewers:

```JavaScript
exportDialog: {
    enabled: true
}
```

The configuration surface depends on the viewer integration:

| Viewer                                           | Configuration                                                                    |
| ------------------------------------------------ | -------------------------------------------------------------------------------- |
| HTML5/jQuery, Angular wrapper, and React wrapper | Set `exportDialog.enabled` in the viewer options or component properties.        |
| ASP.NET MVC wrapper                              | Call `.ExportDialog(new ExportDialog { Enabled = true })` on the viewer builder. |
| ASP.NET Web Forms wrapper                        | Set `Enabled` on the viewer's `ExportDialog` property.                           |
| Blazor wrapper and Native Blazor viewer          | Set `Enabled` on the `ExportDialogOptions` object passed to the viewer.          |
| Native Angular viewer                            | Bind an object with an `enabled` property to the `exportDialog` input.           |

For complete setup examples, see the viewer-specific guides:

- [Configure Export Options in the HTML5 Report Viewer](slug:html5-report-viewer-export-options-dialog)
- [Configure Export Options in the Native Angular Report Viewer](slug:native-angular-report-viewer-export-options-dialog)
- [Configure Export Options in the Native Blazor Report Viewer](slug:native-blazor-report-viewer-export-options-dialog)

## Next Steps

- [Customize Export Options settings on the Reporting REST Service](slug:customize-export-options)
- [Configure Export Options in the HTML5 Report Viewer](slug:html5-report-viewer-export-options-dialog)
- [Configure Export Options in the Native Angular Report Viewer](slug:native-angular-report-viewer-export-options-dialog)
- [Configure Export Options in the Native Blazor Report Viewer](slug:native-blazor-report-viewer-export-options-dialog)

## See Also

- [HTML5 Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
- [Angular Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview)
- [React Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview)
- [Blazor Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview)
- [Native Angular Report Viewer Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview)
- [Native Blazor Report Viewer Overview](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview)
