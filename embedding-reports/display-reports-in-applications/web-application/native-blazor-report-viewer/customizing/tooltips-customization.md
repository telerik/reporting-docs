---
title: Customize the Tooltips
page_title: Customizing Native Blazor Viewer's Tooltips
description: "Learn how the Tooltips of the Native Blazor Report Viewer work in Telerik Reporting and how to customize them."
slug: native-blazor-report-viewer/tooltips-customization
tags: custom,editor,widget,blazor,tooltips
published: True
reporting_area: NativeBlazor
position: 4
---

# Customize the Tooltips of the Blazor Native Report Viewer

The tooltips are working by default and don't require any additional settings.

This article explains how to customize the tooltips of the Report and the viewer's widgets in the Blazor Native ReportViewer.

## Custom Tooltip

You may provide a custom template for the tooltips used in the Blazor Native Report Viewer. The template receives a context of type `TooltipTemplateContext`, which has the following properties:

* `Title`, _string_ - the title attribute of the underlying HTML element. This is used by the [Blazor Tooltip component](https://docs.telerik.com/blazor-ui/components/tooltip/overview), and not used in the Report Viewer. The tooltips are set through data attributes.
* `DataAttributes`, _Dictionary<string, string>_ - a dictionary of all data attributes set to the element. The keys are all converted from _kebab-case_ to _camelCase_, and the _data-_ prefix is stripped. So for instance `data-tooltip-title` is accessed through `tooltipTitle`.

The Blazor Native Report Viewer provides two data attributes, which hold information:

* `tooltipTitle`
* `tooltipText`

## Implementing the Customized Tooltip

The following example shows how to set a tooltip template. It is a direct copy of the default tooltip template:

````CSHTML
<ReportViewer
	ServiceUrl="/api/reports"
	...>
	<TooltipTemplate>
		<div class="trv-pages-area-kendo-tooltip">
			<div class="trv-pages-area-kendo-tooltip-title">@context.DataAttributes["tooltipTitle"]</div>
			<div class="trv-pages-area-kendo-tooltip-text">@context.DataAttributes["tooltipText"]</div>
		</div>
	</TooltipTemplate>
</ReportViewer>
```` 

>note There is a bug in the [Blazor Tooltip component](https://docs.telerik.com/blazor-ui/components/tooltip/overview) that's used in the viewer, which causes the tooltip not to be shown when hovering over adjacent elements.

## See Also

* [Blazor Report Viewer Options]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/options%}#options)
* [Blazor Tooltip component](https://docs.telerik.com/blazor-ui/components/tooltip/overview)
