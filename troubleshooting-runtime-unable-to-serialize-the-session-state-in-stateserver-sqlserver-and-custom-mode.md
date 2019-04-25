---
title: Run Time Problems. Unable to serialize the session state in 'StateServer', 'SQLServer' or 'Custom' mode.
description: Unable to serialize the session state. In 'StateServer' and 'SQLServer' mode, ASP.NET will serialize the session state objects, and as a result non-serializable objects or MarshalByRef objects are not permitted. The same restriction applies if similar serialization is done by the custom session state store in 'Custom' mode.
page_title: Unable to serialize the session state in 'StateServer', 'SQLServer' or 'Custom' mode.
slug: troubleshooting-runtime-unable-to-serialize-the-session-state-in-stateserver-sqlserver-and-custom-mode
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
Unable to serialize the session state. In 'StateServer' and 'SQLServer' mode, ASP.NET will serialize the session state objects, and as a result non-serializable objects or _MarshalByRef_ objects are not permitted. The same restriction applies if similar serialization is done by the custom session state store in 'Custom' mode.
## Solution
This exception might surface if you try to use objects which do not implement [ISerializable](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.serialization.iserializable?view=netframework-4.7.2) for a Report/Data Item data source. For example, if this is an _IList_, you can try using a _List_ instead as shown in our [cars example](https://demos.telerik.com/reporting/list-bound-report). You can also use the _NeedDataSource_ event of the report and assign the data source to the "processing report", thus avoiding any need for serialization/deserialization. Another approach is to use a _DataSet_/_DataTable_:

```CSharp
DataTable dt = new DataTable();
DataColumn col = new DataColumn("ColumnName", typeof(string));
//....
dt.Columns.Add(col);
foreach (object Item in MyIList)
{
    DataRow row = dt.NewRow();
    row["ColumnName"] = Item;
    //.....
    dt.Rows.Add(row);
}
```
