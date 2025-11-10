---
title: How to Connect to an ODBC Database
page_title: How to Connect to an ODBC Database 
description: How to Connect to an ODBC Database
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/-how-to/how-to-connect-to-an-odbc-database
tags: how,to,connect,to,an,odbc,database
published: False
position: 3
previous_url: /how-to-sqlDataSource-odbc
reportingArea: General
---

# How to Connect to an ODBC Database



You can use the Telerik SqlDataSource component to connect to any        ODBC–compliant data source. You connect the component to an ODBC data        source by specifying the appropriate ODBC driver in the connection string        along with relevant server and authentication information.

## To use the SqlDataSource control to connect to an ODBC database

1. In Microsoft Visual Studio, open a Telerik Report. From the              Telerik Reporting {{site.suiteversion}} group in the Toolbox, select the              SqlDataSource component and click on the design surface to add it              to the Report.

1. __Choose your Data Connection__ dialog box              appears.

1. Click __New Connection.__ 

1. In the __Add Connection__ dialog box,              click __Change__ to display the Change Data Source dialog box.

1. In the __Change Data Source__ dialog box,              click Microsoft ODBC Data Source, and then click __OK__.

1. The __Add Connection__ dialog box is displayed.             If you have an existing ODBC data source, click __Use user or system data source name__ and select an existing ODBC data source from the list.

1. If you do not have an existing ODBC data source, click __Use connection string__ and then type the connection string              or click __Build__ to display the              __Select Data Source__ dialog box where you can build an             ODBC data source name (DSN).

1. If necessary, enter the user name and password required to              connect to the database.

1. Click __Test connection__ to verify the connection to the ODBC data             source, and then close the __Add Connection__ dialog box to return to the             Configure Data Source wizard.

1. Click __Next__ and Select the __Yes, save this connection…__ check box. Enter a name for your connection for when the connection is stored              in the application configuration file, and then click __Next__.

1. Select the database table, view, or stored procedure from which             to retrieve results or specify your own SQL statement.

1. To test your query, click __Next__, and              then click __Execute Query__.

1. Click __Finish__. The Wizard would close              and the SqlDataSource component would be ready for use by the data items



