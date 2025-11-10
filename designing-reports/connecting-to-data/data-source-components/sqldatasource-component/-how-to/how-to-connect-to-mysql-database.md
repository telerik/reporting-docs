---
title: How to Connect to MySQL Database
page_title: How to Connect to MySQL Database 
description: How to Connect to MySQL Database
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/-how-to/how-to-connect-to-mysql-database
tags: how,to,connect,to,mysql,database
published: False
position: 5
previous_url: /how-to-sqlDataSource-mySql
reportingArea: General
---

# How to Connect to MySQL Database



You can use the SqlDataSource component to connect to MySQL        database. Prior to this, you should install.NET connector. You need access        rights to a MySQL Server database with relevant server and authentication        information. Then, you can use the SqlDataSource component to provide data        to data items (Report, Table, Chart).

## To use the SqlDataSource control to connect to MySql database

1. In Microsoft Visual Studio, open a Telerik Report. From the              Telerik Reporting {{site.suiteversion}} group in the Toolbox, select the              SqlDataSource component and click on the design surface to add it              to the Report.

1. __Choose your Data Connection__ dialog box              appears.

1. Click __New Connection.__ 

1. In the __Add Connection__ dialog box,              click __Change__ to display the Change Data              Source dialog box.

1. In the __Data source__ list, click __MySQL Database__ and then click __Ok__ 

1. The __Add Connection__ dialog box is displayed.              In the __Server name__ box, type the name of the MySql server.

1. Type the user name and password to connect with the database.

1. Select the __Save my password__ box to save              authentication information as part of the connection string, select              DataBase name and then click __OK__.

1. You are returned to the __Choose Your Data Connection__            dialog with the new connection string information displayed.

1. Click __Next__ and Select the __Yes, save this connection…__ check box.             Enter a name for your connection for when the connection is stored in              the application configuration file, and then click __Next__.

1. Select the database table, view, or stored procedure from              which to retrieve results or specify your own SQL statement. 

1. To test your query, click __Next__, and              then click __Execute Query__.

1. Click __Finish__. The Wizard would close              and the SqlDataSource component would be ready for use by the data items



