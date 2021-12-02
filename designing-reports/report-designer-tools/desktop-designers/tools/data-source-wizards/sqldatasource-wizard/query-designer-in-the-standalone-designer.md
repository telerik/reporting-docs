---
title: Query Designer in the Standalone Designer
page_title: Query Designer in the Standalone Designer | for Telerik Reporting Documentation
description: Query Designer in the Standalone Designer
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/query-designer-in-the-standalone-designer
tags: query,designer,in,the,standalone,designer
published: True
position: 1
---

# Query Designer in the Standalone Designer



Standalone Report Designer provides both a graphical query designer and a text-based query designer to help you create queries         to retrieve data from a relational database for a SqlDataSource component.          The Query Designer support any ADO.NET/ODB/OLEDB data provider that provides working implementation          of GetSchema with COLUMN collection support.         Automatic relations functionaly require relational databases supported by          [Telerik Data Access](http://www.telerik.com/data-access) :       

*  [Microsoft SQL Server](http://docs.telerik.com/data-access/developers-guide/database-specifics/microsoft-sql-server/database-specifics-sql-overview) 

*  [Microsoft SQL Server Compact Edition](http://docs.telerik.com/data-access/developers-guide/database-specifics/database-specifics-sqlce-overview) 

*  [Microsoft SQL Azure](http://docs.telerik.com/data-access/developers-guide/database-specifics/microsoft-sql-azure/getting-started-root-quickstart-azure-overview) 

*  [Oracle](http://docs.telerik.com/data-access/developers-guide/database-specifics/oracle/database-specifics-oracle-overview) 

*  [MySql](http://docs.telerik.com/data-access/developers-guide/database-specifics/database-specifics-mysql-overview) 

*  [Advantage Database Server](http://docs.telerik.com/data-access/developers-guide/database-specifics/database-specifics-ads-overview) 

*  [SQL Anywhere](http://docs.telerik.com/data-access/developers-guide/database-specifics/sql-anywhere/database-specifics-sqlanywhere-voerview) 

*  [Firebird](http://docs.telerik.com/data-access/developers-guide/database-specifics/firebird/database-specifics-firebird-overview) 

*  [VistaDB](http://docs.telerik.com/data-access/developers-guide/database-specifics/vistadb/database-specifics-vistadb-overview) 

*  [SQLite](http://docs.telerik.com/data-access/developers-guide/database-specifics/sqlite/database-specifics-sqlite-overview) 

*  [PostgreSQL](http://docs.telerik.com/data-access/developers-guide/database-specifics/postgresql/database-specifics-postgresql-overview) 

>important Please note that Telerik Data Access is a discontinued product and its            [supported databases list](http://docs.telerik.com/data-access/developer-guide-integration-prerequisities#access-to-a-relational-database)            will not be appended. The versions of the supported database drivers will not be updated as well.         


## 

The following figure shows the graphical query designer.

  

  ![Sql Query Designer Form](images/DataSources/SqlQueryDesignerForm.png)

Use the graphical query designer to explore the database tables and views,           interactively build SQL SELECT statement and view the result for your query.           The select statement specifies the database tables,           views and columns from which to retrieve data for a [SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}).           If you choose multiple related tables, the query designer describes the relationship between sets of two tables.         

The following sections describe the function of each pane.         

* [Database View](#database-view-pane)               Displays a hierarchical view of tables and view that are organized by database schema.             

* [Selected Fields](#selected-fields-pane)               Displays the list of database field names from the selected items in the Database view pane.             

* [Relationships](#relationships-pane)               Displays a list of relationships that are inferred from the selected tables or views or the relationships that you created manually.             

* [Filters](#filters-pane)               Displays a list of filter criteria for tables or views.             

* [Data Preview](#data-preview-pane)               Displays sample data for the automatically generated query.             

### Database View Pane

The Database View pane displays the metadata for database objects that you have the permissions to view,               which is determined by the data source connection and credentials.               The hierarchical view displays database objects organized by database schema.               Expand the node for each schema to view tables and views. Expand a table or view to display the columns.             

### Selected Fields Pane

The Selected Fields pane displays the selected columns to include in the query.               The fields that are displayed in this pane become the field collection for the report data item.               These fields represent the data you can display in tables, charts, and other report items when you view a report.             

The following options are available:             

* __Delete__  Deletes the selected field from the fields collection.                 

* __Move Up and Move Down__  Moves fields up or down the fields list.                   The fields are added to the query in the order they appear in the Selected fields list.                 

The following columns are displayed:

* __Table__  Displays the field table name.                 

* __Field__  Displays the field name.                 

* __Alias__  The alias to use for the field.                   Alias will be automatically generated if the last added field name is already in use.                   Additionally field aliases can be changed or added manually.                 

### Relationships Pane

The Relationships pane displays the join relationships.               The relationships can be detected automatically from the foreign key relationships               that are retrieved from the database metadata or you can create them manually.             

The following options are available:             

* __Manual Mode/Auto Detect__  Toggles the auto detect feature that automatically creates relationships between tables.                   If auto detect is turned on, the query designer creates relationships from foreign keys in tables;                   otherwise, you must create the relationships manually.                   When you select tables in the Database view pane, auto detect automatically attempts to create relationships.                   If you turn on auto detect after you have manually created joins, those joins will be discarded.                 

* __Add Relationship__  Adds a relationship to the Relationship list.                 If auto detect is turned on, the tables from which columns are used in the query are automatically added to the Relationship list.                   When auto detect identifies that two tables are related, one table is added to the Left Table column, the other the Right Table column,                   and an inner join is created between them.                   Each relationship generates a JOIN clause in the query.                   If the tables are not related, all of them are listed in Left Table column and the Join Type column                   indicates the tables are not related to other tables.                   When auto detect is turned on, you cannot manually add relationships between tables that auto detect determines are unrelated.                 If in manual mode, you can add and change relationships between tables.                   Click Related Fields cell to specify the fields to use to join the two tables.                 When using multiple relationships in a query, one of the tables in each relationship,                   except the first one, must be referenced in a proceeding relationships.                 

* __Delete__  Deletes the selected relation from the relationships collection.                 

* __Move Up and Move Down__  Moves relations up or down the filter list.                   The relations are added to the query in the order they appear in the Relations list.                   Still the SQL query builder may reorder the relations to create a correct SQL statement.                 

The following columns are available:             

* __Left Table__  Displays the name of the first table that is part of a join relationship.                 

* __Join Type__  Displays the type of SQL JOIN statement that is used in the automatically generated query.                   By default, if a foreign key constraint is detected, INNER JOIN is used.                   Other joins types can be LEFT JOIN, RIGHT JOIN or FULL OUTER JOIN.                   If none of these join types apply, the Join Type column displays Unrelated.                   No CROSS JOIN joins are created for unrelated tables;                   instead, you must manually create relationships by joining columns in the left and right tables.                 

* __Right Table__  Displays the name of the second table that is part of a join relationship.                 

* __Join Fields__  Lists the pairs of joined fields, if a relationship has multiple join conditions the pairs of joined fields are separated by commas (,).                 

* __Related Fields__                    Displays the relationships between the tables.                   Clicking a Related Fields cell while in manual mode opens a dialog box in which to add and modify relationships between tables.                   You chose the fields in the right and left tables to join.                   You can join multiple fields from the left table and the right table to specify multiple join conditions in a relationship.                   The two fields that join the left and right tables do not need to have the same name. The joined fields must have compatible data types.                 

### Filters Pane

The Filters pane displays the criteria that are used to limit the number of rows of data that are retrieved at run time.               Criteria specified in this pane are used to generate an SQL WHERE clause.             

The following columns are displayed:

* __Field Name__  Displays the name of the field to apply the criteria to.                 

* __Operator__  The operator to use to in the filter expression.                 

* __Parameter name__  The parameter name to add to the query.                 

* __Preview value__  The value to use for the Data Preview Pane.                 

The following options are available:             

* __Add__  Add new filter to the filters collection.                 __Delete__  Deletes the selected filter from the filters collection.                 

* __Move Up and Move Down__  Moves fields up or down the filter list.                   The filters are added to the query in the order they appear in the Filters list.                 

### Data Preview Pane

The Data Preview pane displays the results for the automatically generated query that is specified by selections in the other panes.               The columns in the result set are the fields that you specify in the Selected Fields pane             

The data is not saved in the report definition. The actual data in the report is retrieved when the report is processed.             

Sort order in the result set is determined by the order the data is retrieved from the database.               Sort order can be changed after the data is retrieved for the report data item by adding sorting expressions with the               [Edit Sorting Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-sorting-dialog%}).             

You can group the data and use aggregates after the data is retrieved using the               report data item grouping abilities and [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}).             

## Query Designer State

Clicking OK the [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}) Select Statement will be replaced with the currently generated SQL query.           The OK button is only enabled if the query is valid.         

The Query Designer keeps the current setup state, however if you modify the SQL query outside the Query Designer and then use           the Query Designer, the Query Designer will override the SQL query manually made modification.         

## 


