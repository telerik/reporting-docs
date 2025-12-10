---
title: Overview
page_title: CsvDataSource Component at a Glance
description: "Learn more about the CsvDataSource Component in Telerik Reporting, how you may configure it and format its data."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview
tags: overview
published: True
position: 0
previous_url: /csvdatasource-component, /designing-reports/connecting-to-data/data-source-components/csvdatasource-component/
reportingArea: General
---
<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# CsvDataSource Component Overview

The CsvDataSource component enables data items to display data located in a CSV document, including files (`*.csv`, `*.tsv`, `*.txt`, and others), inline string or stream, while using little or no code. Using CsvDataSource allows you to access and display data in a report without parsing the CSV document prior to that. At run time, CsvDataSource automatically creates a stream from the provided source, returns the selected data with the provided mapping and then closes the stream.

## Configuring the CsvDataSource component

Multiple formats are supported through configuring the CsvDataSource settings.

| CsvDataSource configuration setting | Description |
| ------ | ------ |
|`Has headers`|Defines if the CsvDataSource has headers. If true the first non-comment row of the CSV document is used for field names and is not considered as data (i.e. will be omitted from the data output).|
|`Field separators (column delimiters)`|Configures the list of separators by which the document is split to fields (columns) based on a delimiter.|
|`Record separators (row delimiters)`|Configures the list of separators by which the document is split to records (rows) based on a delimiter.|
|`Escape format`|Defines how the special symbols are escaped, like field and record separators and the escape symbols themselves. For more information please check [CsvDataSource Escape Formats]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/csvdatasource-escape-formats%})|
|`Quote`|Configures the text qualifier if Quotes (RFC 4180 standard is applied to the CSV document) or Quotes Mixed (same as Quotes, but the escape symbol is escaped with a backslash) Escape format is used.|
|`Comment token`| By providing a comment token for the CsvDataSource comments can be supported and omitted from the data output.|

## CsvDataSource data format settings

Below are listed the available settings for formatting the data retrieved from the CSV document.

| CsvDataSource option | Description |
| ------ | ------ |
|`Consecutive field/record separators as one`|Configures if consecutive field/record separators are treated as one.|
|`Decimal separator`|Configures the decimal separator when parsing numbers.|
|`Thousand separator`|Configures the thousand separator when parsing numbers.|
|`DateTime format`|A [Custom Date and Time Format String](https://learn.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings) which configures the format of the date and time when parsing date and time strings to DateTime data field values. A custom format string consists of one or more custom date and time format specifiers. For more information on date and time format specifiers please refer to the [Custom Date and Time Format Strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings) MSDN article. For example, to correctly parse the string "12-30-11" to a valid DateTime you need to use the following DateTime format: "MM-dd-yy". If the date string does not conform to the specified DateTime format, the DateTime field will appear empty in the Data Preview window.|
|`Columns`|Configures the column-data type mapping.|

## Supported developer platforms

* .NET Framework 4.6.2 and above
* .NET {{site.mindotnetversion}} and above
* .NET Standard 2.0 and above
