---
title: Customize the Toolbar
page_title: Customizing Native Blazor Viewer's Toolbar
description: "Learn what tools are used in the Toolbar of the Telerik Reporting Native Blazor Report Viewer and how to customize it."
slug: native-blazor-report-viewer/toolbar-customization
tags: custom,editor,widget,blazor,toolbar,menu
published: True
reporting_area: NativeBlazor
position: 4
---

# Customize the Toolbar of the Blazor Native Report Viewer

This article explains how to customize the default set and order of tools displayed in the Blazor Native ReportViewer toolbar.

The customization is done similarly to the [Blazor Editor component](https://www.telerik.com/blazor-ui/editor).

## Available Tools

Here is the list of all the Tools that may be used in the toolbar in their default order of appearance as may be seen in the [Native Blazor Report Viewer Overview]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}):

* `NavigateBackward`
* `NavigateForward`
* `StopRendering`
* `Refresh`
* `FirstPage`
* `PreviousPage`
* `PageNumber`
* `NextPage`
* `LastPage`
* `ToggleViewMode`
* `Export`
* `Print`
* `SendEmail`
* `ToggleDocumentMap`
* `ToggleParametersArea`
* `ZoomIn`
* `ZoomOut`
* `ToggleScaleMode`
* `Search`

The predefined set of all available tools is accessible from the `Telerik.ReportViewer.BlazorNative.Tools.ToolSets.Default` static property. It will return the List of the tools displayed by default in the ReportViewer.

## Implementing the Customized Toolbar

Use the `Tools` [option of the viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/options%}#options) to pass a custom ordered list of Tools for the Toolbar. For example, the below code removes the _Search_, _SendEmail_ and _zoom_ functionalities from the viewer and moves the _Refresh_ in the beginning of the toolbar:

````CSHTML
@page "/"

@using Telerik.ReportViewer.BlazorNative.Tools

<ReportViewer
	ServiceUrl="/api/reports"
	@bind-ReportSource="@ReportSource"
	Tools="@Tools">
</ReportViewer>

@code {
	public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Catalog.trdp", new Dictionary<string, object> {});
	public List<IReportViewerTool> Tools = new List<IReportViewerTool>
	{
		new Refresh(),
		new NavigateBackward(),
		new NavigateForward(),
		new StopRendering(),
		new FirstPage(),
		new PreviousPage(),
		new PageNumber(),
		new NextPage(),
		new LastPage(),
		new ToggleViewMode(),
		new Export(),
		new Print(),
		new ToggleDocumentMap(),
		new ToggleParametersArea()
	};
}
```` 

## See Also

* [Blazor Editor component](https://www.telerik.com/blazor-ui/editor)
* [Blazor Report Viewer Options]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/options%}#options)
