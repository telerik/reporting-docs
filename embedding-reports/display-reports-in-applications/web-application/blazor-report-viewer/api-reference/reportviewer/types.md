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

### Constructors

| Constructor | Description |
| ------ | ------ |
| AccessibilityKeyMap() | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CONFIRM_KEY | `byte` | Gets or sets the key code for executing report actions and applying report parameters. |
| CONTENT_AREA_KEY | `byte` | Gets or sets the key code for navigating to the report contents area when pressed together with CTRL + ALT. |
| DOCUMENT_MAP_AREA_KEY | `byte` | Gets or sets the key code for navigating to the document map area when pressed together with CTRL + ALT. |
| Default | [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap) | Gets an instance initialized with the default key mapping. |
| Equals(System.Object) | `bool` | Determines whether the specified object is equal to the current [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap) instance. |
| GetHashCode | `int` | Serves as the default hash function for the [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap) instance. |
| MENU_AREA_KEY | `byte` | Gets or sets the key code for navigating to the menu area when pressed together with CTRL + ALT. |
| PARAMETERS_AREA_KEY | `byte` | Gets or sets the key code for navigating to the parameters area when pressed together with CTRL + ALT. |


## ClientEventsOptions

Specifies the viewer's event options. Each option can be assigned a JavaScript event handler function name.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ClientEventsOptions() | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.ClientEventsOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#clienteventsoptions) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Error | `string` | Gets or sets the viewer's error event handler function name.<br>Called when an error is thrown in the report viewer. |
| ExportBegin | `string` | Gets or sets the viewer's exportBegin event handler function name.<br>Occurs before exporting the report. |
| ExportEnd | `string` | Gets or sets the viewer's exportEnd event handler function name.<br>Occurs after exporting the report. |
| InteractiveActionEnter | `string` | Gets or sets the viewer's interactiveActionEnter event handler function name.<br>Occurs when the mouse cursor enters the area of an interactive action. |
| InteractiveActionExecuting | `string` | Gets or sets the viewer's interactiveActionExecuting event handler function name.<br>Occurs before an interactive action is executed, providing the ability to cancel the execution. |
| InteractiveActionLeave | `string` | Gets or sets the viewer's interactiveActionLeave event handler function name.<br>Occurs when the mouse cursor leaves the area of an interactive action. |
| PageReady | `string` | Gets or sets the viewer's pageReady event handler function name.<br>Occurs after a page of the report is ready. |
| PrintBegin | `string` | Gets or sets the viewer's printBegin event handler function name.<br>Occurs before printing the report. |
| PrintEnd | `string` | Gets or sets the viewer's printEnd event handler function name.<br>Occurs after printing the report. |
| Ready | `string` | Gets or sets the viewer's ready event handler function name.<br>Called when the viewer content has been loaded from the template and is ready to display reports or perform any other <br>operations. The function is executed in the context of the ReportViewer object that is available through the 'this' reference. |
| RenderingBegin | `string` | Gets or sets the viewer's renderingBegin event handler function name.<br>Occurs before rendering the report. |
| RenderingEnd | `string` | Gets or sets the viewer's renderingEnd event handler function name.<br>Occurs after rendering the report. |
| SendEmailBegin | `string` | Gets or sets the viewer's sendEmailBegin event handler function name.<br>Occurs before the report is exported and the email message is sent. |
| SendEmailEnd | `string` | Gets or sets the viewer's sendEmailEnd event handler function name.<br>Occurs after the report is exported and the email message is sent. |
| UpdateUi | `string` | Gets or sets the viewer's updateUi event handler function name.<br>Occurs when the UI state of the viewer changes. |
| ViewerToolTipOpening | `string` | Gets or sets the viewer's viewerToolTipOpening event handler function name.<br>Occurs before a tooltip is opened, providing the ability to cancel its opening. |


## Command

Specifies a report viewer command.

### Constructors

| Constructor | Description |
| ------ | ------ |
| Command(Microsoft.AspNetCore.Components.ElementReference,Microsoft.JSInterop.IJSRuntime,string) | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) class with the specified viewer element, JavaScript runtime, and command name. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ExecuteAsync | `System.Threading.Tasks.ValueTask` | Executes the command. |


## CommandBase

Provides the base class for report viewer commands.

### Constructors

