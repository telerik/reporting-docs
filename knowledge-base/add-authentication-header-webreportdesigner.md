---
title: Adding Authentication Header to WebReportDesigner
description: Learn how to add an Authentication header to the WebReportDesigner to secure your reports.
type: how-to
page_title: How to Secure WebReportDesigner with Authentication Headers
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

When using the WebReportDesigner in a Blazor WebAssembly application, it's crucial to secure the communication between the client and server. A common approach is to add an authentication header to each request made by the WebReportDesigner. This KB article also answers the following questions:
- How can I secure my WebReportDesigner in Blazor Wasm?
- What are the steps to add an Authentication header in Blazor Wasm for Telerik Reporting?
- How to modify fetch API for adding Authorization header in WebReportDesigner?

## Solution

To add an Authentication header to all requests made by the WebReportDesigner in a Blazor WebAssembly application, modify the global fetch API. This ensures that every request includes the Authorization header with a bearer token. Follow these steps:

1. Retrieve the authentication token from your authentication provider. This token will be used in the Authorization header.

2. Override the global `window.fetch` method to append the Authorization header to every request made by the application, including those by the WebReportDesigner.

3. Implement the fetch override as shown below:

    ```javascript
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
    ```

4. Ensure the authentication token (`authData.token`) is dynamically retrieved from your authentication provider.

By following these steps, each request made by the WebReportDesigner will include the Authentication header, securing your reports.

## Notes

- The provided code assumes you have a variable `authData` containing the authentication token. Adjust this part to match your authentication flow.
- Test the functionality thoroughly to ensure that the Authentication header is correctly added to all requests.

## See Also

- [WebReportDesigner Overview](https://docs.telerik.com/reporting/web-report-designer)
- [Fetch API on MDN](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
