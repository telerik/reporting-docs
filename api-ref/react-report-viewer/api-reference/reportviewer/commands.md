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

Exports the report, using the respective rendering extension name. Accepts a rendering extension name as parameter: exec("PDF"), exec("XLSX"), etc.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.export.exec('PDF')}>Export PDF</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.export.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.export.checked();
````


## goToFirstPage

Goes to the first page of the report.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.goToFirstPage.exec()}>First Page</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.goToFirstPage.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.goToFirstPage.checked();
````


## goToLastPage

Goes to the last page of the report.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.goToLastPage.exec()}>Last Page</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.goToLastPage.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.goToLastPage.checked();
````


## goToNextPage

Goes to the next page of the report.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.goToNextPage.exec()}>Next</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.goToNextPage.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.goToNextPage.checked();
````


## goToPage

Goes to a specific page of the report. Accepts a page number as parameter: exec(pageNumber).

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.goToPage.exec(5)}>Go to Page 5</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.goToPage.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.goToPage.checked();
````


## goToPrevPage

Goes to the previous page of the report.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.goToPrevPage.exec()}>Previous</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.goToPrevPage.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.goToPrevPage.checked();
````


## historyBack

Goes back to the previously rendered report from history.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.historyBack.exec()}>Back</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.historyBack.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.historyBack.checked();
````


## historyForward

Goes forward to the next rendered report from history.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.historyForward.exec()}>Forward</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.historyForward.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.historyForward.checked();
````


## print

Triggers the report printing.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.print.exec()}>Print</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.print.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.print.checked();
````


## refresh

Refreshes the report.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.refresh.exec()}>Refresh</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.refresh.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.refresh.checked();
````


## stopRendering

Stops the rendering of the current report.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.stopRendering.exec()}>Stop Rendering</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.stopRendering.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.stopRendering.checked();
````


## toggleAiPromptDialog

Shows or hides the AI prompt dialog.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.toggleAiPromptDialog.exec()}>Toggle AI Prompt</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.toggleAiPromptDialog.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.toggleAiPromptDialog.checked();
````


## toggleDocumentMap

Shows or hides the document map.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.toggleDocumentMap.exec()}>Toggle Document Map</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.toggleDocumentMap.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.toggleDocumentMap.checked();
````


## toggleParametersArea

Shows or hides the parameters area.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.toggleParametersArea.exec()}>Toggle Parameters</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.toggleParametersArea.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.toggleParametersArea.checked();
````


## togglePrintPreview

Toggles between Print Preview and Interactive view modes.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.togglePrintPreview.exec()}>Toggle Print Preview</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.togglePrintPreview.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.togglePrintPreview.checked();
````


## toggleSearchDialog

Shows or hides the search dialog.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.toggleSearchDialog.exec()}>Toggle Search</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.toggleSearchDialog.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.toggleSearchDialog.checked();
````


## toggleSendEmailDialog

Shows or hides the send email dialog.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.toggleSendEmailDialog.exec()}>Toggle Send Email</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.toggleSendEmailDialog.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.toggleSendEmailDialog.checked();
````


## toggleSideMenu

Shows or hides the side menu.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.toggleSideMenu.exec()}>Toggle Side Menu</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.toggleSideMenu.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.toggleSideMenu.checked();
````


## toggleZoomMode

Changes the zoom mode of the report.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.toggleZoomMode.exec()}>Toggle Zoom Mode</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.toggleZoomMode.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.toggleZoomMode.checked();
````


## zoom

Zoom with a specified ratio. Accepts a zoom ratio as parameter: exec(1.5).

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.zoom.exec(1.5)}>Zoom 150%</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.zoom.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.zoom.checked();
````


## zoomIn

Zoom-in the report.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.zoomIn.exec()}>Zoom In</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.zoomIn.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.zoomIn.checked();
````


## zoomOut

Zoom-out the report.

### Example

````JavaScript
// Execute the command
let viewer;
ReactDOM.render(
    <>
        <TelerikReportViewer />
        <button onClick={() => viewer.commands.zoomOut.exec()}>Zoom Out</button>
    </>
);
````

````JavaScript
// Check if the command is enabled
const isEnabled = viewer.commands.zoomOut.enabled();
````

````JavaScript
// Check if the command is checked
const isChecked = viewer.commands.zoomOut.checked();
````

