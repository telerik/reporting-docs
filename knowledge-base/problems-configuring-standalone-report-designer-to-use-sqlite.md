---
title: Problems Configuring Standalone Report designer to Use SQLite
description: Such an error might be thrown while configuring the Standalone Report designer to use SQLite
type: troubleshooting
page_title: The type initializer for System.Data.SQLite.SQLiteFactory threw an exception
slug: problems-configuring-standalone-report-designer-to-use-sqlite
position: 
tags: 
ticketid: 1504207
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


## Error Message
System.TypeInitializationException: The type initializer for 'System.Data.SQLite.SQLiteFactory' threw an exception. ---> System.DllNotFoundException: Unable to load DLL 'SQLite.Interop.dll': The specified module could not be found. (Exception from HRESULT: 0x8007007E)

## Cause\Possible Cause(s)
This error indicated that the SQLite.Interop.dll cannot be found.

## Solution
Copy the SQLite.Interop.dll to the folder of the Standalone designer. Make sure that you are adding the DLL with the correct version (x86/x64) from the SQLite directory.
