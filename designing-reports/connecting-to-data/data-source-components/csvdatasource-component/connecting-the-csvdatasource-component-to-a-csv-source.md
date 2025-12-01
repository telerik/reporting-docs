---
title: Connecting to CSV Source
page_title: Connecting CsvDataSource to CSV Data
description: "Learn how to configure the CsvDataSource Component, which are the required settings and how to connect it to the CSV Source."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/connecting-the-csvdatasource-component-to-a-csv-source
tags: connecting,the,csvdatasource,component,to,a,csv,source
published: True
position: 1
previous_url: /csvdatasource-connecting-the-csvdatasource-component-to-a-csv-data
reportingArea: General
---

# Connecting the CsvDataSource Component to a CSV Source

When you configure the CsvDataSource component the settings below are obligatory to avoid runtime error due to failed data retrieval:

* `Source` - Specifies the CSV document which will be used by using the Uri class or an inline string. If set to null an exception is thrown;
* `Field separators` - Configures the list of separators by which the document will be split to fields (columns) based on a delimiter;
* `Record separators` - Configures the list of separators by which the document will be split to records (rows) based on a delimiter.

Optional settings for the proper functioning of the CsvDataSource you need to consider:

* `Has headers` - configures if the CSV source has a header row, by default is false;
* `Escape format` - for more information please check [CsvDataSource Escape Formats]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/csvdatasource-escape-formats%}); default value is None;
* `Quote` - if the Escape format is Quotes or Quotes Mixed then the Quote property must be set.

{{source=CodeSnippets\CS\API\Telerik\Reporting\CsvDataSourceSnippets.cs region=ConfiguringCsvDataSource_RequiredSetting}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\CsvDataSourceSnippets.vb region=ConfiguringCsvDataSource_RequiredSetting}}

Optional setting:

{{source=CodeSnippets\CS\API\Telerik\Reporting\CsvDataSourceSnippets.cs region=ConfiguringCsvDataSource_OptionalSetting}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\CsvDataSourceSnippets.vb region=ConfiguringCsvDataSource_OptionalSetting}}

