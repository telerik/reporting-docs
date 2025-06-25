---
title: GraphQLDataSource Wizard
page_title: GraphQLDataSource Wizard Tutorial
description: "Learn how to connect your GraphQL endpoints to Telerik reports through the Web Report Designer's dedicated wizard."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/graphqldatasource-wizard
tags: graphqldatasource,wizard
published: True
position: 5
---
<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# GraphQLDataSource Wizard Overview

The GraphQLDataSource Wizard allows you to create new or edit existing [GraphQLDataSource components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/graphqldatasource-component/overview%}) in the [Telerik Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}).

## Wizard Flow Summary

| Authentication Type | Steps Displayed |
|---------------------|-----------------|
| None                | Data Retrieval → GraphQL Query → Request Parameters → Design-Time Data → Preview |
| Basic               | + Basic Authentication |
| 2-Step              | + 2-Step Authentication + 2-Step Auth Parameters |

### Configure Data Retrieval: Part 1

Configure the HTTP request properties used to retrieve data from the GraphQL service.

!["Configure Data Retrieval" window of the GraphQLDataSource Wizard. Includes the configurable options "GraphQL Service URL", "Authentication Type", and "Response Encoding".](images/graphqldatasource/configure-data-retrieval-endpoint.png)

| Setting | Description |
| ------ | ------ |
|Service URL|The URL the request is sent to. Returns the data from the GraphQL service.|
|Authentication Type|The authentication type. Supported options are Basic and 2-Step authentication.|
|Response Encoding|Data encoding. The default is UTF-8.|

### Configure Data Retrieval: Part 2

Define the GraphQL query to be sent to the service. You can write a static query or use inline parameters to inject values dynamically.

!["Configure Data Retrieval" window of the GraphQLDataSource Wizard. Includes a text area for the GraphQL query.](images/graphqldatasource/configure-data-retrieval-query.png)

### Configure Request Parameters

Define parameters for the HTTP request. The supported types are Query, Header, Cookie, and Inline. The inline parameters are parameters that are used to replace parameter tokens (@param1) in the URL and the GraphQL Query fields with an expression result or static value. For more information about the different types of parameters, refer to [Using Parameters in the GraphQLDataSource]({%slug graphqldatasource-parameters%}).

!["Configure request parameters" window of the GraphQLDataSource Wizard. Includes 5 pre-configured parameters: a header parameter for the HTTP header "Authorization" and three inline parameters, named "data", "status", and "name".](images/graphqldatasource/configure-request-parameters.png)

### Configure Basic Authentication (Optional)

> This step is skipped unless you choose `Basic` authentication in the first step of the wizard.

Enter the credentials for basic authentication.

!["Configure Basic Authentication" window of the GraphQLDataSource Wizard. Includes two text boxes for the user name and the password.](images/graphqldatasource/configure-basic-authentication.png)

| Setting | Description |
| ------ | ------ |
|Username|The username used to authenticate. Required.|
|Password|The password used to authenticate.|

### Configure 2-Step Authentication (Optional)

>note This step is skipped unless you choose `2-Step` authentication in the first step of the wizard.

Set up the settings for the 2-step (Bearer) authentication.

!["Configure 2-step authentication" window of the GraphQLDataSource Wizard. Includes text boxes for "Login URL", "Login Body", "Username", "Password", "Token Path", "Logout URL", and "Logout Body".](images/graphqldatasource/configure-2-step-authentication.png)

| Setting | Description |
| ------ | ------ |
|Login URL|Returns the authentication token or session key. Required.|
|Login Body|The body of the login HTTP request.|
|Username|The username used to authenticate. Needed only if the Login URL uses Basic Authentication.|
|Password|The password used to authenticate.|
|Token Path|A regular expression to retrieve the authentication or session key from the response.|
|Logout URL|Called if the resource features a lockout for too many sessions.|
|Logout Body|The body of the logout HTTP request.|

### Configure Authentication Parameters (Optional)

>note This step is skipped unless you choose `2-Step` authentication in the first step of the wizard.

Specify parameters for the authentication HTTP request. The supported types are Query, Header, Cookie, and Inline, like in the [Configure Request Parameters step](#configure-request-parameters).

!["Configure authentication parameters" window of the GraphQLDataSource Wizard. Features a grid showcasing the current parameters, as well as a "plus" icon for adding new ones.](images/graphqldatasource/configure-2-step-authentication.png)

### Choose Design-Time Data

Choose the source of design-time data (used, for example, to display available data source fields in the [Edit Expression dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%})). The available options are:

* **Use real data while designing the report** – HTTP requests are sent to the GraphQL service during design time to retrieve the data.
* **Upload JSON file** – Use an external JSON file for the data. The URI can be relative or absolute.
* **Use JSON inline as hard-coded data while designing the report** - Use a hard-coded JSON string.

!["Choose design-time data" window of the GraphQLDataSource Wizard. Includes three buttons with the options "Use real data while designing the report", "Upload JSON file", and "Use JSON inline as hard-coded data while designing the report". The default one is "Use real data while designing the report".](images/graphqldatasource/choose-design-time-data.png)

>tip Use an external JSON file or hard-coded data if the GraphQLDataSource component relies on a token that needs to be updated dynamically through report parameters. Report parameters can be used only at runtime.

### Preview Data Source Results

Preview the data returned based on the current configuration. Optionally, specify a JSONPath expression to filter the result.

!["Preview data source results" window of the GraphQLDataSource Wizard. On the left, there is a "Preview" button, responsible for displaying the data, along with the GraphQL query configured in step 2 of the wizard. On the right, there is a text box allowing to configure the JSONPath data selector to further filter the result. Below is the JSON result from the GraphQL query.](images/graphqldatasource/preview-data-source-results.png)

| Setting | Description |
| ------ | ------ |
|Data Selector|The [JSONPath](https://www.newtonsoft.com/json/help/html/QueryJsonSelectTokenJsonPath.htm) expression string used to query the data. For more information, refer to [How to Use JSONPath to filter JSON data]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/graphqldatasource-component/how-to-use-jsonpath-to-filter-json-data%}).|

## See Also

* [GraphQLDataSource Component Overview]({%slug graphqldatasource%})
* [Using JSONPath to Filter JSON data]({%slug graphqldatasource-filter-json-data%})
* [Using Parameters with GraphQLDataSource]({%slug graphqldatasource-parameters%})
