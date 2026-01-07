---
title: ReportViewerSettings
page_title: ReportViewerSettings property
description: "Defines a renderfragment that contains all settings for the Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/reportviewersettings
published: True
reportingArea: NativeBlazor
---

# The `ReportViewerSettings` option of the Native Blazor Report Viewer

Defines a renderfragment that contains all settings for the Report Viewer.

## Type

`Microsoft.AspNetCore.Components.RenderFragment`

## Examples

````C#
<ReportViewer>
    <ReportViewerSettings>
        <ReportServerSettings
            Url="https://report-server:83"
            Username="user"
            Password="pass">
        </ReportServerSettings>
        <SendEmailDialogSettings
            From="from@mail.com"
            To="to@mail.com"
            Cc="cc@mail.com"
            Subject="Report"
            Body="Please find the attached report."
            Format="PDF">
        </SendEmailDialogSettings>
    </ReportViewerSettings>
</ReportViewer>
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/overview%})
* [Scale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/scale%})
* [ScaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/scalemode%})

