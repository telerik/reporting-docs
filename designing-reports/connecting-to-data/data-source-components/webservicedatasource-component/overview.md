---
title: Overview
page_title: WebServiceDataSource Component at a Glance
description: "Learn more about the WebServiceDataSource Component in Telerik Reporting and how to use it in your reports."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview
tags: overview
published: True
position: 0
previous_url: /webservicedatasource-component, /designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/
reportingArea: General
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# WebServiceDataSource Component Overview

The [WebServiceDataSource](/api/Telerik.Reporting.WebServiceDataSource) component enables data items to display data located on a service in JSON format while using no code. Using WebServiceDataSource allows you to access and display data in a report without connecting and authenticating manually to the service and parsing the JSON. At design time the component can be configured using the [WebServiceDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/webservicedatasource-wizard%}). At run time the WebServiceDataSource automatically connects, authenticates to the service, and parses the retrieved JSON data.

The web service may omit properties with empty values in the data response to save bandwidth. The result is that not all of the objects have the same list of properties. Due to this, no errors will be shown in the report if an undefined data field name is used inside an expression.

The data field names for this data source are **case-sensitive**. It is required to use the correct data field names in expressions, otherwise, no data will be shown.

> To preview reports that use the WebServiceDataSource component it is required to reference the `Telerik.Reporting.WebServiceDataSource` DLL or the corresponding NuGet package in your application.

## Configuring the Component

**Web Service Request Configuration:**

