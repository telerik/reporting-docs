---
title: Fixing "Error Loading the Report Viewer’s Templates" in Telerik Reporting 20.3.26.1110
description: "Learn how to resolve the 'Error loading the report viewer's templates' issue in Telerik Reporting 20.3.26.1110 caused by Kendo UI icon name changes."
type: troubleshooting
page_title: Telerik Reporting Template Error After Upgrade to 2026 Q4
meta_title: Telerik Reporting Template Error After Upgrade to 2026 Q4
slug: error-loading-report-viewer-templates-kendo-2026-q4
tags: reporting, templates, error, kendo ui, rest service
res_type: kb
ticketid: 1720508
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
            <td> 20.3.26.1110 </td> 
        </tr>
        <tr>
            <td> Report Viewer </td>
            <td> HTML5 Report Viewer and Wrappers </td> 
        </tr>
    </tbody>
</table>

## Description

After I updated to my application to use [Progress® Telerik® Reporting 2026 Q4 (20.3.26.1110)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q4-(20-3-26-1110)) and [Kendo UI for jQuery 2026.4.1111 (2026 Q4)](https://www.telerik.com/support/whats-new/kendo-ui/release-history/kendo-ui-for-jquery-2026-4-1111-(2026-q4)), the HTML5 Report Viewer no longer renders on the page. Instead, the error message pasted below is displayed in place of the report viewer.

## Error Message

```text
Error loading the report viewer's templates
```

## Cause

This problem is caused by the latest version of [Kendo UI for jQuery 2026.4.1111 (2026 Q4)](https://www.telerik.com/support/whats-new/kendo-ui/release-history/kendo-ui-for-jquery-2026-4-1111-(2026-q4)), which includes changes to icon names, specifically renaming the icon used for closing notifications from `x-outline` to `x-circle`. The mismatch in icon names in the viewer's template results in the error.

## Solution

To resolve the issue, use one of the following solutions:

### Solution 1: Use an Older Version of Kendo UI

- Preferably, use the built-in custom kendo bundle that the report viewer loads automatically when no kendo is loaded on the page. The Kendo UI for jQuery version used in that release of Telerik Reporting is [Kendo UI for jQuery 2026.3.811 (2026 Q3)](https://www.telerik.com/support/whats-new/kendo-ui/release-history/kendo-ui-for-jquery-2026-3-811-(2026-q3))
- If not, use the following URL to reference the previous Kendo UI version in your project:

   ```html
   <script src="https://cdn.jsdelivr.net/npm/@progress/kendo-ui@2026.3.1015/umd/kendo.all.min.js"></script>
   ```

> important If a Kendo other than the report viewer's built-in bundle is used, it is necessary to provide a valid license for the Kendo UI controls to render as expected - [Licensing in Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui/documentation/intro/installation/licensing/overview)   


### Solution 2: Replace Icon Name in GetResource Endpoint

The `GetResource` method of the `ReportsController` can be overridden. After getting the default response from the `base` implementation, you may replace the `x-outline` string in the response's content with `x-circle`. 

For example:

```C# .NET
 public override IActionResult GetResource(string folder, string resourceName)
{
    var response = base.GetResource(folder, resourceName);

    if (response is FileStreamResult resource &&
        string.Equals(folder, "templates", StringComparison.OrdinalIgnoreCase))
    {
        using var reader = new StreamReader(resource.FileStream, Encoding.UTF8);
        var template = reader.ReadToEnd();
        return this.Content(template.Replace("x-outline", "x-circle"), "text/html", Encoding.UTF8);
    }

    return response;
}
```
```C# .NET Framework
public override HttpResponseMessage GetResource(string folder, string resourceName)
{
    var response = base.GetResource(folder, resourceName);

    if (response.IsSuccessStatusCode && response.Content != null &&
        string.Equals(folder, "templates", System.StringComparison.OrdinalIgnoreCase))
    {
        var content = response.Content;
        var template = content.ReadAsStringAsync().GetAwaiter().GetResult();
        response.Content = new StringContent(template.Replace("x-outline", "x-circle"), Encoding.UTF8, "text/html");
        content.Dispose();
    }

     return response;
}
```

If the [Minimal API Approach is used for integrating the Reporting service](slug:how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api), you can fix the template with response-rewriting middleware, which must be added before `app.UseTelerikReporting()`.

For example:

```C#
app.Use(async (context, next) =>
{
    if (!HttpMethods.IsGet(context.Request.Method) ||
        !context.Request.Path.StartsWithSegments(
            "/api/reports/resources/templates",
            StringComparison.OrdinalIgnoreCase))
    {
        await next(context);
        return;
    }

    var originalBody = context.Response.Body;
    using var buffer = new MemoryStream();
    context.Response.Body = buffer;

    try
    {
        await next(context);

        buffer.Position = 0;
        context.Response.Body = originalBody;

        if (context.Response.StatusCode is >= 200 and < 300)
        {
            using var reader = new StreamReader(buffer, Encoding.UTF8);
            var template = await reader.ReadToEndAsync(context.RequestAborted);
            var content = Encoding.UTF8.GetBytes(template.Replace("x-outline", "x-circle"));

            context.Response.ContentType = "text/html; charset=utf-8";
            context.Response.ContentLength = content.Length;

            await originalBody.WriteAsync(content, context.RequestAborted);
        }
        else
        {
            await buffer.CopyToAsync(originalBody, context.RequestAborted);
        }
    }
    finally
    {
        context.Response.Body = originalBody;
    }
});

app.UseTelerikReporting();
```

### Solution 3: Update the Template Locally

1. Download the default template from the following URL or use the response template:
   [Telerik Report Viewer Template](https://cdn.jsdelivr.net/npm/@progress/telerik-jquery-report-viewer@32.26.1110/dist/templates/telerikReportViewerTemplate.html)
2. Save the template locally in your project directory.
3. Open the downloaded template file and locate the line that specifies the `x-outline` icon (usually line 20).
4. Replace `x-outline` with `x-circle`.
5. Update your viewer's configuration to reference the local template. For configuration instructions, refer to the [Providing Custom Templates to the HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates)

Example configuration for referencing the local template:

```JavaScript
$("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports",
    templateUrl: "path-to-local-template/telerikReportViewerTemplate.html",
    reportSource: {
        report: "Dashboard.trdp"
    }
});
```
