---
title: Telerik.ReportViewer.BlazorNative.SendEmailDialogSettings
page_title: Telerik.ReportViewer.BlazorNative.SendEmailDialogSettings Type
description: "Represents the settings for the Send Email dialog in the Telerik Reporting Native Blazor Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/sendemaildialogsettings
published: True
reportingArea: NativeBlazor
---

# The `SendEmailDialogSettings` type of the Native Blazor Report Viewer

Represents the settings for the Send Email dialog in the Telerik Reporting Native Blazor Report Viewer.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Body | `System.String` | Sentences used for the MailMessage Content value. |
| Cc | `System.String` | E-mail address used for the MailMessage Carbon Copy value. |
| Format | `System.String` | The preselected report document format. |
| From | `System.String` | E-mail address used for the MailMessage FROM value. |
| Subject | `System.String` | A string used for the MailMessage Subject value. |
| To | `System.String` | E-mail address used for the MailMessage TO value. |

## Example

````C#
<ReportViewer>
    <ReportViewerSettings>
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

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