| Constructor | Description |
| ------ | ------ |
| CommandBase(Microsoft.AspNetCore.Components.ElementReference,Microsoft.JSInterop.IJSRuntime,string) | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.CommandBase`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#commandbase) class with the specified viewer element, JavaScript runtime, and command name. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| GetCheckedStatusAsync | `System.Threading.Tasks.ValueTask<bool>` | Gets a value indicating the checked state of the UI associated with the command. |
| GetEnabledStatusAsync | `System.Threading.Tasks.ValueTask<bool>` | Gets a value indicating the enabled state of the UI associated with the command. |
| JSRuntime | `Microsoft.JSInterop.IJSRuntime` | The JavaScript runtime instance for interop operations. |
| Name | `string` | The name of the command. |
| ViewerElement | `Microsoft.AspNetCore.Components.ElementReference` | The reference to the report viewer element. |


## CommandOptions

Exposes the available report viewer commands.

### Constructors

| Constructor | Description |
| ------ | ------ |
| CommandOptions(Microsoft.AspNetCore.Components.ElementReference,Microsoft.JSInterop.IJSRuntime) | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.CommandOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#commandoptions) class with the specified viewer element and JavaScript runtime. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Export | [`Telerik.ReportViewer.Blazor.ExportCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#exportcommand) | Gets the Export command. Execute to export the report in the specified format. |
| GoToFirstPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the GoToFirstPage command. Execute to navigate to the first page of the report. |
| GoToLastPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the GoToLastPage command. Execute to navigate to the last page of the report. |
| GoToNextPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the GoToNextPage command. Execute to navigate to the next page of the report. |
| GoToPage | [`Telerik.ReportViewer.Blazor.GoToPageCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#gotopagecommand) | Gets the GoToPage command. Execute to navigate to a specific page of the report. |
| GoToPrevPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the GoToPrevPage command. Execute to navigate to the previous page of the report. |
| HistoryBack | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the HistoryBack command. Execute to navigate back to the previously rendered report from history. |
| HistoryForward | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the HistoryForward command. Execute to navigate forward to the next report from history. |
| Print | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the Print command. Execute to print the report. |
| Refresh | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the Refresh command. Execute to refresh the report. |
| ToggleAiPromptDialog | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleAiPromptDialog command. Execute to show or hide the AI prompt dialog. |
| ToggleDocumentMap | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleDocumentMap command. Execute to show or hide the document map. |
| ToggleParametersArea | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleParametersArea command. Execute to show or hide the parameters area. |
| TogglePrintPreview | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the TogglePrintPreview command. Execute to toggle between Print Preview and Interactive view modes. |
| ToggleSearchDialog | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleSearchDialog command. Execute to show or hide the search dialog. |
| ToggleSendEmailDialog | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleSendEmailDialog command. Execute to show or hide the send email dialog. |
| ToggleZoomMode | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ToggleZoomMode command. Execute to change the zoom mode of the report. |
| Zoom | [`Telerik.ReportViewer.Blazor.ZoomCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#zoomcommand) | Gets the Zoom command. Execute to zoom the report to a specified ratio. |
| ZoomIn | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ZoomIn command. Execute to zoom in the report. |
| ZoomOut | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#command) | Gets the ZoomOut command. Execute to zoom out the report. |


## EditorsOptions

Specifies the settings for the different types of configurable report parameter editors.

### Constructors

| Constructor | Description |
| ------ | ------ |
| EditorsOptions() | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.EditorsOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#editorsoptions) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| MultiSelect | [`Telerik.ReportViewer.Blazor.EditorType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#editortype) | Gets or sets the editor type for report parameters with available values and multivalue set to true. |
| SingleSelect | [`Telerik.ReportViewer.Blazor.EditorType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#editortype) | Gets or sets the editor type for report parameters with available values and multivalue set to false. |
| ToJsonObject | `object` | Converts the current [`Telerik.ReportViewer.Blazor.EditorsOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#editorsoptions) instance to a JSON-serializable anonymous object. |


## ExportCommand

Represents a report viewer command for exporting reports to a specific format.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ExportCommand(Microsoft.AspNetCore.Components.ElementReference,Microsoft.JSInterop.IJSRuntime,string) | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.ExportCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#exportcommand) class with the specified viewer element, JavaScript runtime, and command name. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ExecuteAsync(System.String) | `System.Threading.Tasks.ValueTask` | Executes the export command with the specified rendering format. |


## GoToPageCommand

Represents a report viewer command for navigating to a specific page in the report.

### Constructors

| Constructor | Description |
| ------ | ------ |
| GoToPageCommand(Microsoft.AspNetCore.Components.ElementReference,Microsoft.JSInterop.IJSRuntime,string) | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.GoToPageCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#gotopagecommand) class with the specified viewer element, JavaScript runtime, and command name. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ExecuteAsync(System.Int32) | `System.Threading.Tasks.ValueTask` | Executes the command to navigate to the specified page number. |


## ParameterEditor

Specifies the parameter editor functions for custom report parameter editors.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ParameterEditor() | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.ParameterEditor`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#parametereditor) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CreateEditor | `string` | Gets or sets the createEditor function name that creates the parameter editor UI and wires it to the<br>parameterChanged callback when a new value is selected. The return result is a new object containing<br>the beginEdit method, which is the entry point for creating the editor from the viewer. |
| Match | `string` | Gets or sets the match function name that accepts a report parameter to be edited as an argument<br>and returns a boolean value that indicates whether the parameter editor is suitable for this parameter. |
| ToJsonObject | `object` | Converts the current [`Telerik.ReportViewer.Blazor.ParameterEditor`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#parametereditor) instance to a JSON-serializable anonymous object. |


## ParametersOptions

Specifies the options for the two parameter editor types - `Telerik.ReportViewer.Blazor.EditorsOptions.SingleSelect` and `Telerik.ReportViewer.Blazor.EditorsOptions.MultiSelect`.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ParametersOptions() | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.ParametersOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#parametersoptions) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Editors | [`Telerik.ReportViewer.Blazor.EditorsOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#editorsoptions) | Gets or sets the [`Telerik.ReportViewer.Blazor.EditorType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#editortype) to be used for the different types of report parameters. |
| ToJsonObject | `object` | Converts the current [`Telerik.ReportViewer.Blazor.ParametersOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#parametersoptions) instance to a JSON-serializable anonymous object. |


## ReportServerOptions

Specifies the configuration details for connecting to a Telerik Report Server instance. Report Server for .NET supports Token (GetPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (Url only, if enabled).

### Constructors

| Constructor | Description |
| ------ | ------ |
| ReportServerOptions() | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.ReportServerOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportserveroptions) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| GetPersonalAccessToken | `string` | Gets or sets the callback function name that returns the token for authentication wrapped in a Promise (Report Server for .NET only).<br>Report Server for .NET only. Recommended authentication method.<br>The token can be from any user, including the Guest user.<br>Optional. |
| Password | `string` | Gets or sets the password for the provided username.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2.<br>Optional. |
| ToJsonObject | `object` | Converts the current [`Telerik.ReportViewer.Blazor.ReportServerOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportserveroptions) instance to a JSON-serializable anonymous object. |
| Url | `string` | Gets or sets the URL to the Report Server instance.<br>Required for both Report Server for .NET and Report Server for .NET Framework 4.6.2. |
| Username | `string` | Gets or sets a registered username in the Report Server.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used.<br>Optional. |


## ReportSourceOptions

Specifies the report and initial report parameter values to be displayed in the report viewer.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ReportSourceOptions() | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) class. |
| ReportSourceOptions(string) | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) class with the specified report document. |
| ReportSourceOptions(string,System.Collections.Generic.IDictionary<string,object>) | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) class with the specified report document and parameters. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Parameters | `System.Collections.Generic.IDictionary<string,object>` | Gets or sets a dictionary of report parameter names and values used in the report definition. |
| Report | `string` | Gets or sets a string that uniquely identifies a report from the Reporting REST service or the Telerik Report Server.<br>On the server side, this string will be converted to a ReportSource through an IReportResolver. |
| ToJsonObject | `object` | Converts the current [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) instance to a JSON-serializable anonymous object. |


