---
title: Overview
page_title: Options of the HTML5 Report Viewer
description: Options of the HTML5 Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/overview
tags: overview,properties
published: True
reportingArea: HTML5
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
</style>

# Options of the HTML5 Report Viewer

| Property | Description |
| ------ | ------ |
| [authenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/authenticationtoken%})|If provided, a Bearer token will be set in the Authorization header for requests to the REST service.|
| [checkedButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/checkedbuttonclass%})|A class used for checked state buttons.|
| [disabledButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/disabledbuttonclass%})|A class used for disabled state buttons.|
| [documentMapAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/documentmapareaposition%})|The position of the document map area. See {@link DocumentMapAreaPositions}.|
| [documentMapVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/documentmapvisible%})|Determines whether the viewer's document map is displayed if any bookmark is defined.|
| [enableAccessibility]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/enableaccessibility%})|Enables accessibility features.|
| [id]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/id%})|Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used.|
| [initialPageAreaImageUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/initialpageareaimageurl%})|The image URL for the PageArea background image.|
| [keepClientAlive]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/keepclientalive%})|Determines whether the client will be kept alive.|
| [pageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/pagemode%})|The page mode. See {@link PageModes}.|
| [parameterEditors]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/parametereditors%})|Allows the user to define array of custom editors for the report parameters.|
| [parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/parameters%})|Allows the user to define parameter options for the report parameters. Properties: editors (object).|
| [parametersAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/parametersareaposition%})|The position of the parameters area. See {@link ParametersAreaPositions}.|
| [parametersAreaVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/parametersareavisible%})|Determines whether the viewer's parameters area is displayed if any parameter editor exists.|
| [persistSession]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/persistsession%})|Sets whether the viewer’s client session is persisted between page refreshes.|
| [printMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/printmode%})|The print mode. See {@link PrintModes}.|
| [reportServer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/reportserver%})|Configuration for Telerik Report Server. Report Server for .NET supports Token (getPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (url only, if enabled on server). Properties: url (string, required), getPersonalAccessToken (function, optional, Report Server for .NET only), username (string, optional), password (string, optional).|
| [reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/reportsource%})|The report source configuration.|
| [scale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/scale%})|The zoom scale (1.0 = 100%).|
| [scaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/scalemode%})|The scale mode. See {@link ScaleModes}.|
| [searchMetadataOnDemand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/searchmetadataondemand%})|Determines whether the search metadata will be delivered on demand (true) or by default (false).|
| [selector]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/selector%})|A selector used in conjunction with the data- attributes.|
| [sendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/sendemail%})|Email sending options. Properties: enabled (bool), from (string), to (string), cc (string), subject (string), body (string), format (string).|
| [serviceUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/serviceurl%})|The URL of the REST service serving reports. Required if reportServer is not provided.|
| [templateUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/templateurl%})|URL for a custom viewer template.|
| [viewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/viewmode%})|The view mode. See {@link ViewModes}.|