| Setting              | Description                                                                                                                                                                                                                                                                                                                                                                                     |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Service URL          | The URL the request is sent to. Returns the data from the web service. Required if inline data string or external data file is not set.<br/>**The service URL should not contain any query parameters. Query parameters can be configured in the next wizard page.**                                                                                                                            |
| IgnoreResponseErrors | When set to _true_ treats any response errors as if no data is returned from the web service. The default is _false_.                                                                                                                                                                                                                                                                           |
| Data Selector        | The [JSONPath](https://www.rfc-editor.org/rfc/rfc9535) expression string which will be used to query the JSON data returned from the web service. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data%}). |
| Authentication       | The authentication type. Basic and 2-step (Bearer) authentication is supported. A 2-step (Bearer) authentication mode can be used for the OAuth 2.0 authorization framework. Additional information is available in the following sections.                                                                                                                                                     |
| Encoding             | Data encoding. The default is UTF-8.                                                                                                                                                                                                                                                                                                                                                            |
| Method               | HTTP request method. GET and POST are the supported methods.                                                                                                                                                                                                                                                                                                                                    |
| Body                 | The body of the POST method. Applicable only for POST HTTP request method.                                                                                                                                                                                                                                                                                                                      |
| Parameters           | The parameters of the HTTP request to be applied. The supported types are Query, Header, Cookie, and Inline. The inline parameters are parameters that are used to replace parameter tokens (@param1) in the URL and the Body fields with the expression result or static value.                                                                                                                |

**Inline Data String Configuration:**

| Setting       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Source        | The inline data string containing the data. Required if Service URL or external data file is not set.<br/>Setting both Service URL and inline data string at the same time will reduce network load during design time as no HTTP requests will be made while the report is designed. Instead, the inline data will be used for any design-time operations. The Service URL will be used only at run-time (this includes data source preview and report preview operations). |
| Data Selector | The [JSONPath](https://www.rfc-editor.org/rfc/rfc9535) expression string which will be used to query the JSON data. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data%}).                                                                                                            |

**External Data File Configuration:**

| Setting       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Source        | The external data file containing the data. The URI to the file might be relative or absolute. Required if Service URL or inline data string is not set.<br/>Setting both Service URL and external data file at the same time will reduce network load during design time as no HTTP requests will be made while the report is designed. Instead, the external data file will be used for any design-time operations. The Service URL will be used only at run-time (this includes data source preview and report preview operations). |
| Data Selector | The [JSONPath](https://www.rfc-editor.org/rfc/rfc9535) expression string which will be used to query the JSON data. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data%}).                                                                                                                                                                      |

## Basic Authentication Settings

Below are listed the available settings for Basic authentication. The authentication scheme is defined in [The 'Basic' HTTP Authentication Scheme (RFC 7617)](https://tools.ietf.org/html/rfc7617). This scheme transmits credentials as username/password pairs, encoded using base64.

| Setting  | Description                                  |
| -------- | -------------------------------------------- |
| Username | The username used to authenticate. Required. |
| Password | The password used to authenticate.           |

## 2-Step (Bearer) Authentication Settings

Below are listed the available settings for 2-step (Bearer) authentication. The Bearer authentication scheme is defined in [The OAuth 2.0 Authorization Framework: Bearer Token Usage (RFC 6750)](https://tools.ietf.org/html/rfc6750). Bearer tokens can be used to access OAuth 2.0-protected resources. The WebServiceDataSource component supports the following OAuth 2.0 authorization mechanisms out-of-the-box:

- [Password Grant](https://www.oauth.com/oauth2-servers/access-tokens/password-grant/)
- [Client Credentials](https://www.oauth.com/oauth2-servers/access-tokens/client-credentials/)

> [Authorization Code Request](https://www.oauth.com/oauth2-servers/access-tokens/authorization-code-request/) is not supported since it requires user interaction in a browser window, which is not applicable to all Reporting use cases.

| Setting       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Login URL     | This URL returns the authentication token or session key that allows you to access the API. Required. The URL should not contain any query parameters. Query parameters can be configured in the next wizard page.                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Username      | The username used to authenticate. Optional. The username and password are needed only when the Login URL uses Basic Authentication to retrieve the authentication token/key.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Password      | The password used to authenticate. Optional. The username and password are needed only when the Login URL uses Basic Authentication to retrieve the authentication token/key.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Response      | Specifies the type of the expected response from the Login URL. JSON and plain text are supported.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| Login Method  | Specifies the HTTP request method to be used.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Body          | The body of the login HTTP request. Applicable only for POST HTTP request method. Needed for some authentication schemes such as OAuth 2.0 Password Grant.<br/>Example: _grant_type=password&username=user@example.com&password=12345_                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Token Path    | This is a **regular expression** that allows retrieving the authentication or session key from the response received via the Login URL. For example, when the Login URL returns a JSON response containing the authentication token in the form:<br/>_{"access_token":"cbm9W3MeTeVPuO5CIq_DTvG5KbzydpRQ","token_type":"bearer","expires_in":1799,"userName":"demouser",".issued":"Tue, 15 May 2018 08:42:32 GMT",".expires":"Tue, 15 May 2018 09:12:32 GMT"}_<br/>the token path regular expression to retrieve the token would be `(?:"access_token"\s*:\s*")([^"]*)(?:")*`<br/> **Leaving this field empty will include the entire login-response as a token.** |
| Logout URL    | This URL is called if the resource features a lockout for having too many sessions open. Refresh the report and try again after successfully logging out.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Logout Method | Specifies the HTTP request method used for the Logout URL.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Parameters    | The parameters of the HTTP request to be applied. The supported types are Query, Header, Cookie, and Inline. The inline parameters are parameters that are used to replace parameter tokens (@param1) in the URL and the Body fields with the expression result or static value.                                                                                                                                                                                                                                                                                                                                                                                  |

## Cookie-Based Authentication

It is possible to leverage the 2-step Authentication mechanism above to retrieve a session cookie from the server which will authenticate subsequent requests. In this scenario first, a request will be sent to the server for authentication purposes and the response should contain the generated cookie for the authenticated user. If the cookie domain and path match the Web Service Data Source Service URL the cookie will be sent in the following data retrieval request.

> When using cookie-based authentication, consider using '()' as the value for the `Token Path` when configuring the 2-step authentication. This will ensure that no token is found in the login response and no token will be included in the subsequent requests.

## Supported developer platforms

- .NET Framework 4.6.2 and above
- .NET {{site.mindotnetversion}} and above
- .NET Standard 2.0 and above

## See Also

- [WebServiceDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/webservicedatasource-wizard%})
