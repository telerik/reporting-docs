---
title: Using Section Events
page_title: Using Section Events explained with an example
description: "Understand the ItemDataBinding and ItemDataBound Section Events, and find out how to use them through an example."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/using-section-events
tags: using, section, events, ItemDataBinding, ItemDataBound
published: True
position: 3
previous_url: /using-section-events
reportingArea: General
---

# Using the Events of the Sections

The various report __Section__ objects expose these events:

| Event | Description |
| ------ | ------ |
|[ItemDataBinding](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_ItemDataBinding)|Fires just before the item is bound to data.|
|[ItemDataBound](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_ItemDataBound)|Fires just after the item is bound to data.|

In _ItemDataBinding_ and _ItemDataBound_ events use the "sender" argument of the event handler to get a reference to the section object. From the section object you can reference any of the items the section contains, i.e. TextBoxes, PictureBoxes, etc. You can also use the section DataObject property to access the data fields for the section.

> Be aware that the "sender" section object is of type __Telerik.Reporting.Processing.ReportItemBase__, not the definition item  __Telerik.Reporting.ReportItemBase__.

The example below demonstrates getting a reference to the detail section of the report and finding a specific TextBox within the section. The example also shows retrieving data source column values for the section and using it to alter the TextBox.

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\EventsSnippets.cs region=AddSectionDataBindingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\EventsSnippets.vb region=AddSectionDataBindingSnippet}}


The second example demonstrates getting a reference to the detail section of the report, finding all its children and setting a _BackgroundColor_ to them:

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\Access_Processing_Instances_Children_Snippets.cs region=Using_ILayoutElementContainer_Children_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\Access_Processing_Instances_Children_Snippets.vb region=Using_ILayoutElementContainer_Children_Snippet}}

