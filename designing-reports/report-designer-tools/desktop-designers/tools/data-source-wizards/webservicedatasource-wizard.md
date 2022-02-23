---
title: WebServiceDataSource Wizard
page_title: WebServiceDataSource Wizard 
description: WebServiceDataSource Wizard
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/webservicedatasource-wizard
tags: webservicedatasource,wizard
published: True
position: 4
---
<style>
table th:first-of-type {
    width: 25%;
}
table th:nth-of-type(2) {
    width: 75%;
}
</style>

# WebServiceDataSource Wizard

The __Web Service Data Source Wizard__ allows you to create a new or edit an existing __WebServiceDataSource__ component based on several settings. After the wizard appears you have to perform the following steps: 

1. __Configure data retrieval__ Setup the properties of the HTTP request which will retrieve data from the web service: 

  ![Web Service Data Source Request](images/DataSources/WebServiceDataSourceRequest.png)


  | Setting | Description |
  | ------ | ------ |
  |Service URL|The URL the request is sent to. Returns the data from the web service. Required.|
  |Authentication Type|The authentication type. We support Basic and 2-step authentications.|
  |Encoding|Data encoding. Default is UTF-8.|
  |Method|HTTP request method. GET and POST are the supported methods.|
  |Body|The body of the POST method. Applicable only for POST HTTP request method.|
  |Data Selector|The [JSONPath](https://www.newtonsoft.com/json/help/html/QueryJsonSelectTokenJsonPath.htm) expression string which will be used to query the data. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data%}).|


  And/or enter data inline: 

  ![Web Service Data Source Inline File](images/DataSources/WebServiceDataSourceInlineFile.png)


  | Setting | Description |
  | ------ | ------ |
  |Source|The inline data string containing the data. Required if Service URL or external data file is not set.|
  |Data Selector|The  [JSONPath](https://www.newtonsoft.com/json/help/html/QueryJsonSelectTokenJsonPath.htm) expression string which will be used to query the JSON data. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data%}).|


  And/or reference an external data file:               

  ![Web Service Data Source External File](images/DataSources/WebServiceDataSourceExternalFile.png)


  | Setting | Description |
  | ------ | ------ |
  |Source|The external data file containing the data. The URI to the file might be relative or absolute. Required if Service URL or inline data string is not set.|
  |Data Selector|The [JSONPath](https://www.newtonsoft.com/json/help/html/QueryJsonSelectTokenJsonPath.htm) expression string which will be used to query the JSON data. For more information please refer to [How to Use JSONPath to filter JSON data]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data%}).|


1. __Configure request parameters__ The parameters of the HTTP request to be applied. The supported types are Query, Header, Cookie, and Inline. The inline parameters are parameters that are used to replace parameter tokens (@param1) in the URL and the Body fields with the expression result or static value. 

  ![Google Books Params](images/DataSources/GoogleBooksParams.png)

1. __Basic Authentication__ 

  ![Web Service Data Source Basic Authentication](images/DataSources/WebServiceDataSourceBasicAuthentication.png)


  | Setting | Description |
  | ------ | ------ |
  |Username|The username used to authenticate. Required.|
  |Password|The password used to authenticate.|


1. __2-Step Authentication__ 

  ![Web Service Data Source 2 Step Auth](images/DataSources/WebServiceDataSource2StepAuth.png)


  | Setting | Description |
  | ------ | ------ |
  |Login URL|This URL returns the authentication token or session key that allows you to access the API. Required.|
  |Username|The username used to authenticate. The username and password are needed only when the Login URL uses Basic Authentication to retrieve the authentication token/key.|
  |Password|The password used to authenticate.|
  |Response|Specifies the type of the expected response from the Login URL. JSON and plain text are supported.|
  |Login Method|Specifies the HTTP request method to be used.|
  |Token Path|This is a regular expression that allows to retrieve the authentication or session key from the response received via the Login URL. For example, when the Login URL returns a JSON response containing the authentication token in the form: *{"access_token":"cbm9W3MeTeVPuO5CIq_DTvG5KbzydpRQ","token_type":"bearer","expires_in":1799,"userName":"demouser",".issued":"Tue, 15 May 2018 08:42:32 GMT",".expires":"Tue, 15 May 2018 09:12:32 GMT"}* the token path regular expression to retrieve the token would be: *(?:"access_token":")(.*?)(?:")* |
  |Logout URL|This URL is called if the resource features a lockout for having too many sessions open. Refresh the report and try again after successfully logging out.|
  |Logout Method|Specifies the HTTP request method used for the Logout URL.|
  |Body|The body of the login HTTP request. Applicable only for POST HTTP request method.|


1. __2-Step Authentication Parameters__ The parameters of the HTTP request to be applied. The supported types are Query, Header, Cookie and Inline. The inline parameters are parameters that are used to replace parameter tokens (@param1) in the URL and the Body fields with the expression result or static value. 


# See Also

* [Overview]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%})
