---
title: Overview
page_title: Components - Overview
description: Explore the available report components offered by the Web Report Designer.
slug: web-report-designer-user-guide-components
tags: web, report, design, report, components, overview
published: True
position: 0
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey; 
}
table th:first-of-type {
	width: 50%;
}
table th:nth-of-type(2) {
	width:50%;
}
}
</style>

# Components - Overview

Each report is constructed by [report items]({%slug user-guide/components/report-items%}) organized in different groups in the **Components** tab based on their purpose. 
The Components Tray lists the available report components that can be added to the web design report. The items are organized in groups based on their type. The area supports two kinds of layout - grid and list. The list is the default view.

![Components tray in List Mode ><](images/wrd-components-tray-design-mode.png)
 
|Group|Report Items|
|----|----|
|[Report Items]({%slug user-guide/components/report-items%}) - The main building parts  used in the report depending on the data that will be displayed, e.g. a TextBox item for static or data-bound text, a PictureBox for displaying images, a Barcode for showing barcode in a label report, etc.|<ul><li>TextBox</li><li>HtmlTextBox</li><li>PictureBox</li><li>CheckBox</li><li>Barcode</li><li>Shape</li><li>Panel</li><li>Radial Gauge Wizard</li><li>Linear Gauge Wizard</li></ul>|
|[Tables]({%slug web-report-designer-user-guide-components-tables%}) - The Table report item is a generalized layout report item that displays report data in cells that are organized into rows and columns.|<ul><li>List</li><li>Table</li><li>Crosstab</li><li>Table Wizard</li><li>Crosstab Wizard</li></ul>|
|Report - The SubReport item enables you to display reports within reports and serves as a container, similar to the report sections, growing in size depending on its children.|<ul><li>SubReport</li></ul>|
|[Maps]({%slug web-report-designer-user-guide-components-maps%}) - The Map report item is a native Telerik Reporting item which enables you to visualize an aggregated business data in a geographical manner.|<ul><li>Map types: Point, Pie, Column</li><li>Choropleth</li></ul>|
|[Charts]({%slug web-report-designer-user-guide-components-charts%}) - The Graph report item is a native Telerik Reporting item that allows you to generate different Chart types (objects) and visually present large volumes of aggregated information.|<ul><li>Bar Chart</li><li>Line Chart</li><li>Area Chart</li><li>Column Chart</li><li>Pie Chart</li><li>Doughnut Chart</li></ul>|
|[Report Sections]({%slug user-guide/components/report-sections%}) - A Telerik report consists of different sections that may contain report items. Each report section represents a specific area on the report page and defines the rendering of its report items.|<ul><li>Page Header</li><li>Page Footer</li><li>Report Header</li><li>Report Footer</li><li>Table of Contents</li></ul>|
|[DataSources]({%slug web-report-designer-user-guide-components-data-sources%}) - Data Source components are used to connect data items to different types of data without writing any code.|<ul><li>SQL Data Source</li><li>CSV Data Source</li><li>Web Service Data Source</li><li>GraphQL Data Source</li><li>JSON Data Source</li><li>Object Data Source</li></ul>|

## Next Steps

* [Report Items]({%slug user-guide/components/report-items%})
* [Configuring DataSources]({%slug web-report-designer-user-guide-components-data-sources%})

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})