## SendEmailOptions

Specifies the send email option settings.

### Constructors

| Constructor | Description |
| ------ | ------ |
| SendEmailOptions() | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.SendEmailOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#sendemailoptions) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Body | `string` | Gets or sets the MailMessage Content value. |
| CC | `string` | Gets or sets the email address used for the MailMessage Carbon Copy value. |
| Enabled | `bool` | Gets or sets a value indicating whether the Send Mail Message toolbar button is visible. Default value is false. |
| Format | `string` | Gets or sets the format of the attached report document. |
| From | `string` | Gets or sets the email address used for the MailMessage FROM value. |
| Subject | `string` | Gets or sets the MailMessage Subject value. |
| To | `string` | Gets or sets the email address used for the MailMessage TO value. |
| ToJsonObject | `object` | Converts the current [`Telerik.ReportViewer.Blazor.SendEmailOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#sendemailoptions) instance to a JSON-serializable anonymous object. |


## ZoomCommand

Represents a report viewer command for zooming the report to a specific ratio.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ZoomCommand(Microsoft.AspNetCore.Components.ElementReference,Microsoft.JSInterop.IJSRuntime,string) | Initializes a new instance of the [`Telerik.ReportViewer.Blazor.ZoomCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#zoomcommand) class with the specified viewer element, JavaScript runtime, and command name. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ExecuteAsync(System.Double) | `System.Threading.Tasks.ValueTask` | Executes the command to zoom the report to the specified ratio. |

