---
title: Types
page_title: Types of the Native Blazor Report Viewer
description: Object types and interfaces used by the Native Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types
tags: types
published: True
reportingArea: NativeBlazor
position: 6
---

# Types of the Native Blazor Report Viewer

## BooleanReportParameter

Represents a boolean parameter editor for the Telerik Reporting Native Blazor Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| SelectedValue | `System.Nullable{System.Boolean}` | Gets or sets the selected value of the Boolean report parameter. |


## ButtonTool

Represents the built-in buttons from the report viewer's toolbar. Allows users to interact with reports through buttons in the toolbar.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CommandName | `System.String` | Gets or sets the command name associated with the ButtonTool. |
| Icon | `Telerik.SvgIcons.ISvgIcon` | Gets or sets the icon for the ButtonTool. |


## DateTimeReportParameter

Represents a DateTime parameter editor for the Telerik Reporting Native Blazor Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| SelectedValue | `System.Nullable{System.DateTime}` | Gets or sets the selected value for the DateTime report parameter. |


## DeviceInfo

Represents the device information settings sent to the server by the viewer when the report rendering is initiated (the RenderingBegin and ExportStart events).

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| BasePath | `System.String` | Gets the base path. |
| ContentOnly | `System.Boolean` | A flag specifying whether the rendered document will be stripped down HTML without HTML, HEAD, Script and Body elements.<br>All of the HTML content will be placed in a div element.<br>The actions meta data and the page style will be served as resources.<br>The default value is false. |
| ContentTabIndex | `System.Int32` | Gets or sets the content tab index for the Blazor Report Viewer.<br>This property is used to specify the tab order of the report viewer's content, <br>allowing for better accessibility and navigation through keyboard input. |
| EnableAccessibility | `System.Boolean` | Gets or sets a value indicating whether accessibility features are enabled. |
| EnableSearch | `System.Boolean` | Enables or disables the search functionality. |
| ImmediatePrint | `System.Boolean` | Represents the device information related to immediate printing capabilities. |
| UseSVG | `System.Boolean` | A flag specifying whether to render Map and Graph items as SVG or Bitmap images.<br>The default value is true. |


## DocumentInfo

Represents comprehensive information about a report document's state during rendering and when the rendering ends. The information in this object is used internally by the report viewer to manage how reports are displayed and interacted with.


## DoubleReportParameter

Represents a parameter editor for double report parameters in the Telerik Reporting Native Blazor Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| SelectedValue | `System.Nullable{System.Double}` | Gets or sets the currently selected value for the DoubleReportParameter. |


## DropDownButtonTool

Represents the built-in drop-down buttons from the report viewer's toolbar. This tool allows users to select options from a list, enhancing the interactivity of the report viewer.


## Export

Exports the report viewer content to a specified format.


## ExportEndEventArgs

Provides data for the ExportEnd event in the Telerik Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Format | `System.String` | Gets or sets the format of the exported report. |
| Handled | `System.Boolean` | Gets or sets a value indicating whether the export process should be handled manually. |
| Url | `System.String` | Represents the URL of the exported report in the ExportEnd event of the Telerik Report Viewer. |
| WindowOpenTarget | `System.String` | Represents the target for opening the export window in the Telerik Report Viewer. |


## ExportStartEventArgs

Represents the event arguments for the ExportStart event in the Telerik ReportViewer component.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| DeviceInfo | [`Telerik.ReportViewer.BlazorNative.DeviceInfo`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types%}#deviceinfo) | Represents device information settings used during the report export process. |
| Format | `System.String` | Gets or sets the format the report should be exported to. |
| IsCancelled | `System.Boolean` | Gets or sets a value indicating whether the export operation has been canceled. |


## FirstPage

Navigates to the first page of the report viewer.


## LastPage

Navigates to the last page of the report being viewed in the Telerik Report Viewer.


## LongReportParameter

Represents a long report parameter in the Telerik Reporting Native Blazor Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| SelectedValue | `System.Nullable{System.Int64}` | Gets or sets the selected value of the LongReportParameter. |


## MultiSelectReportParameter

