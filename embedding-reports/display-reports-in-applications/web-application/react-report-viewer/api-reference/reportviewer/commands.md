---
title: Commands
page_title: Commands of the React Report Viewer
description: Complete list of commands available in the React Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands
tags: commands
published: True
reportingArea: React
position: 5
---

# Commands of the React Report Viewer

## export

Exports the report. Pass the rendering extension name to exec() (e.g., "PDF", "XLSX", "CSV", "DOCX").

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Export the report as PDF
reportViewerRef.current.commands.export.exec("PDF");
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.export.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.export.checked();
````


## goToFirstPage

Goes to the first page of the report.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Navigate to the first page
reportViewerRef.current.commands.goToFirstPage.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.goToFirstPage.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.goToFirstPage.checked();
````


## goToLastPage

Goes to the last page of the report.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Navigate to the last page
reportViewerRef.current.commands.goToLastPage.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.goToLastPage.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.goToLastPage.checked();
````


## goToNextPage

Goes to the next page of the report.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Navigate to the next page
reportViewerRef.current.commands.goToNextPage.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.goToNextPage.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.goToNextPage.checked();
````


## goToPage

Goes to a specific page of the report. Pass the page number to exec().

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Navigate to page 5
reportViewerRef.current.commands.goToPage.exec(5);
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.goToPage.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.goToPage.checked();
````


## goToPrevPage

Goes to the previous page of the report.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Navigate to the previous page
reportViewerRef.current.commands.goToPrevPage.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.goToPrevPage.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.goToPrevPage.checked();
````


## historyBack

Goes back to the previously rendered report from history.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Navigate back to the previous report in history
reportViewerRef.current.commands.historyBack.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.historyBack.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.historyBack.checked();
````


## historyForward

Goes forward to the next rendered report from history.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Navigate forward to the next report in history
reportViewerRef.current.commands.historyForward.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.historyForward.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.historyForward.checked();
````


## print

Triggers the report printing.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Print the current report
reportViewerRef.current.commands.print.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.print.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.print.checked();
````


## refresh

Refreshes the report.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Refresh the current report
reportViewerRef.current.commands.refresh.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.refresh.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.refresh.checked();
````


## stopRendering

Stops the rendering of the current report.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Stop the current report rendering
reportViewerRef.current.commands.stopRendering.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.stopRendering.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.stopRendering.checked();
````


## toggleAiPromptDialog

Shows or hides the AI prompt dialog.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Toggle the AI prompt dialog visibility
reportViewerRef.current.commands.toggleAiPromptDialog.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.toggleAiPromptDialog.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked (true when AI prompt dialog is visible)
const isChecked = reportViewerRef.current.commands.toggleAiPromptDialog.checked();
````


## toggleDocumentMap

Shows or hides the document map.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Toggle the document map visibility
reportViewerRef.current.commands.toggleDocumentMap.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.toggleDocumentMap.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked (true when document map is visible)
const isChecked = reportViewerRef.current.commands.toggleDocumentMap.checked();
````


## toggleParametersArea

Shows or hides the parameters area.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Toggle the parameters area visibility
reportViewerRef.current.commands.toggleParametersArea.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.toggleParametersArea.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked (true when parameters area is visible)
const isChecked = reportViewerRef.current.commands.toggleParametersArea.checked();
````


## togglePrintPreview

Toggles between Print Preview and Interactive view modes.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Toggle between Print Preview and Interactive modes
reportViewerRef.current.commands.togglePrintPreview.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.togglePrintPreview.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked (true when in Print Preview mode)
const isChecked = reportViewerRef.current.commands.togglePrintPreview.checked();
````


## toggleSearchDialog

Shows or hides the search dialog.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Toggle the search dialog visibility
reportViewerRef.current.commands.toggleSearchDialog.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.toggleSearchDialog.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked (true when search dialog is visible)
const isChecked = reportViewerRef.current.commands.toggleSearchDialog.checked();
````


## toggleSendEmailDialog

Shows or hides the send email dialog.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Toggle the send email dialog visibility
reportViewerRef.current.commands.toggleSendEmailDialog.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.toggleSendEmailDialog.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked (true when send email dialog is visible)
const isChecked = reportViewerRef.current.commands.toggleSendEmailDialog.checked();
````


## toggleZoomMode

Cycles the zoom mode of the report between FIT_PAGE_WIDTH, FIT_PAGE, and SPECIFIC.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Cycle to the next zoom mode
reportViewerRef.current.commands.toggleZoomMode.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.toggleZoomMode.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.toggleZoomMode.checked();
````


## zoom

Zooms to a specified ratio. Pass the zoom ratio to exec() (e.g., 1.5 for 150%).

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Zoom to 150%
reportViewerRef.current.commands.zoom.exec(1.5);
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.zoom.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.zoom.checked();
````


## zoomIn

Zooms in on the report.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Zoom in on the report
reportViewerRef.current.commands.zoomIn.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.zoomIn.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.zoomIn.checked();
````


## zoomOut

Zooms out of the report.

### Example

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Zoom out of the report
reportViewerRef.current.commands.zoomOut.exec();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is enabled
const isEnabled = reportViewerRef.current.commands.zoomOut.enabled();
````

````JavaScript
// Assume reportViewerRef = useRef(null) and pass it to the component ref prop.
// Check if the command is checked
const isChecked = reportViewerRef.current.commands.zoomOut.checked();
````

