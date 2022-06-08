---
title: Data provider is missing in the SqlDataSource Wizard.
description: The SqlDataSource Wizard cannot find the selected data provider.
type: troubleshooting
page_title: Data provider is not found by the SqlDataSource wizard.
slug: data-provider-is-missing-in-the-sqldatasource-wizard
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
  	<tr>
		<td>Report Item</td>
		<td>SqlDataSource component</td>
	</tr>
</table>

## Desciption

The [SqlDataSource component]({% slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview %}) would list and work with any [ADO.NET provider](http://msdn.microsoft.com/en-us/library/h43ks021.aspx) that is correctly
registered on the device. 

The list with ADO.NET providers is taken as described in [Obtaining the DbProviderFactory](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/obtaining-a-dbproviderfactory) article and lists all of the provider factories registered in the **machine.config**.
  
## Solution

For instance, if MySQL provider is not registered correctly, but shows in Visual Studio, this means its installation has only registered it in Visual Studio and you can open
**devenv.exe.config** to get the provider details and add it manually to the config file of the standalone designer(**Telerik.ReportDesigner.exe.config**). 

If it is not listed in Visual Studio either, then most likely your installation of the MySQL ADO<span>.</span>NET provider did not
complete successfully and you can try upgrading to a newer version, or repairing.

## See Also

[How to register SqlDataSource data providers without driver installation](./how-to-register-sqldatasource-data-providers-without-driver-installation)
