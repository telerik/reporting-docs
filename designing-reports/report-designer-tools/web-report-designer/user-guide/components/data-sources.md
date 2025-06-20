---
title: Data Sources
page_title: Web Report Designer offers different Data Source Components that can be used in the reports.
description: Explore the available Data Source report components offered by the Web Report Designer.
slug: web-report-designer-user-guide-components-data-sources
tags: web, report, design, report, components, data, source
published: True
position: 7
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

/* table, th, td {
	border: 1px solid;
} */
/* table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 80%;
}  */
 

</style>

# Data Sources

The **Web Report Designer** offers a **Data Sources** section inside the **Components** tray allowing the end-user to fetch data from different storages: 

<div style="display: flex; align-items: flex-start; gap: 24px;">
  <img alt="><" title="Components tray" src="images/wrd-components-tray-data-sources.png" style="max-width:240px; height:auto; border:1px solid lightgrey;" />
  <table style="width:100%; height:100%;">
    <tr>
      <th style="width:30%">Data Source</th><th>Description</th>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview">SQL Data Source</a></td>
      <td>Enables data items to display data located in a relational database, including <a href="https://www.microsoft.com/en-us/sql-server">Microsoft SQL Server</a> and Oracle databases, as well as OLE DB and ODBC data sources, using little or no code.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview">CSV Data Source</a></td>
      <td>Enables data items to display data located in a CSV document, including files (*.csv, *.tsv, *.txt, and others), inline string or stream.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview">Web Service Data Source</a></td>
      <td>Enables data items to display data located on a service in <a href="https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/how-to-use-jsonpath-to-filter-json-data">JSON format</a>.</td>
    </tr>
  <tr>
      <td><a href="https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/graphqldatasource-component/overview">GraphQL Data Source</a></td>
      <td>Enables data items to retrieve data in JSON format from a GraphQL service.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component">JSON Data Source</a></td>
      <td>Enables data items to display JSON data located in a local file or saved directly into the report.</td>
    </tr>
    <tr>
      <td><a href="https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview">Object Data Source</a></td>
      <td>Provides a way to bind the Data Report Items to a middle-tier business object.</td>
    </tr>
  </table>
</div>

## SQL Data Source

By clicking the `SQL Data Source` item in the **Components** tray, the [SQL Data Source configuration wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/sqldatasource-wizard%}) appears allowing you to use either an *existing* connection or build a *new* one by providing a `connection string` to connect to the database and define the SQL statement or the stored procedure to retrieve the data:

>caption Existing vs New SQL Connection

![Existing vs New SQL Connection ><](images/wrd-components-tray-data-sources-sql-choose-data-connection.png)   

If you want to skip any further fine-tuning, click the `Finish` button to confirm the configured connection and close the wizard. Otherwise, you can continue with the wizard steps and apply the desired settings:

|Wizard step|Description|
|----|----|
|1. Choose data connection|Select an existing or build a new data connection.|
|2. Data connection options|Specify whether to use the connection as shared or embed it in the report.|
|3. Configure data source command|Specify a *select statement* or a *stored procedure* to retrieve data from the data source. The [Query Builder]({%slug web-report-designer-query-builder%}) helps you create queries to retrieve data from a relational database for a SqlDataSource component.|
|4. Configure data source parameters|This step occurs if you select *Stored procedure* in step 3. Specify a database type and a default value or an expression to evaluate for each data source parameter.|
|5. Configure design time parameters|Specify an appropriate design time value for each data source parameter.|
|6. Preview data source results|Preview the result set returned by this data source|

>caption Select and Preview SQL Data

![Select and Preview SQL Data ><](images/wrd-components-tray-data-sources-sql-select-and-preview.png) 

## CSV Data Source

By clicking the `CSV Data Source` item in the **Components** tray, the [CSV Data Source configuration wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/csvdatasource-wizard%}) appears allowing you to use either an existing or a new CSV file, or use inline CSV text with the data: 

>caption Upload a CSV Source vs Inline

![CSV Data Connection ><](images/wrd-components-tray-data-sources-csv-choose-data-connection.png)    

If you want to skip any further fine-tuning, click the `Finish` button to confirm the configured connection and close the wizard. Otherwise, you can continue with the wizard steps and apply the desired settings:

|Wizard step|Description|
|----|----|
|1. Choose a CSV source|Select an existing or select a new CSV file or use inline CSV data.|
|2. Modify your CSV file|If you upload a CSV file, you can make the selected file inline and modify its content.|
|3. Configure CSV Data Source - Separators|Specify the column/row separators and whether the data include headers or not.|
|4. Configure CSV Data Source - Escape Format|Specifies the [escape format]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/csvdatasource-escape-formats%}).|
|5. Map Columns to Type|Specify the columns types as by default they come in string type. |
|6. Preview data source results|Preview the result set returned by this data source.|

>caption Map Column Types and Preview CSV Data

![Map Column Types and Preview CSV Data ><](images/wrd-components-tray-data-sources-csv-map-column-types-and-preview.png) 

## Web Service Data Source

By clicking the `Web Service Data Source` item in the **Components** tray, the [Web Service Data Source configuration wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/csvdatasource-wizard%}) appears allowing you to create new or edit an existing  [WebServiceDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}) component.

>caption Setup Web Service Data Source

![Web Service Data Source ><](images/wrd-components-tray-data-sources-web-service-data-source.png)

