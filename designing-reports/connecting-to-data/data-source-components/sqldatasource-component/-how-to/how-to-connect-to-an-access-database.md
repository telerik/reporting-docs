---
title: How to Connect to an Access Database
page_title: How to Connect to an Access Database 
description: How to Connect to an Access Database
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/-how-to/how-to-connect-to-an-access-database
tags: how,to,connect,to,an,access,database
published: False
position: 2
previous_url: /how-to-sqlDataSource-access
reportingArea: General
---

# How to Connect to an Access Database



You can connect to a Microsoft Access database using the Telerik        SqlDataSource component. To do this, you need a connection string and an        Access data file. Then, you can use the SqlDataSource component to provide        data to data items (Report, Table, Chart).

## To connect to an Access database using the SqlDataSource control

1. In Microsoft Visual Studio, open a Telerik Report. From the              Telerik Reporting {{site.suiteversion}} group in the Toolbox, select the              SqlDataSource component and click on the design surface to add it              to the Report.

1. __Choose your Data Connection__ dialog box              appears.

1. Click __New Connection__ 

+ If the __Change Data Source__ dialog box appears, click 
            __Microsoft Access Database File__, and then click __Continue__.

1. In the __Add Connection__ dialog box,              click __Change__, in the __Change Data Sourc__ e dialog box, click __Microsoft Access Database File__, and             then click OK.

1. In the __Database file name__ box, enter a path to the Access database,             and then under __Log on to the database__, enter your logon credentials,              if they are required.

1. Optionally, click __Test connection__ to              verify that the connection to the Access database succeeds.

1. Click __OK__ and notice that in the __Data Connection__ -              ```<Datasourcename>``` combobox, your new connection is selected.

1. Click __Next__ and Select the              __Yes, save this connection…__ check box,             enter a name for your connection for when the connection is stored in              the application configuration file, and then click __Next__.

1. Select the database table from which to retrieve results or enter your own SQL              statement.

1. To test your query, click __Next__, and then             click __Execute Query__ 

1. Click __Finish__. The Wizard would close and the SqlDataSource              component would be ready for usage by the data items.



