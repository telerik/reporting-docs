---
title: DataSource Wizard
page_title: DataSource Wizard at a Glance
description: "Learn more about the DataSource Wizard of the Telerik Reporting Desktop Designers and how to configure a DataSource for your data items with it."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard
tags: datasource,wizard
published: True
position: 0
previous_url: /ui-datasource-wizard, /designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/
---

# DataSource Wizard Overview

The Data Source Wizard allows you to select from one of the available data source components:

* SqlDataSource - represents an SQL Database to data items
* CsvDataSource - represents a CSV data source that provides data to data items
* ObjectDataSource - represents a business object that provides data to data items
* EntityDataSource - represents an Entity data model to data items
* OpenAccessDataSource - represents an Open Access data model to data items
* CubeDataSource - represents OLAP cube data model to data items
* OpenClientDataSource - represents OpenEdge AppServer ABL procedures which provide data to data items

![Crate New DataSource dialog of the DataSource Wizard of the Report Designer with listed the available data source components](images/DataSourceWizard1.png)

and selecting one of those choices, starts the respective wizard:

* [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%})
* [ObjectDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard%})
* [EntityDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/entitydatasource-wizard%})
* [OpenAccessDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/openaccessdatasource-wizard%})
* [CubeDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/cubedatasource-wizard%})
* [OpenClientDataSource Wizard]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/how-to-configure-the-openclientdatasource-component%})

There are two ways to start the Data Source wizard:

1. From the DataSource property of a data report item 

	+ Select the DataSource property of a data report item (Report, Table/Crosstab/List, Chart)
	+ Click on the __Add New Data Source__ link
	+ The Data Source Wizard is started

	![Invoking the DataSource Wizard of the Report Designer from the DataSource property of the data item](images/DataSourceWizard2.png)

1. From the [Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%}), [Table and CrossTab Wizards]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/table-and-crosstab-wizards%}), Graph Wizard or Map Wizard: 

	+ Navigate to __Choose Data Source__ page of the Wizard
	+ click the __Add New Data Source__ button
	+ The Data Source Wizard is started

	![Opening the DataSource Wizard of the Report Designer from the 'Add New Data Source...' button of the data item wizard](images/DataSourceWizard3.png)
