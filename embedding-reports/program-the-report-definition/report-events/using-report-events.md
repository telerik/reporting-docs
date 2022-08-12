---
title: Using Report Events
page_title: Using Report Events 
description: Using Report Events
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/using-report-events
tags: using,report,events
published: True
position: 2
previous_url: /using-report-events
---

# Using Report Events

The __Report__ object exposes these events: 

| Event | Description |
| ------ | ------ |
|[ItemDataBinding](/reporting/api/Telerik.Reporting.ReportItemBase.html#collapsible-Telerik_Reporting_ReportItemBase_ItemDataBinding)|Fires just before the report is bound to data.|
|[NeedDataSource](/reporting/api/Telerik.Reporting.DataItem.html#collapsible-Telerik_Reporting_DataItem_NeedDataSource)|Fires when the report does not have data source set.|
|[ItemDataBound](/reporting/api/Telerik.Reporting.ReportItemBase.html#collapsible-Telerik_Reporting_ReportItemBase_ItemDataBound)|Fires just after the report is bound to data.|

The example below shows the NeedDataSource event assigning the report __DataSource__ at runtime. This event only fires when the __DataSource__ is __null__. 

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\ReportEvents.cs region=NeedDataSourceEventHandlerSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\ReportEvents.vb region=NeedDataSourceEventHandlerSnippet}}

