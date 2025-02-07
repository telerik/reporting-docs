---
title: Using Parameters
page_title: Using Parameters with GraphQLDataSource explained with examples
description: "Learn how to configure and use Inline, Query, Header, and Cookie Parameters with the GraphQLDataSource component in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/graphqldatasource-component/using-parameters-with-the-graphqldatasource-component
tags: using,parameters,with,the,graphqldatasource,component,inline,query,header,cookie,fiddler,configure
published: True
position: 3
previous_url: /graphqldatasource-service-data-source-using-parameters
---

# Using Parameters with the GraphQLDataSource Component

The `GraphQLDataSource` component can request data in JSON format from a running GraphQL service. It requires the base URL of the service specified in the `Service URL` property, as well as a GraphQL query in the `Query` property. The GraphQLDataSource can take parameters. The supported data source parameter types are:

## Inline Parameters

The values of this parameter type replace the corresponding part of the `Service URL`, and can be included in the the GraphQL query of the request.

### Using Inline Parameters in Service Url

In the [GraphQLDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/graphqldatasource-wizard%}), the Service URL can be provided as __constantUrl__, for example:

![The ServiceUrl of the GraphQL configured with an inline parameter](images/GraphQLDataSourceUrl.png)

In the next step of the Wizard it is necessary to set the run-time and the design-time values for the parameter:

![Set the Inline parameter value in the WebServiceDataSource Wizard](images/GraphQLDataSourceInlineParameterEndpoint.png)

The entire Service URL can also be set to a GraphQLDataSource parameter, for example to `@serviceUrl`. This allows for larger flexibility in using different end-points of a GraphQL Service, or even different GraphQL Services for the same data item.

### Using Inline Parameters in the GraphQL Query

The single-value parameter should be surrounded by quotation marks. The multi-value parameter is provided as it is. For example, in the next set-up, `@name` is a single-value parameter and `@surname` is a multi-value parameter:

![The ServiceUrl of the WebServiceDataSource configured as a constant and inline parameters provided in the body of the request](images/WebServiceDataSourceUrlBodyx750.png)

It is necessary to provide an additional Header "Content-Type" with the value "application/json". Generally, the Header Names are case-insensitive. The 'Content-Type' header that is needed for the POST requests is case-sensitive.

The multi-value parameter run-time and design-time values should be surrounded in square brackets to indicate an array:

![Set the Inline parameter values and the required header parameter Content-Type in the WebServiceDataSource Wizard](images/WebServiceDataSourceInlineParameterBodyx750.png)

The final request performed by the WebServiceDataSource component with the design-time values as seen in Fiddler:

![The request performed by the WebServiceDataSource component with the design-time Inline parameter values from the body and the Header parameter Content-Type as seen in Fiddler](images/WebServiceDataSourceInlineParameterRequestUrlBodyx750.png)

## Query Parameters

The query type parameters will be automatically concatenated to the Service URL. The final URL will be in the format `serviceUrl?queryParameterName1=value1&queryParameterName2=value2&...`.

For example, in a Web Api project to call the Action `GetWithQueryParameters(int id, string category)` the default service URL will be `http://localhost:50160/api/data/GetWithQueryParameters`. The images display how to set the query parameters in the Web Service Data Source Wizard of the Report Designer:

![Set the Query parameter values in the WebServiceDataSource Wizard](images/WebServiceDataSourceQueryParameterx750.png)

and how will the generated final URL for the design-time parameter values look in Fiddler:

![The request performed by the WebServiceDataSource component with the design-time Query parameter values as seen in Fiddler](images/WebServiceDataSourceQueryParameterRequestUrlx750.png)

## Header Parameters

The parameter will be included as a `Header` in the request with Header Name the name of the parameter, and Header Value the value of the parameter. A setup in the Web Service Data Source Wizard like:

![Set the Header parameter value in the WebServiceDataSource Wizard](images/WebServiceDataSourceHeaderParameterx750.png)

will result in a request with the Header named `headerParameter` and value `MyHeader` for its design-time values:

![The request performed by the WebServiceDataSource component with the design-time Header parameter value as seen in Fiddler](images/WebServiceDataSourceHeaderParameterRequestUrlx750.png)

## Cookie Parameters

The parameter will be included as a Header `Cookie` in the request. For example, the parameter setup in the Web Service Data Source Wizard as:

![Set the Cookie parameter value in the WebServiceDataSource Wizard](images/WebServiceDataSourceCookieParameterx750.png) 

for its design-time values will result in a request with a `Cookie` Header as captured by Fiddler:

![The request performed by the WebServiceDataSource component with the design-time Cookie parameter value as seen in Fiddler](images/WebServiceDataSourceCookieParameterRequestUrlx750.png)

## See Also

* [Using Parameters with Data Source objects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects%})
