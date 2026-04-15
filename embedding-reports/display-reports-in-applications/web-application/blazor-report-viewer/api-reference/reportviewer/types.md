---
title: Types
page_title: Types of the Blazor Report Viewer
description: Object types and interfaces used by the Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types
tags: types
published: True
reportingArea: BlazorWrapper
position: 6
---

# Types of the Blazor Report Viewer

## AccessibilityKeyMap

Provides a class for the key mapping used when report viewer accessibility is enabled.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CONFIRM_KEY | `System.Byte` | Gets or sets the key code for executing report actions and applying report parameters. |
| CONTENT_AREA_KEY | `System.Byte` | Gets or sets the key code for navigating to report contents area, when pressed together with CTRL + ALT. |
| DOCUMENT_MAP_AREA_KEY | `System.Byte` | Gets or sets the key code for navigating to document map area, when pressed together with CTRL + ALT. |
| Default | [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap) | Gets an instance initialized with the default key mapping. |
| MENU_AREA_KEY | `System.Byte` | Gets or sets the key code for navigating to menu area, when pressed together with CTRL + ALT. |
| PARAMETERS_AREA_KEY | `System.Byte` | Gets or sets the key code for navigating to parameters area, when pressed together with CTRL + ALT. |


## ClientEventsOptions

Specifies the viewer's event options. Each option can be assigned an event handler name. The JavaScript API of the event handlers is available in  https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-ready.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Error | `System.String` | Gets or sets the viewer's error event handler function name.<br>Called when an error is thrown in the report viewer. |
| ExportBegin | `System.String` | Gets or sets the viewer's exportBegin event handler function name.<br>Occurs before exporting the report. |
| ExportEnd | `System.String` | Gets or sets the viewer's exportEnd event handler function name.<br>Occurs after exporting the report. |
| InteractiveActionEnter | `System.String` | Gets or sets the viewer's interactiveActionEnter event handler function name.<br>Occurs when the mouse cursor enters the area of an interactive action. |
| InteractiveActionExecuting | `System.String` | Gets or sets the viewer's interactiveActionExecuting event handler function name.<br>Occurs before an interactive action is executed, providing the ability to cancel the execution. |
| InteractiveActionLeave | `System.String` | Gets or sets the viewer's interactiveActionLeave event handler function name.<br>Occurs when the mouse cursor leaves the area of an interactive action. |
| PageReady | `System.String` | Gets or sets the viewer's pageReady event handler function name.<br>Occurs after a page of the report is ready. |
| PrintBegin | `System.String` | Gets or sets the viewer's printBegin event handler function name.<br>Occurs before printing the report. |
| PrintEnd | `System.String` | Gets or sets the viewer's printEnd event handler function name.<br>Occurs after printing the report. |
| Ready | `System.String` | Gets or sets the viewer's ready event handler function name.<br>Called when the viewer content has been loaded from the template and is ready to display reports or perform any other <br>operations on it. The function is executed in the context of the ReportViewer object that is available through the this object. |
| RenderingBegin | `System.String` | Gets or sets the viewer's renderingBegin event handler function name.<br>Occurs before rendering the report. |
| RenderingEnd | `System.String` | Gets or sets the viewer's renderingEnd event handler function name.<br>Occurs after rendering the report. |
| SendEmailBegin | `System.String` | Gets or sets the viewer's sendEmailBegin event handler function name.<br>Occurs before the report is exported and the e-mail message is sent. |
| SendEmailEnd | `System.String` | Gets or sets the viewer's sendEmailEnd event handler function name.<br>Occurs after the report is exported and before the e-mail message is sent. |
| UpdateUi | `System.String` | Gets or sets the viewer's updateUi event handler function name.<br>Occurs when the UI state of the viewer changes. |
| ViewerToolTipOpening | `System.String` | Gets or sets the viewer's viewerToolTipOpening event handler function name.<br>The event occurs before a tooltip is opened, providing the ability to cancel its opening. |


## Command

Specifies a report viewer command.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ExecuteAsync | `System.Threading.Tasks.ValueTask` | Executes the command. |


## CommandBase

Specifies a report viewer command.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| GetCheckedStatusAsync | `System.Threading.Tasks.ValueTask{System.Boolean}` | Returns a bool value which indicates the checked state of the UI associated with the command. |
| GetEnabledStatusAsync | `System.Threading.Tasks.ValueTask{System.Boolean}` | Returns a bool value which indicates the enabled state of the UI associated with the command. |


## CommandOptions

