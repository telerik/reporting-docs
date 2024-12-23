---
title: Customizing Parameter Inputs and Highlighting Selection in Web Report Designer
description: Learn how to customize the style of parameter inputs and highlight selections in the Web Report Designer.
type: how-to
page_title: How to Customize Parameter Inputs and Highlight Selections in Telerik Web Report Designer
slug: customize-parameter-inputs-highlight-selection-web-report-designer
tags: telerik, reporting, web report designer, customization, css, javascript
res_type: kb
ticketid: 1674196
---

## Environment

| Version | Product | Author |  
| --- | --- | ---- |  
| 18.3.24.1112 | Telerik Web Report Designer |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Customizing the style of parameter inputs and highlighting selections can enhance the usability and visual appeal of the Web Report Designer. This article demonstrates how to adjust the layout of CheckBox parameters and apply a darker color to selected items in the parameters area.

This knowledge base article also answers the following questions:
- How to apply custom styles to CheckBox parameters in the Web Report Designer?
- How to highlight selected parameters in the Web Report Designer?
- How to customize the parameters area in the Web Report Designer using CSS and JavaScript?

## Solution

To customize the CheckBox parameters layout and highlight selections in the Web Report Designer, follow the steps below:

1. Insert the following JavaScript in the `<script type="text/javascript">` section of your `webReportDesigner.html` file. This script utilizes the `viewerInitializing` event to apply CSS Flex Container styling to CheckBox parameters.

```javascript
function onViewerInitializing(e, args) {
    args.reportViewerOptions.pageReady = (e, args) => {   
        $(".trv-parameter-editor-boolean").parent().parent().parent().css("display", "flex"); 
    };
}

$(document).ready(function () {
    $("#webReportDesigner").telerik_WebReportDesigner({
        toolboxArea: {
            layout: "list" // Change to "grid" for a grid layout in the Components area.
        },
        serviceUrl: "api/reportdesigner/",
        report: "Reportbool.trdp",
        viewerInitializing: onViewerInitializing,
        startMode: "design", // Change to "preview" for preview mode.
    }).data("telerik_WebDesigner");
});
```

2. To bring the CheckBox closer to its header text and highlight selected items, add the following CSS in the `<head>` of your HTML file:

```css
<style>
    #webReportDesigner .trv-parameter-header {
        width: auto;
        margin-right: 15px;
    }
    #webReportDesigner .trv-listviewitem.k-listview-item.k-selected {
        background-color: rgba(255, 99, 88, 0.25); /* Adjust the RGB color as desired */
    }
</style>
```

Replace `#webReportDesigner` with the actual ID of your Web Report Designer element if it differs.

These adjustments will improve the layout and visual feedback in the parameters area of the Web Report Designer. Inspect the HTML elements to identify specific CSS classes if further customization is needed.

## See Also

- [Web Report Designer Overview](https://docs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/overview)
- [Kendo Widgets Requirements](https://docs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/overview#kendo-widgets-requirements)
- [ViewerInitializing Event](https://docs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/web-report-designer-initialization#viewerinitializing)
- [PageReady Event](https://docs.telerik.com/reporting/embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/pageready(e,-args))
- [CSS Flexbox Container](https://www.w3schools.com/css/css3_flexbox_container.asp)
