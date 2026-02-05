---
title: Overview
page_title: GraphQLDataSource Component at a Glance
description: "Learn how to use the GraphQLDataSource Component in Telerik Reporting to fetch data from GraphQL endpoints and display it in your reports."
slug: graphqldatasource
published: True
position: 0
reportingArea: General
---

<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 80%;
}
</style>

# GraphQLDataSource Component

The data source is introduced in [2025 Q1 (19.0.25.211)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2025-q1-19-0-25-211).

The [GraphQLDataSource](/api/Telerik.Reporting.GraphQLDataSource) component enables data items to retrieve data in JSON format from a GraphQL service. At design time, the component can be configured using the [GraphQLDataSource Wizard]({%slug desktop-graphqldatasource-wizard%}). At run time, the GraphQLDataSource component automatically issues the GraphQL request, applies authentication tokens if needed, and retrieves the data.

The data field names for this data source are **case-sensitive**. It is required to use the correct data field names in expressions, otherwise, no data will be shown.

> To preview reports that use the GraphQLDataSource component, it is required to reference the `Telerik.Reporting.GraphQL.Client.dll` library or the `Telerik.Reporting.GraphQLDataSource` NuGet package in your application.

## Configuring the Component

**GraphQL Request Configuration:**

| Setting              | Description                                                                                                                                                                                                                                                                                                        |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Service URL          | The URL the request is sent to. Returns the data from the GraphQL service. Required if the inline data string or external data file is not set.<br/>**The service URL should not contain any query parameters. Query parameters can be configured in the next wizard page.**                                       |
| IgnoreResponseErrors | When set to _true_, treats any response errors as if no data is returned from the GraphQL service. The default is _false_.                                                                                                                                                                                         |
| Data Selector        | The [JSONPath](https://www.rfc-editor.org/rfc/rfc9535) expression string which will be used to query the JSON data returned from the GraphQL service. For more information, refer to [How to Use JSONPath to filter JSON data]({%slug graphqldatasource-filter-json-data%}).                                       |
| Authentication       | The authentication type. Basic and 2-step (Bearer) authentication is supported. A 2-step (Bearer) authentication mode can be used for the OAuth 2.0 authorization framework. Additional information is available in the following sections.                                                                        |
| Encoding             | Data encoding. The default is UTF-8.                                                                                                                                                                                                                                                                               |
| Query                | The GraphQL query to be executed against the GraphQL service. This query should be written in the GraphQL query language and must conform to the schema defined by the GraphQL service. For more information on writing GraphQL queries, refer to the [GraphQL documentation](https://graphql.org/learn/queries/). |
| Parameters           | The parameters of the HTTP request to be applied. The supported types are Query, Header, Cookie, and Inline. The inline parameters are parameters that are used to replace parameter tokens (@param1) in the URL and the GraphQL query with an expression result or static value.                                  |

**Inline Data String Configuration:**

| Setting       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Source        | The inline data string containing the data. Required if Service URL or external data file is not set.<br/>Setting both Service URL and inline data string at the same time will reduce network load during design time as no HTTP requests will be made while the report is designed. Instead, the inline data will be used for any design-time operations. The Service URL will be used only at run-time (this includes data source preview and report preview operations). |
| Data Selector | The [JSONPath](https://www.rfc-editor.org/rfc/rfc9535) expression string which will be used to query the JSON data returned from the GraphQL service. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug graphqldatasource-filter-json-data%}).                                                                                                                                                                                           |

**External Data File Configuration:**

| Setting       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Source        | The external data file containing the data. The URI to the file might be relative or absolute. Required if Service URL or inline data string is not set.<br/>Setting both Service URL and external data file at the same time will reduce network load during design time as no HTTP requests will be made while the report is designed. Instead, the external data file will be used for any design-time operations. The Service URL will be used only at run-time (this includes data source preview and report preview operations). |
| Data Selector | The [JSONPath](https://www.rfc-editor.org/rfc/rfc9535) expression string which will be used to query the JSON data returned from the GraphQL service. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug graphqldatasource-filter-json-data%}).                                                                                                                                                                                                                                                     |

## Basic Authentication Settings

Below are listed the available settings for Basic authentication. The authentication scheme is defined in [The 'Basic' HTTP Authentication Scheme (RFC 7617)](https://tools.ietf.org/html/rfc7617). This scheme transmits credentials as username/password pairs, encoded using base64.

| Setting  | Description                                  |
| -------- | -------------------------------------------- |
| Username | The username used to authenticate. Required. |
| Password | The password used to authenticate.           |

## 2-Step (Bearer) Authentication Settings

Below are listed the available settings for 2-step (Bearer) authentication. The Bearer authentication scheme is defined in [The OAuth 2.0 Authorization Framework: Bearer Token Usage (RFC 6750)](https://tools.ietf.org/html/rfc6750). Bearer tokens can be used to access OAuth 2.0-protected resources. The GraphQLDataSource component supports the following OAuth 2.0 authorization mechanisms out of the box:

- [Password Grant](https://www.oauth.com/oauth2-servers/access-tokens/password-grant/)
- [Client Credentials](https://www.oauth.com/oauth2-servers/access-tokens/client-credentials/)

> [Authorization Code Request](https://www.oauth.com/oauth2-servers/access-tokens/authorization-code-request/) is not supported since it requires user interaction in a browser window, which is not applicable to all Reporting use cases.

| Setting     | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Login URL   | This URL returns the authentication token or session key that allows you to access the API. Required.                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| Username    | The username used to authenticate. The username and password are needed only when the Login URL uses Basic Authentication to retrieve the authentication token/key.                                                                                                                                                                                                                                                                                                                                                                                        |
| Password    | The password used to authenticate.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Body        | The body of the login HTTP request.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Token Path  | This is a regular expression that allows to retrieve the authentication or session key from the response received via the Login URL. For example, when the Login URL returns a JSON response containing the authentication token in the form: _{"access_token":"cbm9W3MeTeVPuO5CIq_DTvG5KbzydpRQ","token_type":"bearer","expires_in":1799,"userName":"demouser",".issued":"Tue, 15 May 2018 08:42:32 GMT",".expires":"Tue, 15 May 2018 09:12:32 GMT"}_ the token path regular expression to retrieve the token would be: _(?:"access_token":")(._?)(?:")\* |
| Logout URL  | This URL is called if the resource features a lockout for having too many sessions open. Refresh the report and try again after successfully logging out.                                                                                                                                                                                                                                                                                                                                                                                                  |
| Logout Body | The body of the logout HTTP request.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

## Cookie-Based Authentication

It is possible to leverage the 2-step Authentication mechanism above to retrieve a session cookie from the server which will authenticate subsequent requests. In this scenario first, a request will be sent to the server for authentication purposes and the response should contain the generated cookie for the authenticated user. If the cookie domain and path match the GraphQL Data Source Service URL the cookie will be sent in the following data retrieval request.

> When using cookie-based authentication, consider using '()' as the value for the `Token Path` when configuring the 2-step authentication. This will ensure that no token is found in the login response and no token will be included in the subsequent requests.

## Supported developer platforms

- .NET Framework 4.6.2 and above
- .NET {{site.mindotnetversion}} and above
- .NET Standard 2.0 and above

## See Also

- [GraphQLDataSource Wizard]({%slug desktop-graphqldatasource-wizard%})
- [Using JSONPath to Filter JSON data]({%slug graphqldatasource-filter-json-data%})
- [Using Parameters with GraphQLDataSource]({%slug graphqldatasource-parameters%})
