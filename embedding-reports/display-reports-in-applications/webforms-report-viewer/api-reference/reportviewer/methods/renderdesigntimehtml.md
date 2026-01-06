---
title: RenderDesignTimeHtml
page_title: The RenderDesignTimeHtml method of the HTML5 ASP.NET WebForms Report Viewer explained
description: "Learn more about the RenderDesignTimeHtml method of the HTML5 ASP.NET WebForms Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/renderdesigntimehtml
tags: renderdesigntimehtml
published: True
reportingArea: WebForms
position: 2
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }
</style>

# The `RenderDesignTimeHtml` method of the HTML5 ASP.NET WebForms Report Viewer

Renders the HTML5 ReportViewer control for design-time display in Visual Studio designer. Generates a simplified HTML representation of the HTML5 viewer for Visual Studio design surface display, showing the control dimensions and identification.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| writer | `System.Web.UI.HtmlTextWriter` | No | The HtmlTextWriter object that receives the design-time HTML output. |
