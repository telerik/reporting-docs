---
title: TooltipTemplate
page_title: TooltipTemplate property
description: "Gets or sets the template for rendering tooltips in the ReportViewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/tooltiptemplate
published: True
reportingArea: NativeBlazor
---

# TooltipTemplate

Gets or sets the template for rendering tooltips in the ReportViewer.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.Blazor.Components.TooltipTemplateContext}`

## Examples

````JavaScript
<ReportViewer>
    <TooltipTemplate>
        <div class="trv-pages-area-kendo-tooltip">
            <div class="trv-pages-area-kendo-tooltip-title">@context.DataAttributes["tooltipTitle"]</div>
            <div class="trv-pages-area-kendo-tooltip-text">@context.DataAttributes["tooltipText"]</div>
        </div>
    </TooltipTemplate>
</ReportViewer>
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
