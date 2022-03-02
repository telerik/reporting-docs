---
title: Web Report Designer Initialization
page_title: Web Report Designer Initialization
description: Web Report Designer Initialization
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
| __serviceUrl__ | *string*, *required*; Sets the URL of the service which will provide for the web report designer client (relative or absolute);|
| __report__ | *string*, *required*; Sets the report that will be initially opened when the web report designer is started;|
| __persistSession__ | *boolean*, *optional*;  Sets a value indicating whether the designer's client state will be persisted between the page refreshes/postbacks. The state is stored in the browser's sessionStorage and is available for the duration of the page session.
| __keepClientAlive__ | *boolean*, *optional*; Sets a value indicating whether the client will be kept alive. When set to true a request will be sent to the server to stop the client from expiring, determined by the **ClientSessionTimeout** server configuration
  When set to false, the client will be left to be expire;|
| __promptOnDiscardingModifiedReport__ | *boolean*, *optional*. Sets a value indicating whether a browser prompt will be displayed when a report is modified and the user attempts to leave the page.|
| __toolboxArea__ | *json*, *optional*. Sets the Toolbox area options.|
| __propertiesArea__ | *json*, *optional*. Sets the Properties area options.|

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
