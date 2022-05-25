---
title: data attributes
page_title: data attributes 
description: data attributes
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/data-attributes
tags: data,attributes
published: True
position: 2
---
<style>
table th:first-of-type {
    width: 42%;
}
table th:nth-of-type(2) {
    width: 58%;
}
</style>

# data attributes

Behavior can be added to HTML DOM elements either with *data-* attributes or through the [commands]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/properties/commands%}) property of the report viewer. 

The *data-* attributes give a lot of flexibility to the application since commands can be attached to HTML elements only by adding a *data-command* attribute along with a *data-target-report-viewer* to target the specific report viewer (since there can exist multiple report viewers on a single page): 
    
````html
<button id="printButton" data-command="telerik_ReportViewer_print" data-target-report-viewer="#reportViewer1">Print report</button>
````

When initializing the report viewer the selector used in *data-target-report-viewer* has to be explicitly provided as an option:
    
````html
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "../api/reports/",
  templateUrl: 'src/templates/telerikReportViewerTemplate-x.x.x.x.html',
  reportSource: { report: "product catalog.trdx" },
  selector: '#reportViewer1'
});
````

The button above will simply print the report currently displayed. Elements do not need to exist prior to the viewer initialization - they can be created on the fly and as soon as they have the *data-command* and *data-target-report-viewer* attribute the command can be executed. 

The following table is a list of all available commands for the *data-command* attribute: 


| Command | Description |
| ------ | ------ |
| __telerik_ReportViewer_historyBack__ |Go back to the previously rendered report (can be the same report with different parameters for example)|
| __telerik_ReportViewer_historyForward__ |Go forward to the next rendered report (can be the same report with different parameters for example)|
| __telerik_ReportViewer_stopRendering__ |Stop the report rendering|
| __telerik_ReportViewer_refresh__ |Refresh the report|
| __telerik_ReportViewer_goToFirstPage__ |Go to the first page of the report|
| __telerik_ReportViewer_goToPrevPage__ |Go to the previous page of the report|
| __telerik_ReportViewer_PageNumberInput__ |Enter the desired report page manually|
| __telerik_ReportViewer_PageCountLabel__ |Displays the total count of the pages|
| __telerik_ReportViewer_goToNextPage__ |Go to the next page of the report|
| __telerik_ReportViewer_goToLastPage__ |Go to the last page of the report|
| __telerik_ReportViewer_togglePrintPreview__ |Toggle between Print Preview and Interactive modes|
| __telerik_ReportViewer_export__ |Export the report, using the respective *data-command-parameter* *|
| __telerik_ReportViewer_print__ |Print the report|
| __telerik_ReportViewer_toggleDocumentMap__ |Show or hide the document map|
| __telerik_ReportViewer_toggleParametersArea__ |Show or hide the parameters area|
| __telerik_ReportViewer_zoomIn__ |Zoom in the report|
| __telerik_ReportViewer_zoomOut__ |Zoom out the report|
| __telerik_ReportViewer_toggleZoomMode__ |Change the zoom mode of the report|
| __telerik_ReportViewer_toggleSideMenu__ |Show or hide the side menu|
| __telerik_ReportViewer_toggleSearchDialog__ |Show or hide the search dialog|

\* The export command requires one additional parameter, *data-command-parameter*, which will specify the export format. The full list of all allowed *data-command-parameter* values:  



| Label | Command Parameter |
| ------ | ------ |
| __Adobe (PDF) file__ |PDF|
| __CSV (comma delimited)__ |CSV|
| __Excel 97-2003__ |XLS|
| __Excel Worksheet__ |XLSX|
| __PowerPoint Presentation__ |PPTX|
| __Rich Text Format__ |RTF|
| __TIFF File__ |IMAGE|
| __Web Archive__ |MHTML|
| __Word Document__ |DOCX|
| __XPS Document__ |XPS|


Depending on the report and the history of browsed reports some of the buttons might be disabled and others toggled. The commands automatically keep track of their state, but if custom widgets are used this state will not be displayed properly. Therefore a disabledButtonClass and checkedButtonClass can be provided to the report viewer upon initialization - these classes will be added when the custom button is disabled or toggled, respectively.
