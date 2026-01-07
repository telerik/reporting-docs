---
title: Telerik.ReportViewer.BlazorNative.ReportServerSettings
page_title: Telerik.ReportViewer.BlazorNative.ReportServerSettings Type
description: "Specifies the configuration details for connecting to a Telerik Report Server instance. Report Server for .NET supports Token (GetPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (Url only, if enabled)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportserversettings
published: True
reportingArea: NativeBlazor
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ReportServerSettings` type of the Native Blazor Report Viewer

Specifies the configuration details for connecting to a Telerik Report Server instance. Report Server for .NET supports Token (GetPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (Url only, if enabled).

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| GetPersonalAccessToken | `System.Func{System.Threading.Tasks.Task{System.String}}` | Defines the Personal Access Token callback which retrieves the token for authenticating with the report server.<br>Report Server for .NET only. Recommended authentication method.<br>The token can be from any user, including the Guest user.<br>Optional. |
| Password | `System.String` | Defines the Password to be used for authenticating with the report server.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2.<br>Optional. |
| Url | `System.String` | Defines the Url of the report server.<br>ReportServerSettings.Url takes precedence over the viewer's ServiceUrl property.<br>Required for both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>ReportServerSettings.Url takes precedence over the viewer's ServiceUrl property. |
| Username | `System.String` | Defines the Username to be used for authenticating with the report server.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used.<br>Optional. |

## Example

````C#
@* Report Server for .NET - Token authentication (recommended) *@
<ReportViewer>
    <ReportViewerSettings>
        <ReportServerSettings Url="https://yourReportServerUrl:port" GetPersonalAccessToken="@GetPersonalAccessToken">
        </ReportServerSettings>
    </ReportViewerSettings>
</ReportViewer>

@code {
    public async Task<string> GetPersonalAccessToken()
    {
        return "<personal-access-token>";
    }
}

@* Report Server Username/password authentication (both servers) *@
<ReportViewer>
    <ReportViewerSettings>
        <ReportServerSettings
            Url="https://yourReportServerUrl:port"
            Username="myUsername"
            Password="myPassword">
        </ReportServerSettings>
    </ReportViewerSettings>
</ReportViewer>

@* Report Server for .NET Framework 4.6.2 - Guest account (requires Guest enabled on server) *@
<ReportViewer>
    <ReportViewerSettings>
        <ReportServerSettings Url="https://demos.telerik.com/report-server/">
        </ReportServerSettings>
    </ReportViewerSettings>
</ReportViewer>
````

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/overview%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/commands/executecommand%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/commands/executecommand%})
* [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/getreportparameters%})

