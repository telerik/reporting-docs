---
title: Managing Cache in Telerik Reporting and Preventing Database Growth
description: Learn how to manage cache in Telerik Reporting to avoid database growth and manually clear cache data safely.
type: how-to
page_title: Clearing Growing Cache in Telerik Reporting
meta_title: Clearing Growing Cache in Telerik Reporting
slug: managing-cache-telerik-reporting
tags: telerik, reporting, cache, mssqlserverstorage, clientsessiontimeout
res_type: kb
ticketid: 1712138
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td>
Reporting
</td>
</tr>
<tr>
<td> Version </td>
<td> 20.0.26.211 </td>
</tr>
</tbody>
</table>

## Description

I encountered an issue where the cache in Telerik Reporting is not clearing automatically, causing certain database tables to grow indefinitely. Tables such as `tr_Set`, `tr_Object`, and `tr_String` are affected. Each report generated is unique, so caching doesn't provide much benefit in this setup. I need to either prevent caching entirely or ensure the cache is cleared automatically to prevent database growth.

This knowledge base article also answers the following questions:
- How to clear Telerik Reporting cache to avoid database growth?
- Can I disable caching entirely in Telerik Reporting?
- How to automate manual cleanup of cache in Telerik Reporting?

## Solution

To manage caching effectively and prevent database growth, follow these steps:

### Adjusting `ClientSessionTimeout` Property

1. Use the [ClientSessionTimeout](https://docs.telerik.com/reporting/api/telerik.reporting.services.reportserviceconfiguration.html#Telerik_Reporting_Services_ReportServiceConfiguration_ClientSessionTimeout) property to control the session expiration time. The default value is 15 minutes.
2. Avoid setting it to zero, as this causes sessions to expire immediately, leading to errors like "410 Gone" when rendering reports.
3. Use a reasonable timeout value to balance performance and user experience.

### Manual Cache Cleanup

To manually clear cache data, use SQL queries during maintenance windows or off-peak hours. Execute the following query to identify and remove cache records based on a specific date threshold. Start with a `SELECT` query to verify the results before running a `DELETE` query.

#### SQL Query Example
```sql
SELECT TOP (1000) o.[Id], o.[Value]
FROM [RESTDB].[dbo].[tr_Object] o
INNER JOIN [RESTDB].[dbo].[tr_String] s
    ON LEFT(o.[Id], CHARINDEX('\', o.[Id], CHARINDEX('\', o.[Id]) + 1) - 1)
     = LEFT(s.[Id], CHARINDEX('\', s.[Id], CHARINDEX('\', s.[Id]) + 1) - 1)
WHERE s.[Id] LIKE '%\%\LCT'
  AND s.[Value] < '2026-02-03';
```

- Replace `'2026-02-03'` with an appropriate threshold date.
- After verifying the results, replace `SELECT` with `DELETE` to remove the records.

#### Additional Considerations
- Run manual cleanup during scheduled maintenance or off-peak hours to minimize disruptions.
- Ensure the `Reporting REST Service` is active for automatic cache cleanup to function correctly.

### Automating Cache Cleanup

1. Use a SQL script or stored procedure to automate deletion of old cache records based on a time threshold.
2. Schedule the script to run regularly to prevent database growth.

### Important Notes

- Restarting or redeploying the service does not trigger cache cleanup.
- Ensure the service runs continuously to allow automatic cache cleaning.
- Avoid deleting active cache records manually, as this may disrupt active report sessions.

## See Also

- [HTML5 Report Viewer and Reporting REST Services Cache Management](https://docs.telerik.com/reporting/using-telerik-reporting-in-applications-rest-service-cache-management-overview)
- [Telerik Reporting Troubleshooting in ASP.NET Core](https://www.telerik.com/products/reporting/documentation/knowledge-base/how-to-troubleshoot-errors-in-asp-net-core-applications)
- [MsSqlServerStorage API Documentation](https://docs.telerik.com/reporting/api/telerik.reporting.cache.mssqlserverstorage)
- [ClientSessionTimeout API Documentation](https://docs.telerik.com/reporting/api/telerik.reporting.services.reportserviceconfiguration.html#Telerik_Reporting_Services_ReportServiceConfiguration_ClientSessionTimeout)
