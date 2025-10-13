---
title: Shared Data Source
page_title: Shared Data Source - Web Report Designer User Guide
description: "Learn more about the SharedDataSource Component in Web Report Designer, where and how you may configure and use it in your Reports."
slug: shared-data-source-web-report-designer-user-guide
tags: shared,data,source,web,report,designer,design,create,report,web
published: True
reporting_area: WRDHTML5, WRDBlazorWrapper
position: 10
---

# SharedDataSource Component

A `Shared Data Source` in Web Report Designer is a reusable component that defines a connection to a data provider such as a database, web service, or file and can be used across multiple reports. Instead of configuring a data source separately for each report, you can create a shared one and reference it wherever needed.

## Configuring a Shared Data Source

To create a shared data source, locate an existing data source in the Web Report Designer. Click the ellipsis button (...) next to the data source and select "Save as Shared Data Source" from the context menu.

![Saving a data source as Shared](images/CreatingSharedDataSource.png)

After saving a data source as shared, the Web Report Designer generates a .sdsx file. This file represents the shared data source definition and can be opened directly in the designer for further configuration.

![Creating a SDSX file](images/CreatingSdsxFile.png)

To view all Shared Data Sources, open the Assets Manager from the main menu.

![Use Assets Manager to view your Shared Data Sources](images/AllSharedDataSources.png)

## Difference Between Shared Data Source and Data Source

In the Web Report Designer, both Data Source and Shared Data Source are used to define connections to external data. However, they differ in scope, usage, and maintainability.

| `Data Source` | `Shared Data Source` |
| ------ | ------ |
| Defined within a single report | Defined outside of individual reports and stored as a .sdsx file |
| Cannot be reused across other reports | Can be reused across multiple reports |
| Changes to the data source affect only the report where it is defined | Changes to the shared data source affect all reports that reference it |
| Suitable for simple or one-off reports | Ideal for centralized data management and large-scale reporting solutions |

## Creating SharedDataSource

## See Also

* [Web Report Designer User Guide: An Overview]({%slug user-guide/overview%})
* [App Tour of the Web Report Designer]({%slug user-guide/app-tour%})
* [Create a Simple Report]({%slug web-report-designer-user-guide-getting-started%})
