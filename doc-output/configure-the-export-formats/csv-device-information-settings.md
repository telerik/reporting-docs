---
title: CSV Device Information Settings
page_title: CSV Device Information Settings at a glance
description: "Find detailed information about the different CSV rendering settings available, and how to configure them."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/csv-device-information-settings
tags: csv, device, information, settings, options
published: True
position: 6
previous_url: /device-information-settings-csv, /using-reports-in-applications/export-and-configure/configure-the-export-formats/csv-device-information-settings
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 10%;
}
table th:nth-of-type(3) {
	width: 75%;
}
</style>

# Device Information Settings for the CSV rendering format

The following table lists the device information settings for rendering in CSV format.

## Available CSV Device Information Settings

> The names of the properties in Device Information Settings are __Case-Sensitive__.

|__Name__|__Type__|__Description__|
| ------ | ------ | ------ |
|FieldDelimiter|String|The delimiter string to put in the result. The default value is a comma `,`.|
|RecordSeparator|String|Specifies the string that is used to separate each record(row) in the produced CSV. By default, the NewLine string is taken from the environment. It is the newline character for the corresponding operating system (OS). For example, for Windows OS this is the carriage return and line feed '\r\n'. For Linux OS this is the '\n' character.|
|NoHeader|Boolean|Indicates whether the header row is excluded from the output. The default value is __false__.|
|NoStaticText|Boolean|Indicates whether static text is excluded from the output. From Telerik Reporting point of view a TextBox item which value is a string that does not start with = is considered static; otherwise it is evaluated as an expression. The default value is __false__.|
|Qualifier|String|The qualifier string to put around results that contain the field delimiter. If the results contain the qualifier, the qualifier is repeated. The Qualifier setting must be different from the FieldDelimiter setting. The default value is a quotation mark `"`.|
|Encoding|String|The [code page](https://learn.microsoft.com/en-us/windows/win32/intl/code-pages) .NET name that will be used to encode the exported data. The default value is __UTF-8__. List of all the available code page identifiers can be obtained from the article [Code Page Identifiers](https://learn.microsoft.com/en-us/windows/win32/intl/code-page-identifiers).|
|WriteBOM|Boolean|Indicates whether to write the [byte order marks (BOM)](https://learn.microsoft.com/en-us/windows/win32/intl/using-byte-order-marks) at the beginning of the output stream. Applicable only when the selected encoding is [Unicode](https://learn.microsoft.com/en-us/windows/win32/intl/unicode). The default value is __false__.|
|FormulaPrefix|String|When the exported CSV file is to be opened in a spreadsheet application (Microsoft Excel, Google Sheets, etc.), it is recommended to escape CSV values with a prefix in order to prevent the spreadsheet application from automatically executing malicious formula injection attacks. The recommended formula prefix string which is not visually present in spreadsheet applications is the tab character `\t`. Other popular prefix strings are `'`, `\`, empty string.<br/>The __default value__ is an empty string and the default behavior is to keep the original CSV data intact. This option is very useful when the exported CSV file will be read by a non-spreadsheet application and there is no risk of formula injection attacks.<br/>Besides formula injection attacks the prefix will also prevent automatic execution of CSV values which incidentally resemble a spreadsheet formula. For example: `=1+1`<br/>The CSV value above will be visualised as `2` when the CSV file is opened in Excel. A formula prefix, such as an apostrophe `'`, will prevent this behavior and display: `'=1+1`|

For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).

## See Also

* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
* [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
