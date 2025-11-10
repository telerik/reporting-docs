---
title: CSV Rendering
page_title: CSV Rendering Design Considerations at a glance
description: "Learn important details about the behavior and limitations of the CSV rendering format, that need to be taken into account when designing a report with CSV rendering in mind."
slug: telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/csv-rendering-design-considerations
tags: csv, rendering, design, considerations
published: True
position: 5
previous_url: /designing-reports-considerations-csv
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

# Design Considerations for the CSV Rendering

The Comma-Separated Value (CSV) rendering output reports as a flattened representation of a report data in a plain-text format.

The rendering extension uses a string character delimiter (, - comma) and rows (the environment new line character) to separate fields. The string character delimiter is configurable to be a character other than a comma. The exported report becomes a .csv file with a MIME type of text/plain. The resulting file can be opened in a spreadsheet program or used as an import format for other programs. 

When rendered using the default settings, a CSV report has the following characteristics:

* The first record contains headers for all the columns in the report (the items' name, not value).

* All rows have the same number of columns.

* The default field delimiter string is a comma (,).

   >note You can change the field delimiter to any character that you want, by changing the device information settings. For more information, see [CSV Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/csv-device-information-settings%}).

* The record delimiter string is taken from the environment. It is the newline character for the corresponding operating system (OS). For example, for Windows OS this is the carriage return and line feed '\r\n'. For Linux OS this is the '\n' character.

* The text qualifier string is a quotation mark (").

* If the text contains an embedded delimiter string or qualifier string, the text qualifier is placed around the text, and the embedded qualifier strings are doubled.

* Formatting and layout are ignored.


The following items are ignored during processing:

* Page Header Section

* Page Footer Section

* Shape

* Cross-section Item

* PictureBox

* Chart

The remaining report items appear as ordered in the parent’s item collection. Each item is then rendered to a column. If the report has nested report, the parent items are repeated in each record.

The following table lists the considerations applied to items when rendering to CSV:

|  __Report Item__  |  __Rendering Behavior__  |
| ------ | ------ |
|TextBox|Renders the contents of the text box. The data is formatted according to the item's Format property|
|Crosstab|Renders by expanding the table and creating a row and column for each row and column at the lowest level of detail. Due to this data denormalization (flattening) some Crosstab configurations will not be exported correctly.|
|Graph|Renders the chart series data.|
|Table|Renders by expanding the table and creating a row and column for each row and column at the lowest level of detail. Due to this data denormalization (flattening) some Crosstab configurations will not be exported correctly.|
|CheckBox|Renders the contents of the CheckBox. The Text is formatted according to the item's Format property. The first character of resulting string represents the CheckMark state: 0 is Unchecked, 1 is Checked and 2 is Indeterminate.|
|Detail section|Renders a record for each detail row.|
|Report Header Section|Renders its content at the beginning of each detail row.|
|Report Footer Section|Renders its content at the beginning of each detail row after the Report Header content if any.|
|Group Header Section|Renders its content at the beginning of each detail row after the Report Header and Report Footer content if any.|
|Group Footer Section|Renders its content at the beginning of each detail row after the Report Header, Report Footer and Group Footer content if  any|


## Flattening the Hierarchical and Grouped Data

Hierarchical and grouped data must be flattened in order to be represented in the CSV format.

The rendering extension flattens the report into a tree structure that represents the nested groups within the data item. To flatten the report:

* A row hierarchy is flattened before a column hierarchy.

* Columns are ordered as follows: text boxes in body order left-to-right, top-to-bottom followed by data items ordered left-to-right, top-to-bottom.

* In a data item, the columns are ordered as follows: corner members, row hierarchy members, column hierarchy members, and then cells.

* Peer data items are data items or dynamic groups that share a common data item or dynamic ancestor. Peer data is identified by branching of the flattened tree. The CSV rendering is best suited for reports with one flat databound data item.

## Interactivity

This rendering extension does not support any interactive features.

## See Also

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})

 * [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})

 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
