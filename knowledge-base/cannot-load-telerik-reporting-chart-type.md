---
title: Cannot Load Telerik.Reporting.Chart Type
page_title: Cannot Load Telerik.Reporting.Chart Type Error
description: "Learn how to resolve the error when Telerik.Reporting.Chart or Telerik.Reporting.Processing.Chart types cannot be loaded due to security restrictions in the report engine."
slug: cannot-load-telerik-reporting-chart-type
tags: telerik, reporting, chart, type, cannot, load, assembly, security, typereferences
published: True
type: troubleshooting
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

## Description

When attempting to render a report that uses the obsolete `Telerik.Reporting.Chart` report item, an error occurs stating that the type cannot be loaded:

````
The type "Telerik.Reporting.Chart" contained in assembly "Telerik.Reporting, Version=X.X.X.X, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" cannot be loaded.
````

or

````
The type "Telerik.Reporting.Processing.Chart" contained in assembly "Telerik.Reporting, Version=X.X.X.X, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" cannot be loaded.
````

## Cause

This is expected behavior. The `Telerik.Reporting.Chart` type (and its processing counterpart `Telerik.Reporting.Processing.Chart`) contains security vulnerabilities and is therefore not automatically registered by the Telerik Reporting engine.

To help improve the application's security, the reporting engine prevents loading types that are not explicitly permitted or listed as trusted by the user.

## Solution

The Chart report item is now superseded by the more advanced [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) report item. It is highly recommended to migrate your reports from the obsolete Chart item to the Graph item.

If you need to continue using the obsolete Chart item, explicitly register the type by adding a [typeReference]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeReferences-element%}) in your application's configuration file:

````xml
<configuration>
  <configSections>
    <section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere"/>
  </configSections>
  <Telerik.Reporting>
    <typeReferences>
      <add typeName="Telerik.Reporting.Processing.Chart" assemblyName="Telerik.Reporting" publicKeyToken="a9d7983dfcc261be" />
      <add typeName="Telerik.Reporting.Chart" assemblyName="Telerik.Reporting" publicKeyToken="a9d7983dfcc261be" />
    </typeReferences>
  </Telerik.Reporting>
</configuration>
````

After adding this configuration, the Chart item should render without the type loading error. However, be aware that this explicitly allows a type with known security vulnerabilities.

## See Also

- [Chart Report Item Overview (Obsolete)]({%slug telerikreporting/designing-reports/report-structure/chart-(obsolete)%})
- [Graph Report Item]({%slug telerikreporting/designing-reports/report-structure/graph/overview%})
- [TypeReferences Configuration Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeReferences-element%})
