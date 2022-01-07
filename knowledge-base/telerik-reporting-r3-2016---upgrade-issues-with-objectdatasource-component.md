---
title: Upgrade issues with ObjectDataSource Component after Telerik Reporting R3 2016
description: Upgrade error with the ObjectDataSource Component after upgrading to R3 2016 or newer.
type: troubleshooting
page_title: The ObjectDataSource Component does not work after upgrading to R3 2016
slug: telerik-reporting-r3-2016---upgrade-issues-with-objectdatasource-component
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
    <tr>
		<td>Version</td>
		<td>R3 2016 and newer</td>
	</tr>
	<tr>
		<td>Report Item</td>
		<td>ObjectDataSource Component</td>
	</tr>
</table>

## Description

As of [R3 2016](../upgrade-path-2016-r3#api-breaking-changes) we provide stricter rules for external assemblies used by reports to get data. This is a breaking change that may lead to the following error on preview, even after running the [Upgrade Wizard](../ui-upgrade-wizard). 

## Error Message

```
An exception has occurred while processing 'REPORTNAME' item:

System.Security.SecurityException: The assembly "EXTERNAL_ASSEMBLY_TYPE" is not permitted to be used by an ObjectDataSource component. Please include it in an AssemblyReferences element in the Telerik.Reporting configuration section of your application configuration file.
```

## Possible Causes

- The assembly supposed to be used by the ObjectDataSource is not referenced in the application configuration file;

- The assembly is incorrectly referenced;

## Solution

 The ObjectDataSource component is designed to read the assembly information from the current project's configuration file. Thus, the assembly to be used by the [ObjectDataSource](../objectdatasource) component must be referenced in the **AssemblyReferences** element in the **Telerik.Reporting configuration section** of your application configuration file.     

1. The Standalone Report Designer tool's configuration file, if you intend to use an ObjectDataSource component - [Extending Report Designer](../standalone-report-designer-extending-configuration);

2. The configuration file of the project containing the Telerik Reports.  

3. The configuration file of the desktop application displaying/processing programmatically the report or the configuration file of the Reporting REST|WCF Service project, this place is where reports are handled for web viewers.

## Notes

It is recommended to keep reports in a separate project e.g. ClassLibrary project. *The ObjectDataSource component's settings can be added automatically by re-running the [ObjectDataSource Wizard](../objectdatasource-wizard) in Visual Studio Report Designer.*

## See Also

[Connecting the ObjectDataSource component to a Data Source](../objectdatasource-connecting)

[ObjectDataSource: Configuration](../objectdatasource#configuration)