Exposes the available report viewer commands.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Export | [`Telerik.ReportViewer.Blazor.ExportCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#exportcommand) | Gets the Export command. Execute to export the report in the respective format. |
| GoToFirstPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the GoToFirstPage command. Execute to go to the first page of the report. |
| GoToLastPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the GoToLastPage command. Execute to go to the last page of the report. |
| GoToNextPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the GoToNextPage command. Execute to go to the next page of the report. |
| GoToPage | [`Telerik.ReportViewer.Blazor.GoToPageCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#gotopagecommand) | Gets the GoToPage command. Execute to go to a specific page of the report. |
| GoToPrevPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the GoToPrevPage command. Execute to go to the previous page of the report. |
| HistoryBack | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the HistoryBack command. Execute to go back to the previously rendered report from history. |
| HistoryForward | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the HistoryForward command. Execute to go forward to the previously rendered report from history. |
| Print | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the Print command. Execute to print the report. |
| Refresh | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the Refresh command. Execute to refresh the report. |
| ToggleDocumentMap | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleDocumentMap command. Execute to show or hide the document map. |
| ToggleParametersArea | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleParametersArea command. Execute to show or hide the parameters area. |
| TogglePrintPreview | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the TogglePrintPreview command. Execute to toggle between Print Preview and Interactive view modes. |
| ToggleSearchDialog | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleSearchDialog command. Execute to show or hide the search dialog. |
| ToggleSideMenu | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleSideMenu command. Execute to show or hide the side menu. |
| ToggleZoomMode | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleZoomMode command. Execute to change the zoom mode of the report. |
| Zoom | [`Telerik.ReportViewer.Blazor.ZoomCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#zoomcommand) | Gets the Zoom command. Execute to zoom the report with a specified ratio. |
| ZoomIn | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ZoomIn command. Execute to zoom the report in. |
| ZoomOut | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ZoomOut command. Execute to zoom the report out. |


## EditorsOptions

Specifies the settings for the different types of configurable report parameter editors.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| MultiSelect | [`Telerik.ReportViewer.Blazor.EditorType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#editortype) | Gets or sets the editor type for report parameters with available values and multivalue set to true. |
| SingleSelect | [`Telerik.ReportViewer.Blazor.EditorType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#editortype) | Gets or sets the editor type for report parameters with available values and multivalue set to false. |


## ExportCommand

Specifies a report viewer command.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ExecuteAsync(System.String) | `System.Threading.Tasks.ValueTask` | Executes the command. |


## GoToPageCommand

Specifies a report viewer command.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ExecuteAsync(System.Int32) | `System.Threading.Tasks.ValueTask` | Executes the command. |


## ParameterEditor

Specifies the parameter editor functions.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CreateEditor | `System.String` | Gets or sets the createEditor function name that creates the parameter editor UI and wires it to the<br>parameterChanged callback when a new value is selected. The return result is a new object containing<br>the beginEdit method which is the entry point for creating the editor from the viewer. |
| Match | `System.String` | Gets or sets the match function name that accepts a report parameter to be edited as an argument<br>and returns a boolean value that indicates whether the parameter editor is suitable for this parameter. |


## ParametersOptions

Specifies the options for the two parameter editors types - `Telerik.ReportViewer.Blazor.EditorsOptions.SingleSelect` and `Telerik.ReportViewer.Blazor.EditorsOptions.MultiSelect`.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Editors | [`Telerik.ReportViewer.Blazor.EditorsOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#editorsoptions) | Gets or sets the [`Telerik.ReportViewer.Blazor.EditorType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#editortype) to be used for the different types of report parameters. |


## ReportServerOptions

Specifies the configuration details for connecting to a Telerik Report Server instance. Report Server for .NET supports Token (GetPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (Url only, if enabled).

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| GetPersonalAccessToken | `System.String` | Gets or sets the callback function name that returns the Token for authentication wrapped in a Promise(Only RS.NET).<br>Report Server for .NET only. Recommended authentication method.<br>The token can be from any user, including the Guest user.<br>Optional. |
| Password | `System.String` | Gets or sets the password for the provided username.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2.<br>Optional. |
| Url | `System.String` | Gets or sets the URL to the Report Server instance.<br>Required for both Report Server for .NET and Report Server for .NET Framework 4.6.2. |
| Username | `System.String` | Gets or sets a registered username in the Report Server.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used.<br>Optional. |


## ReportSourceOptions

Specifies the report and initial report parameter values to be displayed in the report viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Parameters | `System.Collections.Generic.IDictionary{System.String,System.Object}` | Gets or sets an object with properties name/value equal to the report parameters names and values used in the report definition. |
| Report | `System.String` | Gets or sets a string that uniquely identifies a report from the Reporting REST service or the Telerik Report Server.<br>On the server side this string will be converted to a ReportSource through an IReportResolver. |


## SendEmailOptions

Specifies the send email option settings.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Body | `System.String` | Gets or sets the MailMessage Content value. |
| CC | `System.String` | Gets or sets the e-mail address used for the MailMessage Carbon Copy value. |
| Enabled | `System.Boolean` | Gets or sets a value indicating whether the Send Mail Message toolbar button is visible. Default value is false. |
| Format | `System.String` | Gets or sets the format of the attached report document. |
| From | `System.String` | Gets or sets the e-mail address used for the MailMessage FROM value. |
| Subject | `System.String` | Gets or sets the MailMessage Subject value. |
| To | `System.String` | Gets or sets the e-mail address used for the MailMessage TO value. |


## ZoomCommand

Specifies a report viewer command.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ExecuteAsync(System.Double) | `System.Threading.Tasks.ValueTask` | Executes the command. |

