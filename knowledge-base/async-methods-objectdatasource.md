---
title: Using Async Methods with ObjectDataSource
page_title: How to Use Async Methods with ObjectDataSource
description: "Learn how to work with async methods in Telerik Reporting ObjectDataSource when binding data."
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
	</tbody>
</table>

## Description

When configuring an [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) with an async method that returns a `Task<T>`, the ObjectDataSource wizard displays `Task` members (such as `AsyncState`, `CreationOptions`, `IsCanceled`, etc.) instead of the actual data properties.

## Cause

The ObjectDataSource component does not currently support async methods. The reporting engine expects synchronous data retrieval and does not automatically await Task objects returned by async methods.

## Solution

If possible, use synchronous methods for data retrieval with ObjectDataSource. 

If you need to work with existing async methods, you can create a synchronous wrapper method:

````C#
public class MyData
{
    public int Id { get; set; }
    public string Name { get; set; }

    public static List<MyData> GetData()
    {
        return GetDataAsync().GetAwaiter().GetResult();
    }

    static async Task<List<MyData>> GetDataAsync()
    {
        List<MyData> resultList = null;
        await Task.Run(() =>
        {
            resultList = new List<MyData>()
            {
                new MyData() { Id = 1, Name = "One" },
                new MyData() { Id = 2, Name = "Two" },
                new MyData() { Id = 3, Name = "Three" },
            };
        });

        return resultList;
    }
}
````

In the ObjectDataSource configuration, use the synchronous `GetData()` method instead of `GetDataAsync()`.

## See Also

* [ObjectDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%})