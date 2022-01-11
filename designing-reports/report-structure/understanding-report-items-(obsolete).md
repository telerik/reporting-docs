---
title: Understanding Report Items (obsolete)
page_title: Understanding Report Items (obsolete) | for Telerik Reporting Documentation
description: Understanding Report Items (obsolete)
slug: telerikreporting/designing-reports/report-structure/understanding-report-items-(obsolete)
tags: understanding,report,items,(obsolete)
published: False
position: 2
---

# Understanding Report Items (obsolete)



Telerik Reporting supplies __report item__  components that are placed in the report designer to build report            content: 

| Report item | Description |
| ------ | ------ |
| [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%})|The TextBox displays text in the report, can be styled to a specific visual appearance, <br/>      can be configured to grow/shrink, formatted for specific data types (e.g. date time) and can be multi-line.|
| [HtmlTextBox]({%slug telerikreporting/designing-reports/report-structure/htmltextbox/overview%})|The HtmlTextBox item allows developers to insert HTML-formatted text into a report. You can specify the HTML <br/>       value at design time (either through a WYSIWYG editor or through an expression editor), or retrieve it from a data <br/>       source using expression that evaluates to correctly formatted HTML.|
| [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%})|The PictureBox allows you to place images in the report. It supports only image formats supported by GDI+ <br/>       ( __BMP__, __GIF__, __JPEG__, __EXIF__, __PNG__ and __TIFF__ ).|
| [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%})|The Panel report item is used as a container for other items, usually to group/separate multiple report <br/>       items by some criteria.|
| [SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%})|The SubReport report item lets you display one report within another report. This allows you to compose <br/>       complex reports from disparate report sources.|
| [Table]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%})|The Table items is used to display fields from a dataset either as detail data or as grouped data in a <br/>       grid or free-form layout. Telerik Reporting provides three items that can be used as templates and you can add <br/>       them directly from the Toolbox: __Table__, __Crosstab__, and __List__.|
| [CheckBox]({%slug telerikreporting/designing-reports/report-structure/checkbox%})|This report item displays a check mark (small picture) and a Text field (same as the text in TextBox). <br/>       It can be styled to a specific visual appearance, can be configured to grow/shrink, the text can be formatted <br/>       for specific data types (e.g. date time) and can be multi-line. The Check mark and Text can be aligned vertically <br/>       and horizontally. There are three predefined check mark images, but they can be replaced with others.|
| [Chart]({%slug telerikreporting/designing-reports/report-structure/chart-(obsolete)%})|The chart lets you display data in a visually compelling way. The chart can bind to live data and display <br/>       in many popular chart types, e.g. __Bar__, __Pie__, __Gantt__, __Line__, __Area__, __Bubble__, etc.|
| [BarCode]({%slug telerikreporting/designing-reports/report-structure/barcode/overview%})|The Barcode report item is used for automatic barcode generation directly from a numeric or character data <br/>       without need of any barcode font being installed in the end user's PC.|
| [Shape]({%slug telerikreporting/designing-reports/report-structure/shape%})|The Shape item displays visual primitives in the report including ellipse, vertical/horizontal/slanting lines, and triangles.|

## Definition item versus Processing item

### Report Definition

The Report Definition item is created during the first stage of the [Report Life Cycle]({%slug telerikreporting/designing-reports/understanding-the-report-lifecycle%}). This is the actual.NET class that represents the report. It is always a subclass __Telerik.Reporting.Report__  and contains information about report items and their properties. Report items are represented by the private fields of the report class.

Let’s illustrate this with an example. While in design-time, if you add a TextBox to the Detail Section of the report that you are designing, a private field of type TextBox will be added to the code-behind file and some basic initialization code will be generated within the InitalizeComponent method of the report class.

> The  __InitializeComponent__  method initializes (creates) a Report and its child items.It is a special method recognized and parsed by the Report Designer in order to display the report in design-time.

This object will later serve as the definition for creating a concrete instance of the TextBox for each row form the data source. These definition objects are of the types that reside in the Telerik.Reporting namespace, for example Telerik.Reporting.TextBox.

### Report Processing

The second stage of the [Report Life Cycle]({%slug telerikreporting/designing-reports/understanding-the-report-lifecycle%}) involves combining the __report definition__  with the __data source__. The processing engine performs all grouping, sorting and filtering calculations and iterates over all rows from the data source and creates the appropriate __processing items__  based on the item definitions created earlier and the actual data. Based on the original item definition (Telerik.Reporting.TextBox for example) and the actual data in the current data row a new item is created. This item is known as a __processing item__  (Telerik.Reporting.Processing.TextBox for example) and bears all characteristics of its definition item, but it is bound to the respective data field from the current data row. While the definition TextBox’s Value property may contain something like “=Fields.FirstName”, the processing item’s Value property will be equal to “John”.

The Processing Engine provides the developer with a way to intervene in this process. Just before the processing item is bound to data, the __ItemDataBinding__  event of its definition item is raised. After the processing item has been data bound the __ItemDataBound__  event is raised. By subscribing a listener for those events, the developer can modify the default behavior at run-time. The *sender*  parameter of the event handler methods is in fact the __processing report item__.