Represents a multi-select report parameter in the Telerik Reporting Native Blazor Report Viewer. This parameter allows users to select multiple values from a predefined list.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| SelectedValue | `System.Collections.Generic.List{System.Object}` | Gets or sets the selected values for the MultiSelectReportParameter. |


## NavigateBackward

Navigates backward in the report viewer's navigation history.


## NavigateForward

Navigates forward in the report viewer's navigation history.


## NextPage

Navigates to the next page in the report viewer.


## PageNumber

Allows navigating to a specific page in the report by typing it into a numeric textbox.


## PreviousPage

Navigates to the previous page in the report viewer.


## Print

Prints the current report displayed in the viewer.


## Refresh

Refreshes the report viewer, reloading the current report and updating the displayed content.


## RenderingBeginEventArgs

Represents the event arguments for the RenderingBegin event in the Telerik Report Viewer.


## RenderingEndEventArgs

Provides data for the RenderingEnd event in the Telerik Report Viewer.


## ReportParameterBase

Represents the base class for all report parameter editors in the Telerik Reporting Blazor Native Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| OnChange | `System.Func{System.Object,System.Threading.Tasks.Task}` | Function that is invoked when the value of the report parameter changes. |
| Parameter | [`Telerik.ReportViewer.BlazorNative.ReportParameterInfo`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types%}#reportparameterinfo) | Represents a parameter in a report, providing functionality to manage its properties and values. |


## ReportParameterContext

Represents the context for report parameters in the Telerik Native Blazor Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Parameter | [`Telerik.ReportViewer.BlazorNative.ReportParameterInfo`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types%}#reportparameterinfo) | Represents the parameter context for a report in the Telerik Report Viewer. |
| Value | `System.Object` | The value of the report parameter context. |


## ReportParameterInfo

Represents detailed information about a report parameter.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| AllowBlank | `System.Boolean` | Gets or sets a value indicating whether the report parameter allows blank values.<br>Applies only to string parameters. |
| AllowNull | `System.Boolean` | Gets or sets a value indicating whether null values are allowed for the report parameter. |
| AutoRefresh | `System.Boolean` | Gets or sets a value indicating whether the viewer should automatically refresh the report<br>when the parameter's value is changed. If set to false, users need to click a preview button to see the changes. |
| AvailableValues | `System.Collections.Generic.List{Telerik.ReportViewer.BlazorNative.ReportParameterValue}` | The list of available values for the report parameter. |
| ChildParameters | `System.Collections.Generic.List{System.String}` | The cascading child parameters associated with the report parameter. |
| HasChildParameters | `System.Boolean` | Gets a value indicating whether the report parameter has cascading child parameters<br>whose values depend on the current parameter's value. |
| Id | `System.String` | The unique identifier for the report parameter. |
| IsVisible | `System.Boolean` | Gets or sets a value indicating whether the report parameter should be visible in the report viewer. |
| Label | `System.Object` | The label of the report parameter. |
| Multivalue | `System.Boolean` | Indicates whether the parameter allows multiple values to be selected. |
| Name | `System.String` | The name of the report parameter. |
| Text | `System.String` | The text associated with the report parameter. |
| Type | `System.String` | Gets the type of the report parameter.<br>Valid types are: Boolean, DateTime, Integer, Float, and String |
| Value | `System.Object` | The value of the report parameter. |


## ReportParameterValue

Represents the value of a report parameter in the viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Name | `System.String` | The name of the report parameter. |
| Value | `System.Object` | The value of the report parameter. |


## ReportServerSettings

