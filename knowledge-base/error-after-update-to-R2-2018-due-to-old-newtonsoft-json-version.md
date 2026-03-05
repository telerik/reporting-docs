---
title: Error after upgrading to R2 2018 - The 'ObjectContent`1' type failed to serialize the response body for content type 'application/json; charset=utf-8'.
description: Error registering the viewer with the service. An error has occurred. The 'ObjectContent`1' type failed to serialize the response body for content type 'application/json; charset=utf-8'.
type: troubleshooting
page_title: Upgrading to version after R2 2018 causes error "The 'ObjectContent`1' type failed to serialize the response body for content type 'application/json; charset=utf-8'"
slug: error-after-update-to-R2-2018-due-to-old-newtonsoft-json-version
ticketid: 1175890
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product Version</td>
		<td>12.1.18.516-16.2.22.1109</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>

## Error Message

```TEXT
Error registering the viewer with the service.
An error has occurred.
The 'ObjectContent`1' type failed to serialize the response body for content type 'application/json; charset=utf-8'.
```

## Description

> important Starting with version `20.0.26.211`, the .NET-based Reporting services now use [`System.Text.Json`](https://www.nuget.org/packages/System.Text.json).

An error with the above message occurs after an update from a version prior to `12.1.18.516` to version `12.1.18.516` or above. The exception is related to _Newtonsoft.Json_ version that is referred in the project.

Starting with the [Telerik Reporting R2 2018 (12.1.18.516)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-12-1-18-516) release, up to [Progress® Telerik® Reporting R3 2022 SP1 (16.2.22.1109)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2022-sp1-16-2-22-1109), the assemblies and NuGet packages depending on `Newtonsoft.Json` require `9.0.1` or newer version of the NuGet package. With prior versions we needed `Newtonsoft.Json` (`4.5.11.15520` or later).

## Solution

Update the _Newtonsoft.Json_ NuGet package referred in the project to at least version `9.0.1`. If you update to a newer version, include/modify the corresponding `bindingRedirect` for `Newtonsoft.Json` in the configuration file of the project (`Web.config`/`App.config`).

```XML
<configuration>
  <runtime>
      <dependentAssembly>
        <assemblyIdentity name="Newtonsoft.Json" culture="neutral" publicKeyToken="30ad4fe6b2a6aeed" />
        <bindingRedirect oldVersion="0.0.0.0-X.X.X.X" newVersion="X.X.X.X" />
      </dependentAssembly>
    </assemblyBinding>
  </runtime>
</configuration>
```

`X.X.X.X` stands for the actual version of the referred `Newtonsoft.Json` assembly version (for example, `11.0.0.0`).

Rebuild the project after the update.
