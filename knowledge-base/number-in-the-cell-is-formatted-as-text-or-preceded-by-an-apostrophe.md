---
title: How to Avoid Warning in Excel The number in the cell is formatted as text or preceded by an apostrophe
description: The number in the cell is formatted as text or preceded by an apostrophe warning appears in Excel might appear if you exported integer values which are indicated as String
type: how-to
page_title: The number in the cell is formatted as text or preceded by an apostrophe.
slug: number-in-the-cell-is-formatted-as-text-or-preceded-by-an-apostrophe
position: 
tags: 
ticketid: 1483662
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
This article shows how to avod the warning in Excel indicating that **"The number in the cell is formatted as text or preceded by an apostrophe"**
which appears if you exported integer values which are indicated as String in the report.

## Solution
1. Create a [User Function](../expressions-user-functions) that will return the records with the right data type:
```CSharp
public static class ReturnTypeClass
{
    public static object ParseString(string str)
    {
        Int32 intValue;
        if (Int32.TryParse(str, out intValue))
            return intValue;
        else return str;
    }
}
```

2. [Register the User Function](../standalone-report-designer-extending-configuration).
For example, if you are using the Standalone designer, you will need to add this piece of code in the **Telerik.ReportDesigner.exe.config** file:
```XML
<Telerik.Reporting>
	<AssemblyReferences>
		<add name="ReturnDataType" />
	</AssemblyReferences>
</Telerik.Reporting>
```

3. Set the user function as a value of the field to return it value with the right data type:
```
= ReturnDataType.ReturnTypeClass.ParseString(Fields.NameOfField)
```
