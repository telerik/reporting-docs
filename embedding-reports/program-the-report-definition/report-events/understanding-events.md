---
title: Understanding Events
page_title: Report Events Explained
description: "Get a deeper understanding about what Report Events are and what is actually happening during the definition, processing, and rendering stages of the report lifecycle."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/understanding-events
tags: understanding, events
published: True
position: 1
previous_url: /understanding-events
---

# Understanding Report Events

Delivering a Telerik Report to the end user is a process involving several stages. Knowledge of the [Report Life Cycle]({%slug telerikreporting/designing-reports/understanding-the-report-lifecycle%}) is crucial to understanding how events work in Telerik Reporting.

## Report Definition

The Report Definition is created during the first stage of the life cycle. This is the actual.NET class that represents the report. It is an instance of **Telerik.Reporting.Report** or an instance of a subclass of the **Telerik.Reporting.Report** and contains information about report items and their properties. Each item contained in the report gets added to a tree structure formed from the Items property of the Report (the root) and the Items properties of its child items. Additionally, if you are using the Visual Studio Report Designer, for each added report item, by default the newly added item is also added as a private field of the report definition class, in order to be easily accessible after the InitializeComponent method call.

Let's illustrate this with an example. While in design-time, if you add a TextBox to the Detail Section of the report that you are designing, a private field of type TextBox will be added to the code-behind file and some basic initialization code will be generated within the InitalizeComponent method of the report class.

> The **InitializeComponent** method initializes (creates) a Report and its child items. It is a special method recognized and parsed by the Report Designer in order to display the report in design-time.

This object will later serve as the definition for creating a concrete instance of the TextBox for each row from the data source. These definition objects are of the types that reside in the Telerik.Reporting namespace, for example [Telerik.Reporting.TextBox](slug:Telerik.Reporting.TextBox).

In order to programmatically change the report definition before rendering a report you need to place your code in the constructor of the report, right after the InitializeComponent call (if present).

## Report Processing

The second stage of the report life cycle involves combining the **report definition** with the **data source**. The processing engine performs all grouping, sorting and filtering calculations and iterates over all records from the data source and creates the appropriate **processing items** based on the item definitions created earlier and the actual data.

Based on the original item definition (e.g. Telerik.Reporting.TextBox) and the actual data in the current record a new item instance is created. This item is called a **processing item** (e.g. Telerik.Reporting.Processing.TextBox) and bears all characteristics of its definition item, but it is bound to the respective data field from the current record. While the definition TextBox's Value property may contain something like "=Fields.FirstName", the processing item's Value property will be equal to "John".

The Processing Engine provides the developer a way to intervene in this process. Just before the processing item is bound to data, the **ItemDataBinding** event of its corresponding definition item is raised. By subscribing a listener for this event, the developer can modify the newly created processing item before it gets data-bound (i.e., definition expressions processed and result applied to the processing item). The **processing item instance** is exposed to the event handler methods as the **sender** parameter.

In the **ItemDataBinding** event handler you may change any property of the processing instance of the item (e.g., positioning, stylization, item specific properties). Note that during the subsequent data binding the changed value will get overridden if there is an expression defined to be applied on the property in question.

After the processing item has been data bound the **ItemDataBound** event is raised. The purpose of this event is mainly to read the processing item instance property values, which result from expressions evaluation. You might also change values of the processing item instance properties, but for complex items this modification might not make effect as they are laid out and their inner content is already generated.

> Report Events are not intended to be used as a place/time to modify the report definition. As of **Q3 2016** any changes on the report items' definitions in processing stage events will not make effective change in the resulting report. Report definition properties are read and cached when the report processing gets started. In previous versions changes may take effect, resulting in changed output for all processing items processed after the event handler execution.

## Report Rendering

After processing is over, the processed report is ready for rendering in one of the available formats, see [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}). There are no events triggered during this stage of the report generation.

## See Also

- [Understanding the Report Lifecycle]({%slug telerikreporting/designing-reports/understanding-the-report-lifecycle%})
