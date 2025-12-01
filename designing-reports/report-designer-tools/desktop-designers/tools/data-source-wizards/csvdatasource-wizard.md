---
title: CsvDataSource Wizard
page_title: CsvDataSource Wizard at a Glance
description: "Learn more about the CsvDataSource Wizard of the Telerik Reporting Desktop Designers and how to configure the CsvDataSource properties with it."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/csvdatasource-wizard
tags: csvdatasource,wizard
published: True
position: 30
previous_url: /csvdatasource-wizard
reportingArea: General
---

# CsvDataSource Wizard of the Report Designer

The __CSV Data Source Wizard__ allows you to create a new or edit an existing __CsvDataSource__ component based on several settings. After the wizard appears you have to perform the following steps:

1. __Choose a CSV Source__ Choose between file or inline string

	![Choose a CSV Source dialog of the CsvDataSource Wizard of the Report Designer](images/DataSources/CsvDataSourceWizard1.png)

1. __Configure the Separators__ Check at least one separator from each list. Check the consecutive field/record separators option (or both) if empty fields/records have to be omitted.

	![Configure the Separators dialog of the CsvDataSource Wizard of the Report Designer](images/DataSources/CsvDataSourceWizard2.png)

	>note If the same symbol, for example semicolon, is selected for both field and record separators this is not considered to be a valid CSV format. A warning will be displayed and moving forward will not be possible.

1. __Escape Format__ Choose the Escape format that is most suitable for the CSV document. If Quotes or QuotesMixed is checked the Quote option also must be configured. If the CSV document has comments enter the symbol which marks the start of a comment. If nothing is set the document is considered to not have comments. For more information regarding the Escape formats please check [CsvDataSource Escape Formats]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/csvdatasource-escape-formats%}).

	![Escape Format dialog of the CsvDataSource Wizard of the Report Designer](images/DataSources/CsvDataSourceWizard3.png)

1. __CSV Headers__ If the CSV document has a header row check the checkbox.

	![CSV Headers dialog of the CsvDataSource Wizard of the Report Designer](images/DataSources/CsvDataSourceWizard4.png)

1. __Map Columns to Types__ Choose the data type for each column. Set the number (decimal and thousand separators) and date formats for the CsvDataSource. In case the CSV document does not have headers, the column names could be edited directly in the grid, so your data set fields would have meaningful names.

	![Map Columns to Types dialog of the CsvDataSource Wizard of the Report Designer](images/DataSources/CsvDataSourceWizard5.png)

1. __Preview Data Source Results__ Preview the result set returned by the data source.

	![Preview Data Source Results dialog of the CsvDataSource Wizard of the Report Designer](images/DataSources/CsvDataSourceWizard6.png)
