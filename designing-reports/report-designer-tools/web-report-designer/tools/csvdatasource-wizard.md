---
title: CsvDataSource Wizard
page_title: CsvDataSource Wizard Tutorial
description: "Learn how to integrate CSV data in Telerik Reporting Report with the dedicated CsvDataSource Wizard of the Web Report Designer."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/csvdatasource-wizard
tags: csvdatasource,wizard
published: True
position: 1
previous_url: /web-report-designer-tools-csvdatasource-wizard
---

# CsvDataSource Wizard Overview

The CSV Data Source Wizard allows you to create a new or edit an existing [`CsvDataSource`]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%}) component in the Telerik Web Report Designer. This article describes the steps you can follow after the wizard appears, after being invoked from the Report Designer toolbox.

1. __Choose a CSV source__ Select how the CSV source should be retrieved for the component.

	+ __Upload CSV file__ from the local computer.
	+ __Use existing CSV file__ that previously has been uploaded and/or exists in the [IResourceStorage](/api/Telerik.WebReportDesigner.Services.IResourceStorage) The default implementation of the [IResourceStorage](/api/Telerik.WebReportDesigner.Services.IResourceStorage) interface - [ResourceStorage](/api/Telerik.WebReportDesigner.Services.ResourceStorage) stores resources like CSV files to the location provided as a string parameter in the constructor [#ctor](/api/Telerik.WebReportDesigner.Services.ResourceStorage#Telerik_WebReportDesigner_Services_ResourceStorage_#ctor_System_String_). When choosing the option __"Use existing CSV file"__, any existing CSV files found in this directory will populate the dropdown list.
	+ __Use CSV inline__ to paste in a string in the text area.

1. __Modify your CSV file__ If you have chosen to __"Upload CSV file"__ or __"Use existing CSV file"__ you have the option to store this inside the report definition by checking __"Embed CSV file in report definition"__ option. By checking this option the CSV data can be directly edited in the text area, and will no longer be dependent on having the CSV file available in [ResourceStorage](/api/Telerik.WebReportDesigner.Services.ResourceStorage).
1. __Configure CSV Data Source - Separators__ Select at least one separator for both __"Field (column) separator"__ and __"Record (row) separator"__. To define a different separator than what is available in the list, choose __"Other"__ and define the symbol in the input-field. Check the consecutive field/record separators option (or both) if empty fields/records have to be omitted. If the CSV data has headers as its first row, check the __"This CSV has header row"__ option.
1. __Configure CSV Data Source - Escape Format__ Choose the Escape format used in the CSV data. If Quotes or QuotesMixed is selected as Escape Format, the Quote option also must be configured. If the CSV data has comments, enter the symbol which marks the start of a comment as Comment Symbol. If nothing is set, the document is considered to not have comments. For more information regarding the Escape formats, please check [CsvDataSource Escape Formats]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/csvdatasource-escape-formats%}).
1. __Map Columns to Type__ The Available Columns will be populated based on the CSV data. If __"This CSV has header row"__ option was selected in previous stage, the first column will show the values from the that header-row and the second column show the data-type. The column names and types can be edited. All columns will have a default type of String, and these can be modified by selecting a different type in the dropdown menu. __CSV fields type conversion__ has two separators for numeric types, and a __Date format__ to define the format of a DateTime string.
1. __Preview Data Source Results__ Preview the data-set and see that it returns the expected data. Click __Finish__ to exit out of the Wizard and save the data source component.
