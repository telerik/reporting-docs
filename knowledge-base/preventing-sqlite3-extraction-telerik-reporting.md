---
title: Preventing SQLite3.dll Extraction
description: Learn how to mitigate risks and prevent SQLite3.dll from being extracted in ProgramData\Telerik\Reporting during runtime.
type: how-to
page_title: Stopping SQLite3.dll Extraction in ProgramData Folder for Telerik Reporting
meta_title: Stopping SQLite3.dll Extraction in ProgramData Folder for Telerik Reporting
slug: preventing-sqlite3-extraction-telerik-reporting
tags: reporting, sqlite3.dll, programdata, map, file-permissions, vulnerabilities
res_type: kb
ticketid: 1703464
---

## Environment
<table>
   <tbody>
      <tr>
         <td>Product</td>
         <td>Telerik Reporting</td>
      </tr>
      <tr>
         <td>Version</td>
         <td>Current</td>
      </tr>
   </tbody>
</table>

## Description

Telerik Reporting uses SQLite internally to store the cache for the [Map]({%slug map_report_item_overview%}) item. During runtime, the SQLite3.dll file is extracted to the `ProgramData\Telerik\Reporting` folder. If the Map item is not used in your reports, SQLite-related code is not executed, and vulnerabilities associated with the SQLite3.dll (e.g., CVE-2025-6965) do not pose a risk.

## Solution

To prevent SQLite3.dll from being extracted in the `ProgramData\Telerik\Reporting` folder:

1. Avoid using the Map item in your reports. If the Map item is not used, no SQLite-related code is executed.
1. Implement restrictive permissions on the `ProgramData\Telerik\Reporting` folder to limit access to trusted users and processes only:
   - Navigate to the folder's properties.
   - Under the Security tab, configure permissions to allow access only to necessary users and processes.
1. Run the reporting application in a sandboxed or restricted environment to minimize the impact of potential exploits.

## See Also

* [Telerik Reporting Map Overview]({%slug map_report_item_overview%})
* [Telerik Reporting Release History](https://www.telerik.com/support/whats-new/reporting/release-history)
