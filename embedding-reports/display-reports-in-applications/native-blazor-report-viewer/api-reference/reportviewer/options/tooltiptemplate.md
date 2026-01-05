---
title: TooltipTemplate
page_title: TooltipTemplate property
description: "Gets or sets the template for rendering tooltips in the ReportViewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/tooltiptemplate
published: True
reportingArea: NativeBlazor
---

# The `TooltipTemplate` option of the Native Blazor Report Viewer

Gets or sets the template for rendering tooltips in the ReportViewer.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.Blazor.Components.TooltipTemplateContext}`

## Examples

````C#
<ReportViewer>
    <TooltipTemplate>
        <div class="trv-pages-area-kendo-tooltip">
            <div class="trv-pages-area-kendo-tooltip-title">@context.DataAttributes["tooltipTitle"]</div>
            <div class="trv-pages-area-kendo-tooltip-text">@context.DataAttributes["tooltipText"]</div>
        </div>
    </TooltipTemplate>
</ReportViewer>
````

