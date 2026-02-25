---
title: Commands
page_title: Commands of the HTML5 Report Viewer
description: Complete list of commands available in the HTML5 Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/commands
tags: commands
published: True
reportingArea: HTML5
position: 5
---

# Commands of the HTML5 Report Viewer

## export

Exports the report, using the respective rendering extension name.

### Example

````JavaScript
// Execute the export command as PDF
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.export.exec("PDF");
````

````JavaScript
// Check if export is enabled
if (rv.commands.export.enabled()) {}
````

````JavaScript
// Check if export is checked
if (rv.commands.export.checked()) {}
````


## goToFirstPage

Goes to the first page of the report.

### Example

````JavaScript
// Execute the goToFirstPage command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.goToFirstPage.exec();
````

````JavaScript
// Check if goToFirstPage is enabled
if (rv.commands.goToFirstPage.enabled()) {}
````

````JavaScript
// Check if goToFirstPage is checked
if (rv.commands.goToFirstPage.checked()) {}
````


## goToLastPage

Goes to the last page of the report.

### Example

````JavaScript
// Execute the goToLastPage command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.goToLastPage.exec();
````

````JavaScript
// Check if goToLastPage is enabled
if (rv.commands.goToLastPage.enabled()) {}
````

````JavaScript
// Check if goToLastPage is checked
if (rv.commands.goToLastPage.checked()) {}
````


## goToNextPage

Goes to the next page of the report.

### Example

````JavaScript
// Execute the goToNextPage command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.goToNextPage.exec();
````

````JavaScript
// Check if goToNextPage is enabled
if (rv.commands.goToNextPage.enabled()) {}
````

````JavaScript
// Check if goToNextPage is checked
if (rv.commands.goToNextPage.checked()) {}
````


## goToPrevPage

Goes to the previous page of the report.

### Example

````JavaScript
// Execute the goToPrevPage command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.goToPrevPage.exec();
````

````JavaScript
// Check if goToPrevPage is enabled
if (rv.commands.goToPrevPage.enabled()) {}
````

````JavaScript
// Check if goToPrevPage is checked
if (rv.commands.goToPrevPage.checked()) {}
````


## historyBack

Goes back to the previously rendered report from history.

### Example

````JavaScript
// Execute the historyBack command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.historyBack.exec();
````

````JavaScript
// Check if historyBack is enabled
var rv = $("#reportViewer1").data("telerik_ReportViewer");
if (rv.commands.historyBack.enabled()) { }
````

````JavaScript
// Check if historyBack is checked
var rv = $("#reportViewer1").data("telerik_ReportViewer");
if (rv.commands.historyBack.checked()) {}
````


## historyForward

Goes forward to the next rendered report from history.

### Example

````JavaScript
// Execute the historyForward command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.historyForward.exec();
````

````JavaScript
// Check if historyForward is enabled
if (rv.commands.historyForward.enabled()) {}
````

````JavaScript
// Check if historyForward is checked
if (rv.commands.historyForward.checked()) {}
````


## print

Triggers the report printing.

### Example

````JavaScript
// Execute the print command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.print.exec();
````

````JavaScript
// Check if print is enabled
if (rv.commands.print.enabled()) {}
````

````JavaScript
// Check if print is checked
if (rv.commands.print.checked()) {}
````


## refresh

Refreshes the report.

### Example

````JavaScript
// Execute the refresh command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.refresh.exec();
````

````JavaScript
// Check if refresh is enabled
if (rv.commands.refresh.enabled()) {}
````

````JavaScript
// Check if refresh is checked
if (rv.commands.refresh.checked()) {}
````


## stopRendering

Stops the rendering of the current report.

### Example

````JavaScript
// Execute the stopRendering command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.stopRendering.exec();
````

````JavaScript
// Check if stopRendering is enabled
if (rv.commands.stopRendering.enabled()) {}
````

````JavaScript
// Check if stopRendering is checked
if (rv.commands.stopRendering.checked()) {}
````


