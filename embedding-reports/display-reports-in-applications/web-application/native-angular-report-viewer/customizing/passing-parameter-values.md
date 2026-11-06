---
title: Passing Values to Report Parameters
page_title: Passing values to Report Parameters in the Native Angular Report Viewer
description: "Learn how to pass/update the values of the Report Parameters or load a new report in the Native Angular Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/customizing/passing-parameter-values
tags: how,to,pass,values,to,report,parameters,in,native,angular,report,viewer
published: True
reportingArea: NativeAngular
components: [nativeangular, general]
position: 0
previous_url: /embedding-reports/display-reports-in-applications/web-application/native-angular-report-viewer/customizing/
---

# Updating the Report Parameters of the Native Angular Report Viewer

This topic explains how to update the report parameters with values passed from a custom UI outside the report viewer instead of using the report viewer's built-in parameters area.

The report identifier and all required parameter values for it are packed in a `reportSource` object. To update the report source, the `setReportSource` command can be used.

## Using an External Parameter Selector

Use a selector outside the Native Angular Report Viewer when the built-in parameter editors do not meet your application's presentation needs. For example, the built-in ComboBox for single-value parameters and MultiSelect for multi-value parameters do not provide a multi-column dropdown configuration. Enabling `MultiValue` allows multiple selections. It does not add display columns.

The Native Angular Report Viewer does not expose the HTML5 viewer's `parameterEditors` API for replacing editors inside its parameters area. See the [Native Angular Report Viewer customization limitations](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview#missing-features).

For a multi-column selector, supply your application control with the required display fields and pass the selected parameter value through the `setReportSource` command. The standard parameter available values contain only `name` and `value`, so they do not supply additional fields for display columns. The following example demonstrates the external-control pattern with a standard HTML `select`. It does not implement a multi-column selector.

## Example of using the setReportSource command

The following example will demonstrate how a [select](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select) control outside of the [Native Angular Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview) can have its `selected` value passed to the report viewer's `reportSource`:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerCustomizing.html region=NativeAngularViewerPassingParameters}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\CustomizeNativeAngularViewer.ts region=CustomizeNativeAngularViewer_PassingParameterValues}}

## See Also

- [How to Use the Native Angular Report Viewer with Reporting Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-reporting-service)
- [How to Use the Native Angular Report Viewer with Report Server](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-report-server)
- [Native Angular Report Viewer Requirements](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements)
- [Native Angular Report Viewer Options](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options)
- [Native Angular Report Viewer Commands](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/methods)
- [Native Angular Report Viewer Events](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events)
