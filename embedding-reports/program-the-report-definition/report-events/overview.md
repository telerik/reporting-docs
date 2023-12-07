---
title: Overview
page_title: Report Events Overview
description: "Find out more about what the available Report Events are, how they work, and where you can use them."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview
tags: report, events, overview
published: True
position: 0
previous_url: /report-events, /embedding-reports/program-the-report-definition/report-events/
---

# Report Events

Telerik Reports created in Visual Studio support events like ItemDataBinding, ItemDataBound, NeedDataSource for [Data items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) and Error event for reports. events are triggered when data and the designed report start being processed by the Reporting Engine.

Events are a __legacy approach__ for modifying styles, providing data, and logging information about the processing report.

Telerik Reporting provides different declarative means that replace the need for events and provide the needed flexibility to handle most tasks: [Using Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%}), [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}), [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) and [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}). These tools are typically the most productive way to build declarative reports and should be favored over using events. Additionally, events can't be used with [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) report documents, because the custom code from events is not serialized in reports.

> Designed reports' structures should not be modified in events. Changes as of Telerik Reporting R3 2016, in the internal processing of reports, may affect reports using events upgraded to the latest version. For more details, please check [Changes on items in report events are not applied]({%slug changes-on-items-in-report-events-are-not-applied%}).
