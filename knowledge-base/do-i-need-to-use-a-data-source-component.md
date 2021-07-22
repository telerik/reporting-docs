---
title: Do I need to use a Data Source component?
description: Do I need to use a Data Source component?.
type: how-to
page_title: Do I need to use a Data Source component?
slug: do-i-need-to-use-a-data-source-component
res_type: kb
---

## Description
 
Do I need to use a [Data Source component](../connecting-to-data-data-source-components)?  
  
## Solution   
  
Reports are processed and rendered on the server machine.  
  
Data source components are a *declarative* way to specify how data can be retrieved. The reporting engine creates data objects and executes their data retrieval methods based on the data source component's settings.  
  
For example, the purpose of the *ObjectDataSource* component is to provide data to the report in a declarative manner. The *ObjectDataSource.DataSource property* should be the [assembly qualified name or Type](https://docs.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?redirectedfrom=MSDN&view=net-5.0#System_Type_AssemblyQualifiedName) of the data access layer (class), The Reporting engine will use *System.Reflection* to create an instance of the class by using its default constructor, and to execute its method specified by the *ObjectDataSource.DataMember property*.   
  
  
 Having the above into account:  

1. **Data source components are suitable:**
    - When data can be retrieved from the server in a declarative manner e.g. a **SQL** query, or a custom data access layer that gets data records;
    - In technology specific scenarios, where data can be modified by the user and you need to display the updated records in a report, our recommendation is to save the updated data on the server and to use a data source component. This approach allows to use reports from any type of project - desktop, web.
2. **Data source components are not required:**
    - When the data object is already created in code. You can directly set a [data item](../data-items)'s DataSource to the existing data object;
    - When [data items](../data-items) are using the same data. Each data item will execute its data retrieval method on its own, even if all data items are bound to the same data source component. In such case, you can reorganize the layout in order to benefit from data-binding approaches like [How to Databind to Collection Properties](./how-to-databind-to-collection-properties) and [Use DataObject as a datasource for nested data items (Table, List, Crosstab, Graph)](../data-items-how-to-use-data-object#use-dataobject-as-a-datasource-for-nested-data-items-table-list-crosstab-graph).
