---
title: Adding Authorization Header to the Web Report Designer Requests
description: "Learn how to add an Authorization header to the requests made by the Web Report Designer for better security."
type: how-to
page_title: How to Secure the Web Report Designer Requests with an Authozation Header
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


## See Also

- [Web Report Designer Overview](https://docs.telerik.com/reporting/web-report-designer)
- [Fetch API on MDN](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
