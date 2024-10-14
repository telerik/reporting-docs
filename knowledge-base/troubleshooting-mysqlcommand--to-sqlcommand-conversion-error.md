---
title: MySqlCommand tp SqlCpmmand Conversion Error
description: "Learn how to resolve the MySqlCommand conversion error when using Stored Procedures with a MySQL database in Telerik Reporting.
type: troubleshooting"
page_title: Fix MySqlCommand to SqlCommand Conversion Error with Stored Procedures
slug: troubleshooting-mysqlcommand--to-sqlcommand-conversion-error
tags: telerik, reporting, mysql, stored-procedures, conversion-error
res_type: kb
ticketid: 1667172
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>18.2.24.924</td>
</tr>
</table>

## Description

After updating to Telerik Reporting version 18.2.24.924, an error occurs when retrieving data using SqlDataSource with Stored Procedures on a MySQL database. The error indicates that `Mysql.Data.MySqlClient.MySqlCommand` cannot be converted to type `System.Data.SqlClient.SqlCommand`. This issue affects the execution of Stored Procedures, both with and without parameters.

## Cause

The issue is caused by a change in the code of Telerik Reporting version 18.2.24.924, which affects the compatibility with the MySQL Connection/NET data provider when using Stored Procedures. Inline SQL queries work as expected, but Stored Procedures throw a conversion error.

## Solution

### Workaround Using ObjectDataSource

To circumvent this issue while a fix is being developed, consider manually executing the stored procedures with custom code using the [ObjectDataSource](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/bind-to-a-businessobject) component. This approach allows you to continue using the latest version of Telerik Reporting without encountering the MySqlCommand conversion error.

### Using CALL Statement for Stored Procedures

Another workaround is to manually invoke stored procedures using the CALL Statement. This method has been tested and confirmed to successfully execute Stored Procedures, both with and without parameters. Example:

```sql
CALL Stored_Procedure_1;
```

## See Also

- [Binding ObjectDataSource to a BusinessObject - Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/bind-to-a-businessobject)
- [How To Use Stored Procedures in MySQL | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-use-stored-procedures-in-mysql#creating-a-stored-procedure-with-an-input-parameter)
