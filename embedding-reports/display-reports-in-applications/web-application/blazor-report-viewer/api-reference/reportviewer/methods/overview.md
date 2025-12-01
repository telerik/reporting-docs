---
title: Overview
page_title: Methods of the Blazor Report Viewer at a Glance
description: Learn more about the Methods of the Blazor Report Viewer and how you may use them to customize its appearance and functionality.
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/overview
tags: overview
published: True
reportingArea: BlazorWrapper
position: 0
---

<style>
table th:first-of-type {
	width: 35%;
}
table th:nth-of-type(2) {
	width: 65%;
}
</style>

# Methods of the Blazor Report Viewer

| Method | Description |
| ------ | ------ |
| [String)(, )]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/string)(,-)%})|Binds event handlers to the specified <xref href="Telerik.ReportViewer.Blazor.Event" data-throw-if-not-resolved="false"></xref>.|
| [ClearReportSourceAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/clearreportsourceasync()%})|Clears the current reportSource from the viewer internal state and from its persisted session in the browser.|
| [GetAccessibilityKeyMapAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymapasync()%})|Gets the current <xref href="Telerik.ReportViewer.Blazor.AccessibilityKeyMap" data-throw-if-not-resolved="false"></xref>, used when the report viewer is in accessible mode.|
| [GetCurrentPageAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getcurrentpageasync()%})|Gets the page number of the report page currently displayed in the viewer.|
| [GetPageCountAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getpagecountasync()%})|Gets the total page count of the report displayed in the viewer.|
| [GetPageModeAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getpagemodeasync()%})|Gets the current <xref href="Telerik.ReportViewer.Blazor.PageMode" data-throw-if-not-resolved="false"></xref>.|
| [GetReportParameters()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getreportparameters()%})|Gets the report viewer's current parameters as a dictionary of parameter name and value pairs.|
| [GetReportSourceAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getreportsourceasync()%})|Gets the current <xref href="Telerik.ReportViewer.Blazor.ReportSourceOptions" data-throw-if-not-resolved="false"></xref> containing the report identifier and report parameters values.|
| [GetScaleAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getscaleasync()%})|Gets the report viewer's scale factor.|
| [GetScaleModeAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getscalemodeasync()%})|Gets the report viewer's <xref href="Telerik.ReportViewer.Blazor.ScaleMode" data-throw-if-not-resolved="false"></xref>.|
| [GetViewModeAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getviewmodeasync()%})|Gets the current <xref href="Telerik.ReportViewer.Blazor.ViewMode" data-throw-if-not-resolved="false"></xref>.|
| [RefreshReportAsync()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/refreshreportasync()%})|Reloads/refreshes the current report.|
| [AccessibilityKeyMap)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap)()%})|Sets the <xref href="Telerik.ReportViewer.Blazor.AccessibilityKeyMap" data-throw-if-not-resolved="false"></xref>, used when the report viewer is in accessible mode.|
| [String)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/string)()%})|Sets the authentication token.|
| [PageMode)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/pagemode)()%})|Sets the <xref href="Telerik.ReportViewer.Blazor.PageMode" data-throw-if-not-resolved="false"></xref> and automatically reloads the current report (if any) into the new view.|
| [ReportSourceOptions)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/reportsourceoptions)()%})|Sets the <xref href="Telerik.ReportViewer.Blazor.ReportSourceOptions" data-throw-if-not-resolved="false"></xref> and reloads the report.|
| [Double)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/double)()%})|Sets the report viewer's scale factor.|
| [ScaleMode)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/scalemode)()%})|Sets the report viewer's <xref href="Telerik.ReportViewer.Blazor.ScaleMode" data-throw-if-not-resolved="false"></xref>.|
| [ViewMode)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/viewmode)()%})|Sets the <xref href="Telerik.ReportViewer.Blazor.ViewMode" data-throw-if-not-resolved="false"></xref> and automatically reloads the current report (if any) into the new view.|
| [Event)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/event)()%})|Unbinds all event handlers from the specified <xref href="Telerik.ReportViewer.Blazor.Event" data-throw-if-not-resolved="false"></xref> including anonymous ones.|
| [String)(, )]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/string)(,-)%})|Unbinds event handlers from the specified <xref href="Telerik.ReportViewer.Blazor.Event" data-throw-if-not-resolved="false"></xref>.|

## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})
