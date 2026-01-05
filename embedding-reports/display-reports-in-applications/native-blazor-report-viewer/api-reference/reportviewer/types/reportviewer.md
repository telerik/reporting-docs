---
title: Telerik.ReportViewer.BlazorNative.ReportViewer
page_title: Telerik.ReportViewer.BlazorNative.ReportViewer Type
description: "Represents the Telerik Reporting Native Blazor Report Viewer component that allows users to display and interact with reports in a web application."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportviewer
published: True
reportingArea: NativeBlazor
---

# The `ReportViewer` type of the Native Blazor Report Viewer

Represents the Telerik Reporting Native Blazor Report Viewer component that allows users to display and interact with reports in a web application.

## Properties

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
| PageMode | [`Telerik.ReportViewer.BlazorNative.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations/pagemode%}) | Sets if the report is displayed in Single page or Continuous scroll mode. |
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
| PrintMode | [`Telerik.ReportViewer.BlazorNative.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations/printmode%}) | Gets or sets the print mode of the viewer.<br>Three modes exist currently:<br>AutoSelect - The viewer automatically determinse how to print: via the browser's PDF plug-in or exporting to a PDF file.<br>ForcePDFPlugin - The viewer always uses the PDF plugin regardless of the browser's version and settings.<br>ForcePDFFile - The viewer always exports the report document to PDF format with 'automatic print on open' script enabled. |
| ReportSource | [`Telerik.ReportViewer.BlazorNative.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%}) | Gets or sets the [`Telerik.ReportViewer.BlazorNative.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%})<br>used to determine which report will be displayed by the viewer. |
| ReportSourceChanged | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ReportSourceOptions}` | Gets or sets a value for the callback that will be called when the value of ReportSource changes. |
| ReportVersionMismatchErrorMessage | `System.String` | Represents the error message used to indicate a version mismatch between the viewer and the Reporting REST Service / Report Server. |
| ReportViewerSettings | `Microsoft.AspNetCore.Components.RenderFragment` | Defines a renderfragment that contains all settings for the Report Viewer. |
| RequireConsent | `System.Boolean` | Gets or sets whether the AI Prompt tool of the ReportViewer requires consent before use. |
| RightPaneSize | `System.String` | Gets or sets the size of the right pane in the Report Viewer component. |
| Scale | `System.Double` | Gets or sets zoom ratio of the report.<br>1.0 is equal to 100%, i.e. the original size of the report. |
| ScaleChanged | `Microsoft.AspNetCore.Components.EventCallback{System.Double}` | Gets or sets a value for the callback that will be called when the value of Scale changes. |
| ScaleMode | [`Telerik.ReportViewer.BlazorNative.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations/scalemode%}) | Gets or sets the scale mode of the viewer.<br>Three modes exist currently:<br>FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.<br>FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.<br>Specific - Uses the scale to zoom the report in and out. |
| ScaleModeChanged | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ScaleMode}` | Gets or sets a value for the callback that will be called when the value of ScaleMode changes. |
| ServiceType | [`Telerik.ReportViewer.BlazorNative.ReportViewerServiceType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations/reportviewerservicetype%}) | Specifies the type of service the ReportViewer is using. |
| ServiceUrl | `System.String` | Gets or sets the URL of the service which will provide the report viewer with reports<br>(relative or absolute).<br>The service must be properly configured so that the report viewer can<br>successfully communicate with the server.<br>For more information on how to configure the service please check<br>http://www.telerik.com/help/reporting/telerik-reporting-rest-conception.html. |
| Tools | `System.Collections.Generic.List{Telerik.ReportViewer.BlazorNative.Tools.IReportViewerTool}` | Represents the collection of tools available in the report viewer's toolbar.<br>Allows for customizing which tools from the viewer's toolbar are visible and which ones are hidden. |
| TooltipSelector | `System.String` | Gets or sets the tooltip selector for the report viewer.<br>This property allows you to define a specific selector for tooltips in the report viewer,<br>enabling customized hover information for report elements. |
| TooltipTemplate | `Microsoft.AspNetCore.Components.RenderFragment{Telerik.Blazor.Components.TooltipTemplateContext}` | Gets or sets the template for rendering tooltips in the ReportViewer. |
| ViewMode | [`Telerik.ReportViewer.BlazorNative.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations/viewmode%}) | Gets or sets the view mode.<br>PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is disabled.<br>Interactive - Displays the report in its original width and height with no paging. Interactivity is enabled. |
| ViewModeChanged | `Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ViewMode}` | Gets or sets a value for the callback that will be called when the value of ViewMode changes. |
| Width | `System.String` | The width of the component. |

## Example

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

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