Specifies the configuration details for connecting to a Telerik Report Server instance. Report Server for .NET supports Token (GetPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (Url only, if enabled).

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| GetPersonalAccessToken | `System.Func{System.Threading.Tasks.Task{System.String}}` | Defines the Personal Access Token callback which retrieves the token for authenticating with the report server.<br>Report Server for .NET only. Recommended authentication method.<br>The token can be from any user, including the Guest user.<br>Optional. |
| Password | `System.String` | Defines the Password to be used for authenticating with the report server.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2.<br>Optional. |
| Url | `System.String` | Defines the Url of the report server.<br>ReportServerSettings.Url takes precedence over the viewer's ServiceUrl property.<br>Required for both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>ReportServerSettings.Url takes precedence over the viewer's ServiceUrl property. |
| Username | `System.String` | Defines the Username to be used for authenticating with the report server.<br>Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.<br>If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used.<br>Optional. |

### Example

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


## ReportSourceOptions

Specifies a report and initial report parameter values.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Parameters | `System.Collections.Generic.IDictionary{System.String,System.Object}` | Gets or sets an object with properties name/value equal to the report parameters names and values used in the report definition. |
| Report | `System.String` | Gets or sets a string that uniquely identifies a report from the Reporting REST service or the Telerik Report Server.<br>On the server side this string will be converted to a ReportSource through an IReportResolver. |

### Example

````C#
@code{
    public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Name.trdp",
        new Dictionary<string, object>
        {
            { "ParameterName1", "Value" },
            { "ParameterName2", 2 },
            { "ParameterName3", false },
        }
    );
}
````


## ReportViewer

