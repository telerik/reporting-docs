---
title: Managing Cache in the SQL Storage of the Reporting REST Service 
description: "Learn how to manage cache in Telerik Reporting to avoid database growth and manually clear cache data safely."
type: how-to
page_title: Clearing Growing Cache in the Reporting REST Service 
meta_title: Clearing Growing Cache in the Reporting REST Service 
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
    </tbody>
</table>

## Description

I encountered an issue where the cache in Telerik Reporting is not clearing automatically, causing certain database tables(e.g. **tr_String**, **tr_Object**) to grow indefinitely. 

Each report generated is unique, so caching doesn't provide much benefit in this setup. I need to either prevent caching entirely or ensure the cache is cleared to prevent database growth.

## Solution

The Reporting REST Service will *always* periodically trigger cache clean-ups. However, depending on how the service is used, the conditions required for a given asset to be considered **expired** in the cache may need more time to be met. We advise looking into the [Telerik Reporting REST Service Storage Revealed](https://www.telerik.com/blogs/telerik-reporting-rest-service-storage-revealed) blog post for more details on the topic.

With that being said, in the sections below, we will share some of the recommended approaches for clearing the storage more often.

### Adjusting the `ClientSessionTimeout` Property

 Use the [ClientSessionTimeout](/api/telerik.reporting.services.reportserviceconfiguration#telerik_reporting_services_reportserviceconfiguration_clientsessiontimeout) property to control the session expiration time. The default value is **15 minutes**.
 
- Avoid setting it to zero, as this causes sessions to expire immediately, leading to errors like "410 Gone" when rendering reports.
- Use a reasonable timeout value to balance performance and user experience.

### Manual Cache Cleanup

To manually clear cache data, use SQL queries during maintenance windows or off-peak hours. 

For example, execute the following query to identify and remove cache records based on a specific date threshold from the `tr_Oject` and `tr_String` tables. Start with a `SELECT` query to verify the results before running a `DELETE`.

#### SQL Query Example

```sql
SELECT TOP (1000) o.[Id], o.[Value]
FROM [RESTDB].[dbo].[tr_Object] o
INNER JOIN [RESTDB].[dbo].[tr_String] s
    ON LEFT(o.[Id], CHARINDEX('\', o.[Id], CHARINDEX('\', o.[Id]) + 1) - 1)
     = LEFT(s.[Id], CHARINDEX('\', s.[Id], CHARINDEX('\', s.[Id]) + 1) - 1)
WHERE s.[Id] LIKE '%\%\LCT'
  AND s.[Value] < '2026-01-01';
```

* Replace `'2026-01-01'` with an appropriate threshold date.
* After verifying the results, replace `SELECT` with `DELETE` to remove the records.

#### Additional Considerations

* Run manual cleanup during scheduled maintenance or off-peak hours to minimize disruptions.
* Ensure the `Reporting REST Service` is active for automatic cache cleanup to function correctly.

## See Also

* [Report Viewer and Reporting REST Services Cache Management](slug:telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services)
* [Telerik Reporting REST Service Storage Revealed](https://www.telerik.com/blogs/telerik-reporting-rest-service-storage-revealed)
