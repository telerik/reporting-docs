---
title: Web Report Designer Initialization
page_title: Web Report Designer Initialization
description: Web Report Designer Initialization Options
slug: telerikreporting/report-designer-tools/web-report-designer/web-report-designer-initialization
tags: report,webreportdesigner,initialization
published: True
position: 7
---
<style>
table th:first-of-type {
    width: 28%;
}
table th:nth-of-type(2) {
    width: 72%;
}
</style>

# Web Report Designer Initialization

The Telerik Web Report Designer is a jQuery plugin - __jQuery.fn.telerik_WebReportDesigner(options)__. Below is a list of all options available during initialization. 

## Options


| Parameter | Description |
| ------ | ------ |
| __id__ | *string*, *optional*; Sets the unique identifier of the WebReportDesigner instance;|
| __serviceUrl__ | *string*, *required*; Sets the URL (relative or absolute) which will provide the service for the web report designer client;|
| __report__ | *string*, *required*; Sets the report that will be initially opened when the web report designer is started;|
| __persistSession__ | *boolean*, *optional*;  Sets a value indicating whether the designer's client state will be persisted between the page refreshes/postbacks. The state is stored in the browser's sessionStorage and is available for the duration of the page session.
| __keepClientAlive__ | *boolean, optional*; Sets a value indicating whether the client will be kept alive. When set to true a request will be sent to the server to stop the client from expiring, determined by the ClientSessionTimeout server configuration. <br/> When set to false, the client will be left to expire;|
| __promptOnDiscardingModifiedReport__ | *boolean*, *optional*. Sets a value indicating whether a browser prompt will be displayed when a report is modified and the user attempts to leave the page.|
| __toolboxArea__ | *json*, *optional*. Sets the Toolbox area options.|
| __propertiesArea__ | *json*, *optional*. Sets the Properties area options.|
| __skipOnboarding__ | *boolean, optional*; Sets a value indicating whether the _Onboarding Guide_ should be skipped on startup. If not set or set to false, the Onboarding Guide will check whether it has been run before and if not, it will start after the designer surface has loaded. If the guide has been run before, nothing will happen.|

## Examples

To initialize the web report designer:
    
````js
$(document).ready(function () {
    $("#webReportDesigner").telerik_WebReportDesigner({
        toolboxArea: {
            layout: "list"
        },
        serviceUrl: "api/reportdesigner/",
        report: "Report Catalog.trdp"
    }).data("telerik_WebDesigner");
});
````


