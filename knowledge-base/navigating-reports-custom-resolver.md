```markdown
---
title: Adapting NavigateToReport for Custom ReportSource Resolvers
description: Learn how to adapt custom report resolvers inheriting UriReportSourceResolver for NavigateToReport actions after security changes in the 2026 Q2 (20.1.26.520) release.
type: how-to
page_title: Resolving NavigateToReport Issues with Custom Resolvers in Reporting
meta_title: Resolving NavigateToReport Issues with Custom Resolvers in Reporting
slug: navigating-reports-custom-resolver
tags: reporting,resolver,navigatetoreport,hash-uri
res_type: kb
ticketid: 1714961
---

## Environment
<table>
<tbody>
<tr>
<td>Product</td>
<td>Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>20.1.26.520 and later</td>
</tr>
</tbody>
</table>

## Description

After upgrading to the [2026 Q2 (20.1.26.520)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q2-(20-1-26-520)) release, NavigateToReport actions no longer pass the report name or path in the `ResolveReport(string report)` method of the UriReportSourceResolver as before. Instead, the method now receives a hash-based string. This change ensures better security and caching, but may break existing implementations of custom resolvers overriding  `ResolveReport`.

This knowledge base article also answers the following questions:
- How to adjust a custom report resolver for NavigateToReport changes?
- Why does UriReportSourceResolver .ResolveReport return null for NavigateToReport URIs?
- How to use subfolders in a custom report resolver?

## Solution

To adapt your custom report resolver for the changes:

1. **Understand Hash-Based URIs in NavigateToReport**:

   - The `report` parameter in the `ResolveReport` method now represents a hash-based URI.
   - The hash-to-URI mapping is managed by the Reporting REST Service's storage.

1. **Update the Custom Resolver**:

   - Use the `UriReportSourceResolver.ResolveReport(report)` method to resolve the hashed URI.
   - Ensure your base UriReportSourceResolver is configured with the correct `reportsPath`.

   Example:
```CSharp
public class CustomUriReportSourceResolver: UriReportSourceResolver
{
    public CustomUriReportSourceResolver(string reportsPath): base(reportsPath)
    {
    }
    protected override ReportSource ResolveReport(string report)
    {
        var reportResolvedPath = base.ResolveReport(report);
        return reportResolvedPath;
    }
}
```

1. **Set the Correct `reportsPath`**:

   - Ensure the `reportsPath` includes the root folder containing all report files.
   - If reports are in subfolders, the `report` parameter passed from the viewer must include the subfolder name.

1. **Handle Subfolders**:

   - Ensure subfolder names are part of the `report` parameter in the viewer's `ReportSource.Uri`.
   - For example, use `'SubfolderName\ReportName.trdp'` instead of just `'ReportName.trdp'`.

1. **Troubleshooting `base.ResolveReport` Returning Null**:

   - If `base.ResolveReport(report)` returns `null`, the hash-to-URI mapping is not available in the reporting service's storage.
   - Ensure that the `reportsPath` received by the UriReportSourceResolver constructor, when concatenated with the `reportSource.report` passed from the viewer, or from the NavigateToReport action, matches the expected path to your reports.

## See Also

- [Telerik Reporting Documentation](https://docs.telerik.com/reporting)
- [Report Sources Configuration](https://docs.telerik.com/reporting/report-sources-overview)
- [REST Service Configuration](https://docs.telerik.com/reporting/rest-service-overview)
- [Custom Report Resolver Example](https://docs.telerik.com/reporting/extend-reporting/custom-report-resolver)
```
