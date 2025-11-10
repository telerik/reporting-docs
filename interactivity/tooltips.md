---
title: Tooltips
page_title: Tooltips at a Glance
description: "Learn how to add tooltips to report elements in a Telerik Report as well as how to configure them in the Report Viewers."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/tooltips
tags: tooltips
published: True
position: 4
previous_url: /designing-reports-interactivity-tooltips
reportingArea: General
---

# Tooltips Overview

Tooltips are added since Telerik Reporting `R1 2017`. The feature allows you add custom text and title of a box displayed on hover of an element in a Telerik Report. All report viewers provide support for displaying tooltips in a report viewer’s native rendering technology. Tooltips are supported also in PDF files.       

## Settings in Reports

Each Report section and item has a `Tooltip` property where you can configure the `Text` you want to appear on hover. You can also specify a `Title` for the tooltip's box.         

The Series collection of the [Graph item]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) also has support for tooltips.         

## Settings in Viewers

The HTML5-based Report Viewers, WinForms ReportViewer and WPF ReportViewer controls have `ToolTipOpening` events. In those events you can modify tooltips content:     

* __HTML5 Report Viewer:__ [viewerToolTipOpening(e, args)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/viewertooltipopening(e,-args)%})

* __WPF ReportViewer control:__  [ViewerToolTipOpening](/reporting/api/Telerik.ReportViewer.Wpf.ReportViewer#Telerik_ReportViewer_Wpf_ReportViewer_ViewerToolTipOpening)  event.             

* __WinForms ReportViewer control:__  [ViewerToolTipOpening](/reporting/api/Telerik.ReportViewer.WinForms.ReportViewerBase#Telerik_ReportViewer_WinForms_ReportViewerBase_ViewerToolTipOpening)  event.             

>note If you use the HTML5 Viewer, the new Tooltips functionality requires additional Kendo UI dependency. This dependency is included in the Kendo UI subset bundle provided by Telerik Reporting -  *telerikReportViewer.kendo-{{site.kendosubsetversion}}.min.js*.  
>If you use a custom set of Kendo UI widgets, you can load  __kendo.tooltip.min.js__  of your version ({{site.kendosubsetversion}}+) of Kendo UI.           

## See Also

 * [Styling Tooltips in HTML5-based Report Viewers]({%slug styling-tooltips-in-html5-based-report-viewers%})
 
 * [How to add interactivity to a report using action event handlers in WPF Report Viewer]({%slug how-to-add-interactivity-to-a-report-using-action-event-handlers-in-wpf-report-viewer%})
 
 * [How to add interactivity to a report using action event handlers in HTML5-based report viewers]({%slug how-to-add-interactivity-to-a-report-using-action-event-handlers-with-html5-based-report-viewers%})
 
 * [How to add interactivity to a report using action event handlers in WinForms Report Viewer]({%slug how-to-add-interactivity-to-a-report-using-action-event-handlers-in-winforms-report-viewer%})
