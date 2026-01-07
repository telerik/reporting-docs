---
title: Overview
page_title: Types of the HTML5 Report Viewer
description: Object types and interfaces used by the HTML5 Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/overview
tags: overview,types
published: True
reportingArea: HTML5
position: 0
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# Types of the HTML5 Report Viewer

| Type | Description |
| ------ | ------ |
| [DataAttributeSet]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/dataattributeset%})|Describes the available data attributes that can be used to control<br>the Report Viewer from HTML elements. They are executed by adding data-command and<br>data-target-report-viewer attributes to HTML elements.|
| [InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/interactiveaction%})|Describes an interactive action triggered by the user in the report viewer.<br>The shape of the `Value` property depends on the action `Type`.|
| [ParameterEditor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/parametereditor%})|Describes a parameter editor for the Telerik Report Viewer parameter panel.|
| [ParameterEditorInstance]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/parametereditorinstance%})|Represents the API of a parameter editor instance returned by createEditor.|
| [ParametersOptions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/parametersoptions%})|Configuration options for report parameter editors and behavior.|
| [ReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/reportparameters%})|An object where each property name corresponds to a report parameter's name,<br>and the value is the value assigned to that parameter as used in the report definition.|
| [ReportServer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/reportserver%})|Configuration for connecting to a Telerik Report Server instance.<br>Required if serviceUrl is not provided.<br><br>Authentication options:<br>- Report Server for .NET: Supports Token authentication (getPersonalAccessToken) or username/password authentication. The token can be from any user, including the Guest user.<br>- Report Server for .NET Framework 4.6.2: Supports username/password authentication or Guest account (url only, if Guest is enabled on the server).|
| [ReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/reportsource%})|Defines the report source for the viewer, specifying which report to load and any parameters to pass to it.|
| [ReportViewerCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/reportviewercommand%})|Represents a command that can be executed on the report viewer.<br>Each command is an object with the following methods:<br>- exec(): Executes the command (optionally with parameters).<br>- enabled(): Returns a boolean indicating if the command is currently enabled.<br>- checked(): Returns a boolean indicating if the command is in a checked state (for toggle commands).|
| [SendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/sendemail%})|Configuration options for the Send Email feature in the Report Viewer. Allows customization of the email dialog, default values, and available document formats when sending a report via email.|
