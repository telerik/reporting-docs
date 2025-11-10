---
title: GraphQLDataSource Wizard
page_title: GraphQLDataSource Wizard at a Glance
description: "Learn more about the GraphQLDataSource Wizard of the Telerik Reporting Desktop Designers and how to configure the GraphQLDataSource properties with it."
slug: desktop-graphqldatasource-wizard
tags: graphqldatasource,wizard
published: True
position: 50
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

# GraphQLDataSource Wizard of the Report Designer

The __GraphQL Data Source Wizard__ allows you to create new or edit existing __GraphQLDataSource__ components based on several settings. After the wizard appears, you have to perform the following steps:

1. __Configure data retrieval__: Setup the properties of the HTTP request that will retrieve data from the GraphQL service: 

	!["Use GraphQL Request" tab of the "Configure data retrieval" window of the GraphQLDataSource Wizard. Includes the configurable options "GraphQL Service URL", "Authentication Type", and "Encoding".](images/DataSources/graphql/data-retrieval-graphql-request.png)

	| Setting | Description |
	| ------ | ------ |
	|Service URL|The URL the request is sent to. Returns the data from the GraphQL service. Required.|
	|Authentication Type|The authentication type. The supported options are Basic and 2-step authentications.|
	|Encoding|Data encoding. The default is UTF-8.|

	And/or enter data inline:

	!["Use Inline Data String" tab of the "Configure data retrieval" window of the GraphQLDataSource Wizard. Includes a text area to configure the inline string containing the data.](images/DataSources/graphql/data-retrieval-inline-data-string.png)

	| Setting | Description |
	| ------ | ------ |
	|Source|The inline data string containing the data. Required if the Service URL or external data file is not set.|

	And/or reference an external data file:

	!["Use External Data File" tab of the "Configure data retrieval" window of the GraphQLDataSource Wizard. Allows to select a path for the file and configure whether the path is absolute or relative.](images/DataSources/graphql/data-retrieval-external-data-file.png)

	| Setting | Description |
	| ------ | ------ |
	|Source|The external data file containing the data. The URI to the file might be relative or absolute. Required if the Service URL or inline data string is not set.|

1. __Configure GraphQL Query__: Allows you to define the actual GraphQL query that will be sent to the service. You can write a static query or use inline parameters to dynamically inject values into the query string.

	!["Configure GraphQL Query" window of the GraphQLDataSource Wizard. Includes a pre-configured query that utilizes inline parameters.](images/DataSources/graphql/configure-graphql-query.png)

1. __Configure request parameters__: The parameters of the HTTP request to be applied. The supported types are Query, Header, Cookie, and Inline. The inline parameters are parameters that are used to replace parameter tokens (@param1) in the URL and the GraphQL Query fields with an expression result or static value. For more information about the different types of parameters, refer to [Using Parameters in the GraphQLDataSource]({%slug graphqldatasource-parameters%}).

	!["Configure request parameters" window of the GraphQLDataSource Wizard. Includes 5 pre-configured parameters: a header parameter for the HTTP header "Authorization" and four inline parameters, named "data", "status", "name", and "endpoint".](images/DataSources/graphql/configure-request-parameters.png)

1. __Basic Authentication__

	!["Configure basic authentication" window of the GraphQLDataSource Wizard. Includes two text boxes for the user name and the password.](images/DataSources/graphql/configure-basic-authentication.png)

	| Setting | Description |
	| ------ | ------ |
	|Username|The username used to authenticate. Required.|
	|Password|The password used to authenticate.|

1. __2-Step Authentication__

	!["Configure 2-step authentication" window of the GraphQLDataSource Wizard. Includes text boxes for "Login URL", "Username", "Password", "Body", "Token Path", "Logout URL", and "Logout Body".](images/DataSources/graphql/configure-2-step-authentication.png)

	| Setting | Description |
	| ------ | ------ |
	|Login URL|This URL returns the authentication token or session key that allows you to access the API. Required.|
	|Username|The username used to authenticate. The username and password are needed only when the Login URL uses Basic Authentication to retrieve the authentication token/key.|
	|Password|The password used to authenticate.|
    |Body|The body of the login HTTP request.|
	|Token Path|This is a regular expression that allows to retrieve the authentication or session key from the response received via the Login URL. For example, when the Login URL returns a JSON response containing the authentication token in the form: *{"access_token":"cbm9W3MeTeVPuO5CIq_DTvG5KbzydpRQ","token_type":"bearer","expires_in":1799,"userName":"demouser",".issued":"Tue, 15 May 2018 08:42:32 GMT",".expires":"Tue, 15 May 2018 09:12:32 GMT"}* the token path regular expression to retrieve the token would be: *(?:"access_token":")(.*?)(?:")* |
	|Logout URL|This URL is called if the resource features a lockout for having too many sessions open. Refresh the report and try again after successfully logging out.|
	|Logout Body|The body of the logout HTTP request.|


1. __2-Step Authentication Parameters__: The parameters of the HTTP request to be applied. The supported types are Query, Header, Cookie, and Inline. The inline parameters are parameters that are used to replace parameter tokens (@param1) in the URL and the Body fields with an expression result or static value.

1. __Preview data source results__: Allows you to preview the result from the configurations you have applied so far.

	!["Preview data source results" window of the GraphQLDataSource Wizard. On the left, there is a "Download" button, responsible for displaying the data. On the right, there is a text box allowing you to configure the JSONPath data selector to further filter the result.](images/DataSources/graphql/preview-data-source-results.png)

	| Setting | Description |
	| ------ | ------ |
	|Data Selector|The [JSONPath](https://www.newtonsoft.com/json/help/html/QueryJsonSelectTokenJsonPath.htm) expression string, which will be used to query the data. For more information, refer to [How to Use JSONPath to filter JSON data]({%slug graphqldatasource-filter-json-data%}).|


## See Also

* [GraphQLDataSource Component Overview]({%slug graphqldatasource%})
* [Using JSONPath to Filter JSON data]({%slug graphqldatasource-filter-json-data%})
* [Using Parameters with GraphQLDataSource]({%slug graphqldatasource-parameters%})
