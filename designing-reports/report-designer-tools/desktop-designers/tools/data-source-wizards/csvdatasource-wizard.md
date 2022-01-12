---
title: CsvDataSource Wizard
page_title: CsvDataSource Wizard | for Telerik Reporting Documentation
description: CsvDataSource Wizard
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/csvdatasource-wizard
tags: csvdatasource,wizard
published: True
position: 3
---

# CsvDataSource Wizard



The __CSV Data Source Wizard__ allows you to create a new or edit an existing         __CsvDataSource__ component based on several settings.         After the wizard appears you have to perform the following steps:       

1. __Choose a CSV Source__ Choose between file or inline string               

  ![Csv Data Source Wizard 1](images/DataSources/CsvDataSourceWizard1.png)

1. __Configure the Separators__ Check at least one separator from each list. Check the consecutive field/record separators option (or both)               if empty fields/records have to be omitted.               

  ![Csv Data Source Wizard 2](images/DataSources/CsvDataSourceWizard2.png)

   >Note that if the same symbol, for example semicolon, is selected for both field and record separators this is not considered to be                 a valid CSV format. A warning will be displayed and moving forward will not be possible.               

1. __Escape Format__ Choose the Escape format that is most suitable for the CSV document.               If Quotes or QuotesMixed is checked the Quote option also must be configured.               If the CSV document has comments enter the symbol which marks the start of a comment.               If nothing is set the document is considered to not have comments.             For more information regarding the Escape formats please check [CsvDataSource Escape Formats]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/csvdatasource-escape-formats%}).               

  ![Csv Data Source Wizard 3](images/DataSources/CsvDataSourceWizard3.png)

1. __CSV Headers__ If the CSV document has a header row check the checkbox.               

  ![Csv Data Source Wizard 4](images/DataSources/CsvDataSourceWizard4.png)

1. __Map Columns to Types__ Choose the data type for each column. Set the number (decimal and thousand separators) and date formats for the CsvDataSource.               In case the CSV document does not have headers, the column names could be edited directly in the grid,               so your data set fields would have meaningful names.               

  ![Csv Data Source Wizard 5](images/DataSources/CsvDataSourceWizard5.png)

1. __Preview Data Source Results__ Preview the result set returned by the data source.               

  ![Csv Data Source Wizard 6](images/DataSources/CsvDataSourceWizard6.png)