Represents the Telerik Reporting Native Blazor Report Viewer component that allows users to display and interact with reports in a web application.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| AllowCustomPrompts | `System.Boolean` | Gets or sets whether custom prompts are allowed in the AI Prompt tool of the ReportViewer. |
| AuthenticationToken | `System.String` | Gets or sets the authentication (bearer) token that is passed in the Authorization header of the viewer's requests. |
| ContentTabIndex | `System.Int32` | Gets or sets the tab index of the content within the Report Viewer.<br>This property determines the order in which elements receive focus when navigating through the Report Viewer using the keyboard. |
| CurrentCulture | `System.Globalization.CultureInfo` | Gets or sets the current culture used by the ReportViewer. |
| DocumentMapVisible | `System.Boolean` | Gets or sets  a value indicating whether the viewer's document map is initially visible. |
| DocumentMapVisibleChanged | `Microsoft.AspNetCore.Components.EventCallback{System.Boolean}` | Gets or sets a value for the callback that will be called when the value of DocumentMapVisible changes. |
| EnableAccessibility | `System.Boolean` | Enables or disables the accessibility features of the report viewer and its contents. |
| EnableAiPrompt | `System.Boolean` | Gets or sets whether the AI Prompt tool of the ReportViewer is enabled or not. |
| EnableSendEmail | `System.Boolean` | Determines whether the send Email functionality is enabled. If set to false, the send Email button will not be rendered in the toolbar. |
| ExecuteCommand(System.String) | - | Executes a predefined command without passing any arguments.<br>The available commands are:<br>'NavigateBackward' - Goes back to the previously rendered report from history.<br>'NavigateForward' - Goes forward to the previously rendered report from history.<br>'StopRendering' - Stop the rendering of the current report at the first possible moment.<br>'Refresh' - Refreshes the report viewer.<br>'Print' - Triggers the report viewer printing operation.<br>'SendMail' - Triggers the Email-sending functionality if implemented.<br>'Search' - Shows or hides the search dialog.<br>'AiPrompt' - Shows or hides the AI prompt dialog.<br>'FirstPage' - Goes to the first page of the report.<br>'LastPage' - Goes to the last page of the report.<br>'NextPage' - Goes to the next page of the report.<br>'PreviousPage' - Goes to the previous page of the report.<br>'ZoomIn' - Zoom in the report.<br>'ZoomOut' - Zoom out the report.<br>'TogglePrintPreview' - Toggles between Print Preview and Interactive view modes.<br>'ToggleScaleMode' - Changes the scale mode of the report.<br>'ToggleDocumentMap' - Shows or hides the document map.<br>'ToggleParametersArea' - Shows or hides the parameters area. |
| ExecuteCommand(System.String,System.String) | - | Executes a predefined command with an additional value argument.<br>The available commands are:<br>'SetAuthenticationToken' - Sets the token that will be used in the Authorization header of the requests made by the viewer.<br>'Export' - Exports the report, using the respective rendering extension name, such as 'PDF'. |
| GetReportParameters | `System.Collections.Generic.IDictionary{System.String,Telerik.ReportViewer.BlazorNative.ReportParameterInfo}` | Retrieves the report parameters for the currently loaded report. |
| Height | `System.String` | The width of the component. |
| KeepClientAlive | `System.Boolean` | Gets or sets a value indicating whether the client will be kept alive.<br><br> When set to true a request will be sent to the server to stop the client from expiring, determined by the ClientSessionTimeout server configuration<br><br> When set to false, the client will be left to be expired |
| LeftPaneSize | `System.String` | Gets or sets the size of the left pane in the Report Viewer. |
| OnExportEnd | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ExportEndEventArgs}` | Event triggered when the export process has finished. |
| OnExportStart | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ExportStartEventArgs}` | Occurs when the export process is starting. |
| OnRenderingBegin | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.RenderingBeginEventArgs}` | Occurs when the report rendering process begins, allowing for custom actions or logic to be executed<br>prior to the rendering of the report. |
| OnRenderingEnd | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.RenderingEndEventArgs}` | Occurs when the rendering of the report has ended. This event can be used to perform actions after the report has been rendered, such as updating the user interface or logging the rendering status. |
| PageMode | [`Telerik.ReportViewer.BlazorNative.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#pagemode) | Sets if the report is displayed in Single page or Continuous scroll mode. |
| ParameterBooleanTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}` | Template used to render boolean report viewer parameter editors.<br>Allows for declaring custom boolean report viewer parameter editors. |
| ParameterDateTimeTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}` | Template used to render DateTime report viewer parameter editors.<br>Allows for declaring custom DateTime report viewer parameter editors. |
| ParameterDoubleTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}` | Template used to render double report viewer parameter editors.<br>Allows for declaring custom double report viewer parameter editors. |
| ParameterIntegerTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}` | Template used to render integer report viewer parameter editors.<br>Allows for declaring custom integer report viewer parameter editors. |
| ParameterMultiSelectTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}` | Template used to render multi-select report viewer parameter editors.<br>Allows for declaring custom multi-select report viewer parameter editors. |
| ParameterSingleSelectTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}` | Template used to render single-select report viewer parameter editors.<br>Allows for declaring custom single-select report viewer parameter editors. |
| ParameterStringTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}` | Template used to render string report viewer parameter editors.<br>Allows for declaring custom string report viewer parameter editors. |
| ParameterTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}` | Generic template used to render report viewer parameter editors.<br>Allows for declaring custom report viewer parameter editors. |
| ParametersAreaVisible | `System.Boolean` | Gets or sets a value indicating whether the viewer's parameters area is initially visible. |
| ParametersAreaVisibleChanged | `Microsoft.AspNetCore.Components.EventCallback{System.Boolean}` | Gets or sets a value for the callback that will be called when the value of ParametersAreaVisible changes. |
| PrintMode | [`Telerik.ReportViewer.BlazorNative.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#printmode) | Gets or sets the print mode of the viewer.<br>Three modes exist currently:<br>AutoSelect - The viewer automatically determinse how to print: via the browser's PDF plug-in or exporting to a PDF file.<br>ForcePDFPlugin - The viewer always uses the PDF plugin regardless of the browser's version and settings.<br>ForcePDFFile - The viewer always exports the report document to PDF format with 'automatic print on open' script enabled. |
| ReportSource | [`Telerik.ReportViewer.BlazorNative.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) | Gets or sets the [`Telerik.ReportViewer.BlazorNative.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions)<br>used to determine which report will be displayed by the viewer. |
| ReportSourceChanged | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ReportSourceOptions}` | Gets or sets a value for the callback that will be called when the value of ReportSource changes. |
| ReportVersionMismatchErrorMessage | `System.String` | Represents the error message used to indicate a version mismatch between the viewer and the Reporting REST Service / Report Server. |
| ReportViewerSettings | `Microsoft.AspNetCore.Components.RenderFragment` | Defines a renderfragment that contains all settings for the Report Viewer. |
| RequireConsent | `System.Boolean` | Gets or sets whether the AI Prompt tool of the ReportViewer requires consent before use. |
| RightPaneSize | `System.String` | Gets or sets the size of the right pane in the Report Viewer component. |
| Scale | `System.Double` | Gets or sets zoom ratio of the report.<br>1.0 is equal to 100%, i.e. the original size of the report. |
| ScaleChanged | `Microsoft.AspNetCore.Components.EventCallback{System.Double}` | Gets or sets a value for the callback that will be called when the value of Scale changes. |
| ScaleMode | [`Telerik.ReportViewer.BlazorNative.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#scalemode) | Gets or sets the scale mode of the viewer.<br>Three modes exist currently:<br>FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.<br>FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.<br>Specific - Uses the scale to zoom the report in and out. |
| ScaleModeChanged | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ScaleMode}` | Gets or sets a value for the callback that will be called when the value of ScaleMode changes. |
| ServiceType | [`Telerik.ReportViewer.BlazorNative.ReportViewerServiceType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#reportviewerservicetype) | Specifies the type of service the ReportViewer is using. |
| ServiceUrl | `System.String` | Gets or sets the URL of the service which will provide the report viewer with reports<br>(relative or absolute).<br>The service must be properly configured so that the report viewer can<br>successfully communicate with the server.<br>For more information on how to configure the service please check<br>http://www.telerik.com/help/reporting/telerik-reporting-rest-conception.html. |
| Tools | `System.Collections.Generic.List{Telerik.ReportViewer.BlazorNative.Tools.IReportViewerTool}` | Represents the collection of tools available in the report viewer's toolbar.<br>Allows for customizing which tools from the viewer's toolbar are visible and which ones are hidden. |
| TooltipSelector | `System.String` | Gets or sets the tooltip selector for the report viewer.<br>This property allows you to define a specific selector for tooltips in the report viewer,<br>enabling customized hover information for report elements. |
| TooltipTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.Blazor.Components.TooltipTemplateContext}` | Gets or sets the template for rendering tooltips in the ReportViewer. |
| ViewMode | [`Telerik.ReportViewer.BlazorNative.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#viewmode) | Gets or sets the view mode.<br>PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is disabled.<br>Interactive - Displays the report in its original width and height with no paging. Interactivity is enabled. |
| ViewModeChanged | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ViewMode}` | Gets or sets a value for the callback that will be called when the value of ViewMode changes. |
| Width | `System.String` | The width of the component. |

### Example

````C#
@using Telerik.Blazor
@using Telerik.Blazor.Components
@using Telerik.ReportViewer.BlazorNative

<ReportViewer
    ServiceUrl="/api/reports/"
    @bind-ReportSource="@ReportSource">
</ReportViewer>

@code {
    public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Catalog.trdp", 
        new Dictionary<string, object>
        {
            // Add parameters if applicable
        }
    );
}
````


## Search

Opens the viewer's search window which allows users to search for a specified term within the report and highlights any occurrences.


## SendEmail

Opens the viewer's send email window.


## SendEmailDialogSettings

Represents the settings for the Send Email dialog in the Telerik Reporting Native Blazor Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Body | `System.String` | Sentences used for the MailMessage Content value. |
| Cc | `System.String` | E-mail address used for the MailMessage Carbon Copy value. |
| Format | `System.String` | The preselected report document format. |
| From | `System.String` | E-mail address used for the MailMessage FROM value. |
| Subject | `System.String` | A string used for the MailMessage Subject value. |
| To | `System.String` | E-mail address used for the MailMessage TO value. |

### Example

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


## StopRendering

Cancels the rendering process of the report viewer.


## StringReportParameter

Represents a string report parameter in the Telerik Reporting Native Blazor Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| SelectedValue | `System.String` | Gets or sets the selected value of the string report parameter. |


## ToggleButtonTool

Represents the built-in toggle buttons from the report viewer's toolbar. This tool allows users to switch between two states, typically used for enabling or disabling a certain feature within the viewer.


## ToggleDocumentMap

Toggles the visibility of the document map in the report viewer if available.


## ToggleParametersArea

Toggles the visibility of the parameters area in the report viewer if available.


## ToggleScaleMode

Toggles between the different scale modes of the report viewer.


## ToggleViewMode

Toggles between the view modes of the report viewer.


## ToolSets

Predefined collections of ReportViewer tools.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Default | `System.Collections.Generic.List{Telerik.ReportViewer.BlazorNative.Tools.IReportViewerTool}` | The default set of all available tools. |


## ZoomIn

Zooms in on the report displayed in the report viewer.


## ZoomOut

Zooms out the current view of the report in the report viewer.

