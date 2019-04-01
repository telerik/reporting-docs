---
title: TypeError Argument 8 of StorageEvent.initStorageEvent does not implement interface Storage
description: This article elaborates on the error message recieved in the browser console prior to version 9.1.15.702
type: troubleshooting
page_title: TypeError Failed to execute 'initStorageEvent' on 'StorageEvent' parameter 8 is not of type 'Storage'
slug: error-failed-to-execute-initstorageevent-on-storageevent
position: 
tags: RestService
ticketid: 1402193
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>prior to 9.1.15.702</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description


## Error Message
```
TypeError: Argument 8 of StorageEvent.initStorageEvent does not implement interface Storage.
```

or 

```
TypeError: Failed to execute 'initStorageEvent' on 'StorageEvent': parameter 8 is not of type 'Storage'.
```

## Solution
This is a known issue fixed in internal build v9.1.15.702. It can be downloaded after logging into your [Telerik account](https://www.telerik.com/account). Once you log in, you should go to the *Downloads* page, locate *Progress Telerik Reporting* product and when you click on it, a download page should appear, showing the last main build and the latest internal build. 

After installing you will have to run the [Upgrade Wizard](https://docs.telerik.com/reporting/ui-upgrade-wizard).

