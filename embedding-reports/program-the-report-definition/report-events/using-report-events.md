---
title: Using Report Events
page_title: Using Report Events explained with an example
description: "Understand the ItemDataBinding, NeedDataSource, and ItemDataBound Report Events, and find out how to use them through an example."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/using-report-events
tags: using, report, events, ItemDataBinding, NeedDataSource, ItemDataBound
published: True
position: 2
previous_url: /using-report-events
reportingArea: General
---

# Using Events of the Report

The __Report__ object exposes these events:

| Event | Description |
| ------ | ------ |
|[ItemDataBinding](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_ItemDataBinding)|Fires just before the report is bound to data.|
|[NeedDataSource](/api/Telerik.Reporting.DataItem#Telerik_Reporting_DataItem_NeedDataSource)|Fires when the report does not have data source set.|
|[ItemDataBound](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_ItemDataBound)|Fires just after the report is bound to data.|

The example below shows the NeedDataSource event assigning the report __DataSource__ at runtime. This event only fires when the __DataSource__ is __null__.

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\ReportEvents.cs region=NeedDataSourceEventHandlerSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\ReportEvents.vb region=NeedDataSourceEventHandlerSnippet}}

