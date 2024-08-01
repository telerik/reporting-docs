---
title: Adding Authorization Header to the Web Report Designer Requests
description: "Learn how to add an Authorization header to the requests made by the Web Report Designer for better security."
type: how-to
page_title: How to Secure the Web Report Designer Requests with an Authorization Header
slug: add-authentication-header-webreportdesigner
tags: progress, telerik, reporting, webreportdesigner, authentication
res_type: kb
ticketid: 1658948
---

## Environment

| Product | Progress® Telerik® Reporting |
| --- | --- |
| Version | 18.1.24.709 |

## Description

When using the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}), it's crucial to secure the communication between the client and server. A common approach is to add an `Authorization` header to each request made by the Web Report Designer widget.

The Web Report Designer, currently, does not expose a property for passing the authentication token, thus the workaround that may be used is overriding the [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) used internally by the widget, and add the necessary header(s) to the requests manually.

## Workaround

````JavaScript
const fetchOverride = window.fetch;

window.fetch = function (url, args) {
    // Retrieve authData from your authentication provider
    const authData = { token: "your_token_here" };

    if (!args) {
        args = {
            headers: {
                Authorization: "Bearer " + authData.token,
            },
        };
    } else if (!args.headers || !args.headers.entries) {
        args.headers = {
            ...args.headers ?? {},
            Authorization: "Bearer " + authData.token,
        };
    } else if (args.headers.entries) {
        args.headers.append("Authorization", "Bearer " + authData.token);
    }

    return fetchOverride(url, args);
};
````

## Notes

The above workaround will supply the requests made by the Web Report Designer with the `Authorization` header. When the report is previewed, the designer will load the internal [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) which does not use the [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) for making requests, instead, it uses the [jQuery.ajax()](https://api.jquery.com/jQuery.ajax/) function and thus the requests made by the report viewer will not be affected by the fetch override function.

The **HTML5 Report Viewer** exposes a dedicated property for setting a token to be passed with its requests - [authenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}), which may be set in the [viewerInitializing]({%slug telerikreporting/report-designer-tools/web-report-designer/web-report-designer-initialization%}#viewerinitializing) event of the Web Report Designer:

````JavaScript
$(document).ready(function () {
    $("#webReportDesigner").telerik_WebReportDesigner({
        persistSession: false,
        toolboxArea: {
            layout: "list"
        },
        serviceUrl: "api/reportdesigner/",
        report: "Dashboard.trdp",
        // design/preview
        startMode: "design",
        viewerInitializing: onViewerInitializing
    }).data("telerik_WebReportDesigner");
});

function onViewerInitializing(e, args) {
    // e: jQuery event;
    // args: IViewerPreInitEventArgs ->
    //      reportViewerOptions: report viewer's options. All viewer's options available.

    args.reportViewerOptions.authenticationToken = token;
}
````

## See Also

- [Web Report Designer Overview](https://docs.telerik.com/reporting/web-report-designer)
- [Web Report Designer Initialization]({%slug telerikreporting/report-designer-tools/web-report-designer/web-report-designer-initialization%})
- [Fetch API on MDN](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
