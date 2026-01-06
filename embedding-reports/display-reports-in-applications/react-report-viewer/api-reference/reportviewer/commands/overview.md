---
title: Overview
page_title: Commands of the React Report Viewer
description: Commands of the React Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/overview
tags: overview,commands
published: True
reportingArea: React
position: 0
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# Commands of the React Report Viewer

| Command | Description |
| ------ | ------ |
| [export]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/export%})|Exports the report, using the respective rendering extension name. Accepts a rendering extension name as parameter: exec("PDF"), exec("XLSX"), etc.|
| [goToFirstPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotofirstpage%})|Goes to the first page of the report.|
| [goToLastPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotolastpage%})|Goes to the last page of the report.|
| [goToNextPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotonextpage%})|Goes to the next page of the report.|
| [goToPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotopage%})|Goes to a specific page of the report. Accepts a page number as parameter: exec(pageNumber).|
| [goToPrevPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/gotoprevpage%})|Goes to the previous page of the report.|
| [historyBack]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/historyback%})|Goes back to the previously rendered report from history.|
| [historyForward]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/historyforward%})|Goes forward to the next rendered report from history.|
| [print]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/print%})|Triggers the report printing.|
| [refresh]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/refresh%})|Refreshes the report.|
| [stopRendering]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/stoprendering%})|Stops the rendering of the current report.|
| [toggleAiPromptDialog]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/toggleaipromptdialog%})|Shows or hides the AI prompt dialog.|
| [toggleDocumentMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/toggledocumentmap%})|Shows or hides the document map.|
| [toggleParametersArea]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/toggleparametersarea%})|Shows or hides the parameters area.|
| [togglePrintPreview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/toggleprintpreview%})|Toggles between Print Preview and Interactive view modes.|
| [toggleSearchDialog]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/togglesearchdialog%})|Shows or hides the search dialog.|
| [toggleSendEmailDialog]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/togglesendemaildialog%})|Shows or hides the send email dialog.|
| [toggleSideMenu]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/togglesidemenu%})|Shows or hides the side menu.|
| [toggleZoomMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/togglezoommode%})|Changes the zoom mode of the report.|
| [zoom]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/zoom%})|Zoom with a specified ratio. Accepts a zoom ratio as parameter: exec(1.5).|
| [zoomIn]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/zoomin%})|Zoom-in the report.|
| [zoomOut]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/commands/zoomout%})|Zoom-out the report.|


