---
title: CSV Device Information Settings
page_title: CSV Device Information Settings | for Telerik Reporting Documentation
description: CSV Device Information Settings
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/csv-device-information-settings
tags: csv,device,information,settings
published: True
position: 6
---

# CSV Device Information Settings



The following table lists the device information settings for rendering in CSV format.

## CSV Device Information Settings




| Name | Type | Description |
| ------ | ------ | ------ |
|FieldDelimiter|String|The delimiter string to put in the result. The default value is a comma (,).|
|RecordSeparator|String|Specifies the string that is used to separate each record(row) in the produced CSV.               By default, the NewLine string is taken from the environment. It is the newline character for the corresponding operating system (OS).                For example, for Windows OS this is the carriage return and line feed '\r\n'. For Linux OS this is the '\n' character.|
|NoHeader|Boolean|Indicates whether the header row is excluded from the output. The default value is __false__ .|
|NoStaticText|Boolean|Indicates whether static text is excluded from the output. From Telerik Reporting point of view a TextBox item                 which value is a string that does not start with = is considered static; otherwise it is evaluated as an expression. The default value is __false__ .|
|Qualifier|String|The qualifier string to put around results that contain the field delimiter. If the results contain the qualifier, the qualifier is repeated. The Qualifier setting must be different from the FieldDelimiter setting. The default value is a quotation mark (").|
|Encoding|String|The  [code page](http://msdn.microsoft.com/en-us/library/windows/desktop/dd317752(v=vs.85).aspx) .NET name that will be used to encode the exported data. The default value is __UTF-8__ . List of all the available code page identifiers can be obtained  [here](http://msdn.microsoft.com/en-us/library/windows/desktop/dd317756(v=vs.85).aspx) .|
|WriteBOM|Boolean|Indicates whether to write the  [byte order marks (BOM)](http://msdn.microsoft.com/en-us/library/windows/desktop/dd374101(v=vs.85).aspx) at the beginning of the output stream. Applicable only when the selected encoding is  [Unicode](http://msdn.microsoft.com/en-us/library/windows/desktop/dd374081(v=vs.85).aspx) . The default value is __false__ .|
|FormulaPrefix|String|When the exported CSV file is to be opened in a spreadsheet application (Microsoft Excel, Google Sheets, etc.), it is recommended to escape                 CSV values with a prefix in order to prevent the spreadsheet application from automatically executing malicious formula injection attacks.                 The recommended formula prefix string which is not visually present in spreadsheet applications is the tab character " __\t__ ".                 Other popular prefix strings are " __'__ ", " __\__ ", " ____ ".The __default value__ is an empty string and the default behavior is to keep the original CSV data intact. This option is very useful                 when the exported CSV file will be read by a non-spreadsheet application and there is no risk of formula injection attacks.Besides formula injection attacks the prefix will also prevent automatic execution of CSV values which incidentally resemble a spreadsheet formula.                 For example:<br/>	=1+1<br/>The CSV value above will be visualised as " __2__ " when the CSV file is opened in Excel. A formula prefix, such as an apostrophe                 " __'__ ", will prevent this behavior and display:<br/>	'=1+1<br/|




For an example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).         

# See Also


 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