If you want to skip the further settings steps, click the `Finish` button to confirm the configured connection and close the wizard. Otherwise, you can continue with the wizard steps and apply the desired settings. Note that some of the wizard steps may be skipped according to the user's selection and settings.

|Wizard step|Description|
|----|----|
|1. Configure Data Retrieval|Setup the properties of the HTTP request which will retrieve data from the web service.|
|2. Configure request parameters|Specify name, type, default value or expression, and design time value for data source parameters.|
|3. Configure Basic Authentication|Specify *Username* & *password* (relevant for *Basic authentication*).|
|4. Configure 2-step authentication|Specify the 2-step (Bearer) authentication settings.|
|5. Configure authentication parameters|Specify name, type, default value or expression, and design time value for data source parameters (relevant for *2-Step authentication*).|
|6. Choose design-time data|Specify whether to:</br>- *Use real data while designing the report*</br>- *Upload JSON file*</br>- *Use JSON inline as hard-coded data while designing the report*.|
|7. Preview data source results|Preview the result set returned by this data source.|

>caption Preview Data from the Web Service Data Source

![Preview Web Service Data ><](images/wrd-components-tray-data-sources-preview-web-service-data-source.png)

## GraphQL Data Source

By clicking the `GraphQL Data Source` item in the **Components** tray, the [GraphQL Data Source configuration wizard]({%slug desktop-graphqldatasource-wizard%}) appears allowing you to create new or edit an existing [GraphQLDataSource]({%slug graphqldatasource%}) component.

The wizard allows you to setup one of the options:
* Setup the properties of the HTTP request which will retrieve data from the GraphQL service. 
* Reference an external data file.
* Use inline data string containing the data (required if Service URL or external data file is not set).

You are expected to see the following steps:

1. Setup the **GraphQL Service URL** (e.g. https://buybutton.store/graphql) 

1. Provide the **Query** for data retrieval:  

    ```SQL
    query paginateProducts($cursor: String) {
      site {
      products(first: 5, after: $cursor) {
          pageInfo {
            endCursor
            hasNextPage
          }
          edges {
            node {
              entityId
              name
            }
          }
        }
      }
    }
    ```

    >caption Setup GraphQL Service URL and Configure the Query

    ![GraphQL Data Source><](images/wrd-components-tray-data-sources-graphql-data-source-http-request-query.png)  

1. Specify the parameter name, type, value and design time value for each data source parameter. The value can be a default value or an expression to evaluate. The design-time value should be a constant value. This is necessary for retrieving the data source schema correctly at design time:

    ![GraphQL Request Parameters><](images/wrd-components-tray-data-sources-graphql-request-parameters.png)   

1. Configure Authentication settings (occurs only if an authentication method is selected in the first step): Transmits credentials as username/password pairs, encoded using base64.

1. As a final step, you can **Preview** the result:

    ![GraphQL Preview Data><](images/wrd-components-tray-data-sources-graphql-preview-data.png)   

## JSON Data Source 

By clicking the `JSON Data Source` item in the **Components** tray, the [JSON Data Source configuration wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/jsondatasource-wizard%}) appears allowing you to use a new or an existing JSON file, or directly enter inline JSON content:

>caption Upload a new JSON file vs Inline JSON data

![Inline JSON Data Source ><](images/wrd-components-tray-data-sources-inline-vs-upload-file-json-data-source.png)

>note The **Data selector** (e.g. `$.store.book[?(@.price<10)]`) is a [JSONPath](https://goessner.net/articles/JsonPath/) string which will be used to query the data.

|Wizard step|Description|
|----|----|
|1. Choose a JSON source|Specify the JSON source that should be retrieved.|
|2. Modify your JSON file|You can make the selected file inline and modify its content (relevant when using a JSON file in step 1).|
|3. Preview data source results|Preview the result set returned by this data source.|

## Object Data Source

By clicking the `Object Data Source` item in the **Components** tray, the [Object Data Source configuration wizard]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/objectdatasource-wizard%}) appears allowing you to use a business object or any other class (that was already defined) for data retrieval in the report:

* Select Business object 

  ![Object Data Source ><](images/wrd-components-tray-data-sources-object-data-source.png) 

* Specify the Data member

   ![Object Data Source ><](images/wrd-components-tray-data-sources-object-data-source-data-member.png)

|Wizard step|Description|
|----|----|
|1. Choose a business object|The selected business object type's assembly-qualified name will be stored in the data source component's DataSource property.|
|2. Choose a data member|The business object instance will be created using its default constructor. You have the option to specify a different constructor or a data member (method or property) that will return the data.|
|3. Configure data source parameters|Specify default value or expression and design-time value for data source parameters.|
|4. Preview data source results|Preview the result set returned by this data source.|

>caption Preview Data 

![Preview Data from Object Data Source ><](images/wrd-components-tray-data-sources-object-data-source-preview.png)  

## Data Source General Settings

Once a DataSource component is configured, it can be modified later by selecting it in the **Explorer** tab:

![GraphQL Data Source Settings><](images/wrd-components-tray-data-sources-graphql-data-source-selected-in-explorer.png)    

On the right-hand side the **General** settings (dependent on the specific Data Source item) are loaded and the user can further modify them:

![GraphQL Data Source Settings><](images/wrd-components-tray-data-sources-graphql-data-source-settings.png)   

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Using Parameters with the GraphQLDataSource Component]({%slug graphqldatasource-parameters%})


