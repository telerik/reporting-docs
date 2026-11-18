---
title: Standalone Telerik Report Designer "File Contains Corrupted Data" Error
description: Resolving the "File contains corrupted data" error when saving reports directly to the Telerik Report Server using the Standalone Report Designer.
type: troubleshooting
page_title: Fixing "File Contains Corrupted Data" in Standalone Telerik Report Designer
meta_title: Fixing "File Contains Corrupted Data" in Standalone Telerik Report Designer
slug: standalone-report-designer-file-corrupted-error
tags: reporting, standalone designer, report server, file corrupted error, serialization
res_type: kb
ticketid: 1720587
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
<td>20.3.26.1110</td>
</tr>
</tbody>
</table>

## Description

When attempting to save a blank report directly to the Telerik Report Server using the Standalone Telerik Report Designer, an error stating "File contains corrupted data" occurs. Saving the report locally first and then uploading it to the Report Server works as a workaround but is inconvenient.

## Cause

This issue occurs due to serialization differences between the older Standalone Telerik Report Designer (built on .NET Framework 4.6.2) and the new Report Server (built on .NET). Reports created with different versions of the designer and server may not be compatible due to changes in serialization.

## Solution

To resolve this issue, follow these steps:

1. Ensure that the Standalone Telerik Report Designer version matches the Telerik Report Server version. Use the .NET version of the designer with the .NET version of the server.
2. Download the latest Telerik Reporting installer, which contains both the .NET Framework and .NET versions of the Standalone Designer.
3. After installation, ensure that you are launching the appropriate executable for the .NET version of the Standalone Telerik Report Designer from the Start Menu. The executable for the .NET Framework version and the .NET version may both appear in the Start Menu.

Additionally, you can enable the Standalone Telerik Report Designer directly from the Report Server for .NET and use it from within the server.

## See Also

- [Telerik Reporting Documentation](https://docs.telerik.com/reporting/overview)
- [Standalone Report Designer Overview](https://docs.telerik.com/reporting/standalone-report-designer-overview)
- [Telerik Report Server Documentation](https://docs.telerik.com/report-server/overview)
