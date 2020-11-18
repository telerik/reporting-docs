---
title: How to Configure Postgres with Npgsql?
description: This KB article lists the required steps for configuring Postgres with Npgsql
type: how-to
page_title: How to Configure Postgres with Npgsql?
slug: configuring-postgres-with-npgsql
position: 
tags: 
ticketid: 1453133
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
This KB article lists the required steps for configuring [PostgreSQL](https://www.postgresql.org/) with Npgsql data provider.

## Solution for Npgsql version 3.2.7 
1. Install [Npgsql version 3.2.7](https://github.com/npgsql/npgsql/releases/tag/v3.2.7) by using the .MSI file.
Note that the [SqlDataSource](../sqldatasource) component will list and work with any ADO.NET provider that is correctly registered on the device;

2. Add **SQL Data Source** -> **Build new data connection** -> select **Npgsql Data Provider**;

3. Add the **Connection string** in the field. For example:
```
Host=reporting7x64.telerik.com;Username=postgres;Password=telerik;Database=postgres
```

4. Click **Next** -> fill in the **Select Statement** or use the **Query Builder** -> **Finish**.

## Solution for Npgsql after version 3.2.7 
1. Create a sample Console application and add Npgsql 4.1.4.0 as a NuGet package;

2. Copy the assemblies which are related to the data provider from the bin folder of the application;

3. Paste them to the folder of the Standalone designer;

4. Go to the App.config file of the application and copy the binding redirects;

5. Open the configuration file of the Standalone designer (Telerik.ReportDesigner.exe.config) and add the binding redirects:
```
  <runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <!--
      <probing privatePath="path-to-the-assemblies"/>
      -->
 . . . 
		 <dependentAssembly>
        <assemblyIdentity name="System.Numerics.Vectors" publicKeyToken="b03f5f7f11d50a3a" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-4.1.4.0" newVersion="4.1.4.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Runtime.CompilerServices.Unsafe" publicKeyToken="b03f5f7f11d50a3a" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-4.0.5.0" newVersion="4.0.5.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Buffers" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-4.0.3.0" newVersion="4.0.3.0" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.Threading.Tasks.Extensions" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-4.2.0.1" newVersion="4.2.0.1" />
      </dependentAssembly>
      <dependentAssembly>
        <assemblyIdentity name="System.ValueTuple" publicKeyToken="cc7b13ffcd2ddd51" culture="neutral" />
        <bindingRedirect oldVersion="0.0.0.0-4.0.3.0" newVersion="4.0.3.0" />
      </dependentAssembly>
    </assemblyBinding>
  </runtime>
```
6. Repeat the steps 2-4 from the previous section. 

