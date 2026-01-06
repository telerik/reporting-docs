---
title: Overview
page_title: Read-Only Properties of the Native Angular Report Viewer
description: Read-Only Properties of the Native Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/overview
tags: overview,properties
published: True
reportingArea: NativeAngular
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

# Read-Only Properties of the Native Angular Report Viewer

| Property | Description |
| ------ | ------ |
| [autoRunEnabled]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/autorunenabled%})|Gets whether the report's AutoRun setting is enabled.<br>true if the AutoRun setting is enabled, false otherwise.|
| [displayDocumentMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/displaydocumentmap%})|Gets whether the document map is displayed.<br>true if the document map is displayed, false otherwise.|
| [displayParameterArea]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/displayparameterarea%})|Gets whether the parameter area is displayed.<br>true if the parameter area is displayed, false otherwise.|
| [getDocumentMapNodes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/getdocumentmapnodes%})|Gets the current report's document map nodes if any.<br>an array of DocumentMapNode objects if any.|
| [getRenderingExtensions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/getrenderingextensions%})|Gets the current report's rendering extensions.<br>an array of RenderingExtension objects if any.|
| [hasLazyParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/haslazyparameters%})|Gets whether the current report has parameters that have AutoRefresh disabled.<br>true if at least one parameter has AutoRefresh disabled, false otherwise.|
| [isAiPromptWindowOpen]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/isaipromptwindowopen%})|Gets whether the AI prompt window is currently open.<br>true if the AI assistant dialog is visible, false otherwise.|
| [isDocumentMapAvailable]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/isdocumentmapavailable%})|Gets whether the document map is available for the current report.<br>True if the report has a document map, false otherwise.|
| [isInPrintViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/isinprintviewmode%})|Gets whether the viewer is in print preview mode.<br>true if the viewer is in print preview mode, false otherwise.|
| [isParametersSectionAvailable]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/isparameterssectionavailable%})|Gets whether the current report has visible parameters.<br>true if the report has visible parameters, false otherwise.|
| [isRenderingInProgress]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/isrenderinginprogress%})|Gets whether the current report is still being rendered.<br>true if the report rendering process is ongoing, false otherwise.|
| [isSearchWindowOpen]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/issearchwindowopen%})|Gets whether the search window is currently open.<br>True if the search dialog is visible, false otherwise.|
| [totalPages]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/totalpages%})|Gets the total number of pages in the current report.<br>The total page count of the rendered report.|
