---
title: Overview
page_title: Options of the React Report Viewer
description: Options of the React Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/overview
tags: overview,properties
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

# Options of the React Report Viewer

| Property | Description |
| ------ | ------ |
| [authenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/authenticationtoken%})|If provided, a Bearer token will be set in the Authorization header for every request to the REST service.|
| [checkedButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/checkedbuttonclass%})|A class used in conjunction with the data- attributes. Whenever a command is in the checked state this class will be added to the respective button.|
| [disabledButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/disabledbuttonclass%})|A class used in conjunction with the data- attributes. Whenever a command is in the disabled state this class will be added to the respective button.|
| [documentMapAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/documentmapareaposition%})|Specifies where the Document Map should be displayed. Available values: "RIGHT", "LEFT". Default value is "LEFT".|
| [documentMapVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/documentmapvisible%})|Determines whether the viewer's document map is displayed if any bookmark is defined.|
| [enableAccessibility]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/enableaccessibility%})|Determines whether the viewer should provide support for accessibility features. Default value is false.|
| [id]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/id%})|Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used (if such is set). The id of the ReportViewer is used to identify the client session of the viewer when persistSession is enabled (true).|
| [initialPageAreaImageUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/initialpageareaimageurl%})|The image URL for the PageArea background image. Used only when the parameter values are missing or invalid. The image should be in PNG, GIF, or JPG file format.|
| [keepClientAlive]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/keepclientalive%})|Determines whether the client will be kept alive. Default value is true.|
| [pageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/pagemode%})|Sets if the report is displayed in Single page or Continuous scroll mode. Available values: "SINGLE_PAGE" (only one page loaded), "CONTINUOUS_SCROLL" (multiple pages loaded). Default value is "CONTINUOUS_SCROLL".|
| [parameterEditors]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/parametereditors%})|Allows the user to define custom editors for the report parameters.|
| [parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/parameters%})|Allows the user to define parameter options for the report parameters.|
| [parametersAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/parametersareaposition%})|Specifies where the Parameters Area should be displayed. Available values: "RIGHT", "TOP", "LEFT", "BOTTOM". Default value is "RIGHT".|
| [parametersAreaVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/parametersareavisible%})|Determines whether the viewer's parameters area is displayed if any parameter editor exists.|
| [persistSession]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/persistsession%})|Sets whether the viewer's client session is persisted between page refreshes (e.g., postback). The session is stored in the browser's sessionStorage and is available for the duration of the page session. Default value is false.|
| [printMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/printmode%})|Specifies how the viewer should print reports. Available values: "AUTO_SELECT" (automatically decide based on browser), "FORCE_PDF_FILE" (download as PDF file), "FORCE_PDF_PLUGIN" (use PDF plug-in). Default value is "AUTO_SELECT".|
| [reportServer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/reportserver%})|Sets the configuration details for Telerik Report Server. Required if serviceUrl is not provided.|
| [reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/reportsource%})|Sets the report and initial report parameter values for the viewer to be displayed.|
| [scale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/scale%})|Sets the scale factor for the report pages. The scale takes effect when scaleMode is set to "SPECIFIC". Default value is 1.0 (100%).|
| [scaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/scalemode%})|Sets how the report pages are scaled. Available options: "FIT_PAGE_WIDTH" (pages scaled to fit entire width), "FIT_PAGE" (pages scaled to fit entire page), "SPECIFIC" (pages scaled with scale value). Default value is "FIT_PAGE".|
| [searchMetadataOnDemand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/searchmetadataondemand%})|Determines whether the search metadata will be delivered on demand (true) or by default (false). Default value is false.|
| [selector]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/selector%})|A selector used in conjunction with the data- attributes. Whenever a command is attached to an element outside of the report viewer via the data-attributes this selector must be provided.|
| [sendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/sendemail%})|Configuration for the Send Mail Message feature.|
| [serviceUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/serviceurl%})|Sets the address of the Report REST Service. Required if reportServer is not provided.|
| [templateUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/templateurl%})|Sets the address of the html page that contains the viewer templates. If omitted, the default template will be downloaded from the REST service. Note: Internally mapped to trvTemplateUrl property.|
| [viewerContainerStyle]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/viewercontainerstyle%})|CSS styles to apply to the viewer container div.|
| [viewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/viewmode%})|Sets if the report is displayed in interactive mode or in print preview. Available values: "INTERACTIVE" (enables drill-down interactivity), "PRINT_PREVIEW" (paged according to page settings). Default value is "INTERACTIVE".|
