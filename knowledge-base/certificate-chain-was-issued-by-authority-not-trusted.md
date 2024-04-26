---
title:  The certificate chain was issued by an authority that is not trusted
description: "Learn how to troubleshoot the issue where the Query Builder cannot open when using the new SqlClient data provider in Visual Studio Report Designer."
type: troubleshooting
page_title: An error occurred during the login process - Authority not trusted
slug: certificate-was-issued-by-authority-not-trusted
position: 
tags: SqlDataSource, MSSQL Server, Microsoft.Data.SqlClient, Query Builder, Query Designer
res_type: kb
---


## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Component</td>
			<td>SqlDataSource</td>
		</tr>
	</tbody>
</table>

## Description

When attempting to use the [Query Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/query-designer-in-the-standalone-designer%}) in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) or in the other [Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}) when explicitly having selected the `Microsoft.Data.SqlClient` data provider, the connection fails during the login process.

## Error Message

`SqlException (0x80131904): A connection was successfully established with the server, but then an error occurred during the login process. (provider: SSL Provider, error: 0 - The certificate chain was issued by an authority that is not trusted.)]`

## Cause

In versions 4.0.0 or newer of the `Microsoft.Data.SqlClient` data provider, the default value of the `Encrypt` connection setting has been changed from `false` to `true` as an attempt to improve the security with the default settings.

## Solution

### Short-term Solution

Use`TrustServerCertificate=True` in the connection string. The SQL Server will create a self-signed certificate if you don't install one for it to use, but it won't be trusted by the caller since it's not CA-signed, unless you tell the connection string to trust any server cert by default.

### Long-term Solution

Install a CA-signed certificate from a trusted CA such as [Let's Encrypt`](https://letsencrypt.org/).

## See Also

* [Release notes for Microsoft.Data.SqlClient 4.0](https://learn.microsoft.com/en-us/sql/connect/ado-net/introduction-microsoft-data-sqlclient-namespace?view=sql-server-ver15#breaking-changes-in-40)
* ["The certificate chain was issued by an authority that is not trusted" when connecting DB in VM Role from Azure website](https://stackoverflow.com/questions/17615260/the-certificate-chain-was-issued-by-an-authority-that-is-not-trusted-when-conn)
* [Let's Encrypt`](https://letsencrypt.org/)
