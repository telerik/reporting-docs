---
title: NuGet V2 Feed Error about Returned Unexpected 401 Status Code
page_title: NuGet V2 Feed Error about Returned Unexpected 401 Status Code
description: "Learn how to fix the Telerik Nuget The V2 feed at ... returned an unexpected status code 401 Logon failed error."
type: troubleshooting
slug: nuget-feed-returned-unexpected-401-status-error
tags: telerik, reporting, nuget, installation, error, returned, unexpected, 40, status, code
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Private Telerik NuGet Feed</td>
		<td>Installation</td>
	</tr>
</table>

## Description

After changing my Telerik password, I get a Telerik NuGet V2 feed error about a returned unexpected status code 401.

## Error Message 

`[Telerik Nuget] The V2 feed at '...' returned an unexpected status code '401 Logon failed.'`

## Cause  

After changing your Telerik password, you need to reset your credentials in the `NuGet.config` file. 

## Solution 

To fix this issue, open a Command Prompt and run the following command: 
    
````powershell
NuGet Sources Update -Name "telerik.com" -Source "https://nuget.telerik.com/v3/index.json" -UserName "your login email" -Password "your new password"
````


