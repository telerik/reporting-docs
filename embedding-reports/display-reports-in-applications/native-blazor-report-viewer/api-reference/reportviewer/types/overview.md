---
title: Overview
page_title: Types of the Native Blazor Report Viewer
description: Object types and interfaces used by the Native Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/overview
tags: overview,types
published: True
reportingArea: NativeBlazor
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

    th {
        white-space: nowrap;
    }
</style>

# Types of the Native Blazor Report Viewer

| Type | Description |
| ------ | ------ |
| [BooleanReportParameter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/booleanreportparameter%})|Represents a boolean parameter editor for the Telerik Reporting Native Blazor Report Viewer.|
| [ButtonTool]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/buttontool%})|Represents the built-in buttons from the report viewer's toolbar.<br>Allows users to interact with reports through buttons in the toolbar.|
| [DateTimeReportParameter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/datetimereportparameter%})|Represents a DateTime parameter editor for the Telerik Reporting Native Blazor Report Viewer.|
| [DeviceInfo]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/deviceinfo%})|Represents the device information settings sent to the server by the viewer<br>when the report rendering is initiated (the RenderingBegin and ExportStart events).|
| [DocumentInfo]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/documentinfo%})|Represents comprehensive information about a report document's state during rendering and when the rendering ends.<br>The information in this object is used internally by the report viewer to manage how reports are displayed and interacted with.|
| [DoubleReportParameter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/doublereportparameter%})|Represents a parameter editor for double report parameters in the Telerik Reporting Native Blazor Report Viewer.|
| [DropDownButtonTool]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/dropdownbuttontool%})|Represents the built-in drop-down buttons from the report viewer's toolbar.<br>This tool allows users to select options from a list, enhancing the interactivity of the report viewer.|
| [Export]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/export%})|Exports the report viewer content to a specified format.|
| [ExportEndEventArgs]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/exportendeventargs%})|Provides data for the ExportEnd event in the Telerik Report Viewer.|
| [ExportStartEventArgs]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/exportstarteventargs%})|Represents the event arguments for the ExportStart event in the Telerik ReportViewer component.|
| [FirstPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/firstpage%})|Navigates to the first page of the report viewer.|
| [LastPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/lastpage%})|Navigates to the last page of the report being viewed in the Telerik Report Viewer.|
| [LongReportParameter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/longreportparameter%})|Represents a long report parameter in the Telerik Reporting Native Blazor Report Viewer.|
| [MultiSelectReportParameter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/multiselectreportparameter%})|Represents a multi-select report parameter in the Telerik Reporting Native Blazor Report Viewer.<br>This parameter allows users to select multiple values from a predefined list.|
| [NavigateBackward]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/navigatebackward%})|Navigates backward in the report viewer's navigation history.|
| [NavigateForward]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/navigateforward%})|Navigates forward in the report viewer's navigation history.|
| [NextPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/nextpage%})|Navigates to the next page in the report viewer.|
| [PageNumber]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/pagenumber%})|Allows navigating to a specific page in the report by typing it into a numeric textbox.|
| [PreviousPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/previouspage%})|Navigates to the previous page in the report viewer.|
| [Print]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/print%})|Prints the current report displayed in the viewer.|
| [Refresh]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/refresh%})|Refreshes the report viewer, reloading the current report and updating the displayed content.|
| [RenderingBeginEventArgs]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/renderingbegineventargs%})|Represents the event arguments for the RenderingBegin event in the Telerik Report Viewer.|
| [RenderingEndEventArgs]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/renderingendeventargs%})|Provides data for the RenderingEnd event in the Telerik Report Viewer.|
| [ReportParameterBase]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparameterbase%})|Represents the base class for all report parameter editors in the Telerik Reporting Blazor Native Report Viewer.|
| [ReportParameterContext]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparametercontext%})|Represents the context for report parameters in the Telerik Native Blazor Report Viewer.|
| [ReportParameterInfo]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparameterinfo%})|Represents detailed information about a report parameter.|
| [ReportParameterValue]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparametervalue%})|Represents the value of a report parameter in the viewer.|
| [ReportServerSettings]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportserversettings%})|Specifies the configuration details for connecting to a Telerik Report Server instance.<br>Report Server for .NET supports Token (GetPersonalAccessToken) or username/password authentication.<br>Report Server for .NET Framework 4.6.2 supports username/password or Guest account (Url only, if enabled).|
| [ReportSourceOptions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%})|Specifies a report and initial report parameter values.|
| [ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportviewer%})|Represents the Telerik Reporting Native Blazor Report Viewer component that allows users to display and interact with reports in a web application.|
| [Search]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/search%})|Opens the viewer's search window which allows users to search<br>for a specified term within the report and highlights any occurrences.|
| [SendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/sendemail%})|Opens the viewer's send email window.|
| [SendEmailDialogSettings]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/sendemaildialogsettings%})|Represents the settings for the Send Email dialog in the Telerik Reporting Native Blazor Report Viewer.|
| [StopRendering]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/stoprendering%})|Cancels the rendering process of the report viewer.|
| [StringReportParameter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/stringreportparameter%})|Represents a string report parameter in the Telerik Reporting Native Blazor Report Viewer.|
| [ToggleButtonTool]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/togglebuttontool%})|Represents the built-in toggle buttons from the report viewer's toolbar.<br>This tool allows users to switch between two states, typically used for enabling or disabling a certain feature within the viewer.|
| [ToggleDocumentMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/toggledocumentmap%})|Toggles the visibility of the document map in the report viewer if available.|
| [ToggleParametersArea]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/toggleparametersarea%})|Toggles the visibility of the parameters area in the report viewer if available.|
| [ToggleScaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/togglescalemode%})|Toggles between the different scale modes of the report viewer.|
| [ToggleViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/toggleviewmode%})|Toggles between the view modes of the report viewer.|
| [ToolSets]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/toolsets%})|Predefined collections of ReportViewer tools.|
| [ZoomIn]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/zoomin%})|Zooms in on the report displayed in the report viewer.|
| [ZoomOut]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/zoomout%})|Zooms out the current view of the report in the report viewer.|
