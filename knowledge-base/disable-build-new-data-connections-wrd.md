---
title: How to Disable "Build new data connections" in the SqlDataSource wizard of the Web Report Designer
description: Learn how to restrict the "Build new data connections" option in the "Choose data connection" window of the SqlDataSource wizard of the Web Report Designer while allowing users to select from existing data connections.
type: how-to
page_title: How to Disable "Build New Data Connections" in Web Report Designer
meta_title: How to Disable "Build New Data Connections" in Web Report Designer
slug: restricting-build-new-data-connections-report-designer
tags: reporting, reportdesigner, datasource, connections, middleware
res_type: kb
---

## Environment

<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td> Reporting </td>
        </tr>
        <tr>
            <td> Version </td>
            <td> 19.2.25.1001 </td>
        </tr>
    </tbody>
</table>

## Description

I need to prevent users from creating new database connections in the Web Report Designer's SqlDataSource component while still allowing them to select from pre-configured existing connections.

## Solution

To achieve this behavior, use a middleware to intercept the `/api/reportdesigner/connectionspermissions` request and modify the response. By returning an empty JSON or an object with all values set to `false`, you can disable the "Build new data connections" option.

```csharp
app.Use(async (context, next) =>
{
    if (context.Request.Path.Equals("/api/reportdesigner/connectionspermissions"))
    {
        context.Response.ContentType = "application/json";
        await context.Response.WriteAsync("{}"); // Return empty JSON to disable "Build new connections".
        return;
    }

    await next();
});
```

## See Also

* [Web Report Designer Overview]({%slug web-report-designer/overview%})
* [SqlDataSource Wizard Overview]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/sqldatasource-wizard%})