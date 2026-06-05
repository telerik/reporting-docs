---
title: Using Async Methods with ObjectDataSource
page_title: How to Use Async Methods with ObjectDataSource
description: "Learn how to work with async methods in Telerik Reporting ObjectDataSource when binding data. Async methods are natively supported as of 2026 Q1 (20.0.26.402)."
slug: objectdatasource-does-not-support-async-methods
tags: telerik, reporting, objectdatasource, async, await, task, data binding
published: True
type: troubleshooting
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Version</td>
			<td>Prior to 20.0.26.402</td>
		</tr>
	</tbody>
</table>

## Description

When configuring an [ObjectDataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview) with an **async** method that returns a `Task<T>`, the ObjectDataSource wizard displays `Task` members (such as `AsyncState`, `CreationOptions`, `IsCanceled`, etc.) instead of the actual data properties.

## Cause

In versions prior to 2026 Q1 (20.0.26.402), the ObjectDataSource component does not support async methods. The reporting engine expects synchronous data retrieval and does not automatically await `Task` objects returned by async methods.

> As of [Telerik Reporting 2026 Q1 (20.0.26.402)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q1-(20-0-26-402)), the ObjectDataSource component natively supports async methods that return `Task` and `ValueTask`. No workaround is needed for that version and later.

## Solution

If you are using Telerik Reporting 2026 Q1 (20.0.26.402) or later, async methods returning `Task` and `ValueTask` are supported natively. No changes are required.

If you are using an earlier version and cannot upgrade, use synchronous methods for data retrieval with ObjectDataSource. If you need to work with existing async methods, you can create a synchronous wrapper method:

```C#
public class MyData
{
    public int Id { get; set; }
    public string Name { get; set; }

    public static List<MyData> GetData()
    {
        return GetDataAsync().GetAwaiter().GetResult();
    }

    static Task<List<MyData>> GetDataAsync()
    {
        var resultList = new List<MyData>
        {
            new MyData { Id = 1, Name = "One" },
            new MyData { Id = 2, Name = "Two" },
            new MyData { Id = 3, Name = "Three" },
        };

        return Task.FromResult(resultList);
    }
}
```

In the ObjectDataSource configuration or [ObjectDataSource Wizard](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard), use the synchronous `GetData()` method instead of `GetDataAsync()`.

## See Also

* [Update the Designer Configuration File through the UI](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer#update-the-designer-configuration-file-through-the-ui)
* [Connecting the ObjectDataSource Component to a Data Source](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source)
* [ObjectDataSource Component](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview)
