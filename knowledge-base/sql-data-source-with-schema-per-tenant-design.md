---
title: Configure SqlDataSource to use database with schema-per-tenant design
description: SQL data source with bindings to utilize different schema for each user according to report parameter
type: how-to
page_title: Set SQL query to use user-based schema
slug: sql-data-source-with-schema-per-tenant-design
position: 
tags: 
ticketid: 1349183
res_type: kb
---

## Environment
<table>
</table>


## Description
The database feeding the report with data may use a schema-per-tenant design, i.e. a new schema will be added every time a new user is set up. The query for fetching the data will differ only in its 'schema' part. Here is how to avoid creating a data source for each schema/user.

## Solution
1\. Declare the SqlDataSource that should use 'schema-per-tenant'. Set its 'ConnectionString'. Note that this can be done [Dynamically through a report parameter](https://docs.telerik.com/reporting/knowledge-base/how-to-pass-connectionstring-to-report-dynamically-through-report-parameter). Assign the DataSource to the corresponding [Data item](https://docs.telerik.com/reporting/data-items).  

2\. Declare a Report Parameter (i.e. 'Schema') to provide the name of the user schema.  

3\. Use the [Bindings](https://docs.telerik.com/reporting/expressions-bindings) property of the Data item to provide the _SelectCommand_ property :  
  

```XML
Property path                 |   Expression

DataSource.SelectCommand      |   = Format("SELECT {0}.[Production].[Product].[Name],
                              |       {0}.[Production].[Product].[ProductNumber],
                              |       {0}.[Production].[Product].[ListPrice],
                              |       {0}.[Production].[Product].[StandardCost]
                              |     FROM {0}.[Production].[Product]", Parameters.Schema.Value)
```
  
The _DataSource.SelectCommand_ property is \*not\* listed in the dropdown and must be typed manually.  
The sample code uses the _Format_ [Text function](https://docs.telerik.com/reporting/expressions-text-functions) to integrate the schema in the query string. 

You may provide also the entire _SelectCommand_ as a value taken from a Report parameter :

```XML
Property path                 |   Expression

DataSource.SelectCommand      |   = Parameters.Query.Value
```
## See Also
[Dynamically through a report parameter](https://docs.telerik.com/reporting/knowledge-base/how-to-pass-connectionstring-to-report-dynamically-through-report-parameter)
