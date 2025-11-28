---
title: Using Report Items Events
page_title: Using Report Items Events explained with example
description: "Understand the ItemDataBinding and ItemDataBound Report Items Events, and find out how to use them through an example."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/using-report-item-events
tags: using, report, item, events, ItemDataBinding, ItemDataBound
published: True
position: 4
previous_url: /using-report-item-events
reportingArea: General
---

# Using the Events of Report Items

Each [report item]({%slug telerikreporting/designing-reports/report-structure/overview%}) on a report exposes these events:

| Event | Description |
| ------ | ------ |
|[ItemDataBinding](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_ItemDataBinding)|Fires just before the item is bound to data.|
|[ItemDataBound](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_ItemDataBound)|Fires just after the item is bound to data.|

> The [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) expose one additional event: __NeedDataSource__. This event fires when the item does not have data source bound to it. For example, the [SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%}) _NeedDataSource_ event will fire when _SubReport.ReportSource_ does not have data source.

Let us demonstrate this with a simple example. Suppose that we have a TextBox containing the job position of an employee. Assume that the TextBox's Value property equals "=Fields.Title", where Title is a column from the data source containing values like "Team Leader", "Senior Developer", "Junior Developer", "Quality Assurance", etc. For the sake of our example, suppose that we would like to color all developers in Blue.

First we need to attach to the TextBox's ItemDataBinding event. Double-click the event in the property grid and an event handler method will be automatically generated for you.

As explained in [Understanding Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/understanding-events%}) topic, the __sender__ argument is in fact the __processing__ TextBox that has already been data bound. The method will be called for each data row, i.e. for each employee we have in the data source. So the only thing we have left to do is cast the sender, check the position, and do the coloring if needed:

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\EventsSnippets.cs region=AddTextBoxItemDataBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\EventsSnippets.vb region=AddTextBoxItemDataBindingSnippet}}

> The provided example can be easily implemented using [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}), see [Change row color based on a value in the row]({%slug change-row-color-based-on-value%}) or [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}).

## See Also

* [Access Report Items Programmatically]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/access-report-items-programmatically%})
