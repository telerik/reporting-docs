---
title: Data provider is missing in the SqlDataSource wizard
description: Data provider is missing in the SqlDataSource wizard.
type: how-to
page_title: Data provider is missing in the SqlDataSource wizard
slug: data-provider-is-missing-in-the-sqldatasource-wizard
res_type: kb
---

## Desciption
The [SqlDataSource component](../sqldatasource) would list and work with any [ADO.NET provider](http://msdn.microsoft.com/en-us/library/h43ks021.aspx) that is correctly
registered on the device. The list with ADO.NET providers is taken as described in [Obtaining the DbProviderFactory](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/obtaining-a-dbproviderfactory) article and lists all of the provider factories registered in the **machine.config**.
  
   
For instance, if MySQL provider is not registered correctly, but shows in Visual
Studio, this means its installation has only registered it in Visual Studio and you can open
**devenv.exe.config** to get the provider details and add it manually to
the config file of the standalone designer
(**Telerik.ReportDesigner.exe.config**). If it is not listed in Visual Studio either,
then most likely your installation of the MySQL ADO<span>.</span>NET provider did not
complete successfully and you can try upgrading to a newer version or
repair.