## toggleAiPromptDialog

Shows or hides the AI prompt dialog.

### Example

````JavaScript
// Execute the toggleAiPromptDialog command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.toggleAiPromptDialog.exec();
````

````JavaScript
// Check if toggleAiPromptDialog is enabled
if (rv.commands.toggleAiPromptDialog.enabled()) {}
````

````JavaScript
// Check if toggleAiPromptDialog is checked
if (rv.commands.toggleAiPromptDialog.checked()) {}
````


## toggleDocumentMap

Shows or hides the document map.

### Example

````JavaScript
// Execute the toggleDocumentMap command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.toggleDocumentMap.exec();
````

````JavaScript
// Check if toggleDocumentMap is enabled
if (rv.commands.toggleDocumentMap.enabled()) {}
````

````JavaScript
// Check if toggleDocumentMap is checked
if (rv.commands.toggleDocumentMap.checked()) {}
````


## toggleParametersArea

Shows or hides the parameters area.

### Example

````JavaScript
// Execute the toggleParametersArea command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.toggleParametersArea.exec();
````

````JavaScript
// Check if toggleParametersArea is enabled
if (rv.commands.toggleParametersArea.enabled()) {}
````

````JavaScript
// Check if toggleParametersArea is checked
if (rv.commands.toggleParametersArea.checked()) {}
````


## togglePrintPreview

Toggles between Print Preview and Interactive view modes.

### Example

````JavaScript
// Execute the togglePrintPreview command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.togglePrintPreview.exec();
````

````JavaScript
// Check if togglePrintPreview is enabled
if (rv.commands.togglePrintPreview.enabled()) {}
````

````JavaScript
// Check if togglePrintPreview is checked
if (rv.commands.togglePrintPreview.checked()) {}
````


## toggleSearchDialog

Shows or hides the search dialog.

### Example

````JavaScript
// Execute the toggleSearchDialog command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.toggleSearchDialog.exec();
````

````JavaScript
// Check if toggleSearchDialog is enabled
if (rv.commands.toggleSearchDialog.enabled()) {}
````

````JavaScript
// Check if toggleSearchDialog is checked
if (rv.commands.toggleSearchDialog.checked()) {}
````


## toggleSendEmailDialog

Shows or hides the send email dialog.

### Example

````JavaScript
// Execute the toggleSendEmailDialog command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.toggleSendEmailDialog.exec();
````

````JavaScript
// Check if toggleSendEmailDialog is enabled
if (rv.commands.toggleSendEmailDialog.enabled()) {}
````

````JavaScript
// Check if toggleSendEmailDialog is checked
if (rv.commands.toggleSendEmailDialog.checked()) {}
````


## toggleZoomMode

Changes the zoom mode of the report.

### Example

````JavaScript
// Execute the toggleZoomMode command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.toggleZoomMode.exec();
````

````JavaScript
// Check if toggleZoomMode is enabled
if (rv.commands.toggleZoomMode.enabled()) {}
````

````JavaScript
// Check if toggleZoomMode is checked
if (rv.commands.toggleZoomMode.checked()) {}
````


## zoomIn

Zooms in the report.

### Example

````JavaScript
// Execute the zoomIn command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.zoomIn.exec();
````

````JavaScript
// Check if zoomIn is enabled
if (rv.commands.zoomIn.enabled()) {}
````

````JavaScript
// Check if zoomIn is checked
if (rv.commands.zoomIn.checked()) {}
````


## zoomOut

Zooms out the report.

### Example

````JavaScript
// Execute the zoomOut command
var rv = $("#reportViewer1").data("telerik_ReportViewer");
rv.commands.zoomOut.exec();
````

````JavaScript
// Check if zoomOut is enabled
if (rv.commands.zoomOut.enabled()) {}
````

````JavaScript
// Check if zoomOut is checked
if (rv.commands.zoomOut.checked()) {}
````

