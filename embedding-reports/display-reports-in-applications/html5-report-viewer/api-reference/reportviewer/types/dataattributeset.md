---
title: DataAttributeSet
page_title: DataAttributeSet Type
description: "Describes the available data attributes that can be used to control the Report Viewer from HTML elements. They are executed by adding data-command and data-target-report-viewer attributes to HTML elements."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/dataattributeset
published: True
reportingArea: HTML5
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }
</style>

# The `DataAttributeSet` type of the HTML5 Report Viewer

Describes the available data attributes that can be used to control the Report Viewer from HTML elements. They are executed by adding data-command and data-target-report-viewer attributes to HTML elements.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| historyBack | `Object` | Go back to the previously rendered report |
| historyForward | `Object` | Go forward to the next rendered report |
| stopRendering | `Object` | Stop the report rendering |
| refresh | `Object` | Refresh the report |
| goToFirstPage | `Object` | Go to the first page of the report |
| goToPrevPage | `Object` | Go to the previous page of the report |
| goToNextPage | `Object` | Go to the next page of the report |
| goToLastPage | `Object` | Go to the last page of the report |
| togglePrintPreview | `Object` | Toggle between Print Preview and Interactive modes |
| export | `Object` | Export the report (requires data-command-parameter for format) requires a data-command-parameter specifying the export format (e.g., PDF, XLSX, DOCX, etc.). |
| print | `Object` | Print the report |
| toggleDocumentMap | `Object` | Show or hide the document map |
| toggleParametersArea | `Object` | Show or hide the parameters area |
| zoomIn | `Object` | Zoom in the report |
| zoomOut | `Object` | Zoom out the report |
| toggleZoomMode | `Object` | Change the zoom mode of the report |
| toggleSearchDialog | `Object` | Show or hide the search dialog |
| toggleSendEmailDialog | `Object` | Show or hide the send email dialog |
| toggleAiPromptDialog | `Object` | Show or hide the AI prompt dialog |

