---
title: commands
page_title: commands property
description: "Commands object exposing various report viewer commands. Each command has exec(), enabled(), and checked() methods. The 'exec' method triggers the command execution, the 'enabled' method returns a boolean value indicating whether the command is in an enabled state, and the 'checked' method returns a boolean value indicating whether the command is in a checked state. List of available commands: - historyBack (no parameters): Goes back to the previously rendered report from history. - historyForward (no parameters): Goes forward to the previously rendered report from history. - refresh (no parameters): Refreshes the report. - goToFirstPage (no parameters): Goes to the first page of the report. - goToPrevPage (no parameters): Goes to the previous page of the report. - goToPage (page number): Goes to a specific page number (integer) of the report. - goToNextPage (no parameters): Goes to the next page of the report. - goToLastPage (no parameters): Goes to the last page of the report. - togglePrintPreview (no parameters): Toggles between Print Preview and Interactive view modes. - export (rendering extension name): Exports the report, using the respective rendering extension name. The available rendering extensions are: \"PDF\", \"CSV\", \"XLS\", \"XLSX\", \"PPTX\", \"RTF\", \"IMAGE\", \"MHTML\", \"DOCX\", and \"XPS\". - print (no parameters): Triggers the report printing. - toggleDocumentMap (no parameters): Shows or hides the document map. - toggleParametersArea (no parameters): Shows or hides the parameters area. - zoomIn (no parameters): Zoom-in the report. - zoomOut (no parameters): Zoom-out the report. - zoom (zoom ratio): Zoom with a specified ratio (float). - toggleZoomMode (no parameters): Changes the zoom mode of the report. - toggleSideMenu (no parameters): Shows or hides the side menu. - toggleSearchDialog (no parameters): Shows or hides the search dialog."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/read-only-properties/commands
published: True
reportingArea: AngularWrapper
---

# The `commands` read-only property of the Angular Report Viewer

Commands object exposing various report viewer commands.
Each command has exec(), enabled(), and checked() methods.
The 'exec' method triggers the command execution, the 'enabled' method returns a boolean value indicating whether the command is in an enabled state, and the 'checked' method returns a boolean value indicating whether the command is in a checked state.
List of available commands:

- historyBack (no parameters): Goes back to the previously rendered report from history.
- historyForward (no parameters): Goes forward to the previously rendered report from history.
- refresh (no parameters): Refreshes the report.
- goToFirstPage (no parameters): Goes to the first page of the report.
- goToPrevPage (no parameters): Goes to the previous page of the report.
- goToPage (page number): Goes to a specific page number (integer) of the report.
- goToNextPage (no parameters): Goes to the next page of the report.
- goToLastPage (no parameters): Goes to the last page of the report.
- togglePrintPreview (no parameters): Toggles between Print Preview and Interactive view modes.
- export (rendering extension name): Exports the report, using the respective rendering extension name. The available rendering extensions are: "PDF", "CSV", "XLS", "XLSX", "PPTX", "RTF", "IMAGE", "MHTML", "DOCX", and "XPS".
- print (no parameters): Triggers the report printing.
- toggleDocumentMap (no parameters): Shows or hides the document map.
- toggleParametersArea (no parameters): Shows or hides the parameters area.
- zoomIn (no parameters): Zoom-in the report.
- zoomOut (no parameters): Zoom-out the report.
- zoom (zoom ratio): Zoom with a specified ratio (float).
- toggleZoomMode (no parameters): Changes the zoom mode of the report.
- toggleSideMenu (no parameters): Shows or hides the side menu.
- toggleSearchDialog (no parameters): Shows or hides the search dialog.

## Type

`any`

## Examples

````typescript
viewer.commands.print.exec(); // Execute print command
viewer.commands.refresh.exec(); // Refresh report
viewer.commands.goToPage.exec(3); // Go to page 3
````

