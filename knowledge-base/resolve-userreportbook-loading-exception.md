---
title: The type UserReportBook cannot be loaded
description: "Learn how to address the exception encountered when opening ReportBooks after updating to Telerik Reporting version 18.2.24.924."
type: troubleshooting
page_title: Fix type UserReportBook cannot be loaded Error
slug: resolve-userreportbook-loading-exception
tags: telerik, reporting, reportbook, exception, configuration, typereferences
res_type: kb
ticketid: 1666256
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
<td>18.2.24.924</td>
</tr>
</table>

## Description

After installing the latest version of Telerik Reporting (18.2.24.924) and selecting the .NET 8 version, an exception occurs when trying to open a ReportBook (.trdp file) from the examples using the Standalone Report Designer. The error message indicates that the reporting engine prevents loading types not listed as trusted or essentially needed.

## Cause

The issue is due to type restriction changes introduced in Telerik Reporting version 18.2.24.924. These changes enhance application security by preventing the loading of untrusted or unnecessary types.

## Solution

To resolve this issue and use Report Books with version 18.2.24.924, register the necessary type in the `typeReferences` element in the configuration file of your project (e.g., `appsettings.json`). This workaround involves adding the `Telerik.Reporting.UserReportBook` type as a trusted type.

Insert the following configuration in your project's configuration file:

```json
"telerikReporting": {
    "typeReferences": [
        {
            "typeName": "Telerik.Reporting.UserReportBook",
            "assemblyName": "Telerik.Reporting",
            "publicKeyToken": "a9d7983dfcc261be"
        }
    ]
}
```

This configuration explicitly declares the `Telerik.Reporting.UserReportBook` type as trusted, allowing the Telerik Reporting engine to load it without triggering the security exception.

## See Also

- [Type Restrictions in Telerik Reporting](https://docs.telerik.com/reporting/upgrade/2024/2024-q3-18-2-24-924#type-restrictions)
- [TypeReferences Element Configuration - Telerik Reporting](https://docs.telerik.com/reporting/doc-output/configure-the-report-engine/typereferences-element)
