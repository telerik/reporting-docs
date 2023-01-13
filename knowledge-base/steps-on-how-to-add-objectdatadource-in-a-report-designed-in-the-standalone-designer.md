---
title: Steps on how to add ObjectDataSource in a report designed in the Standalone Designer
description: This KB article lists all of the required steps to add ObjectDataSource Component in the Standalone Designer.
type: how-to
page_title: Adding ObjectDataSource in the Standalone Designer
slug: steps-on-how-to-add-objectdatadource-in-a-report-designed-in-the-standalone-designer
position: 
tags: 
ticketid: 1407612
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


## Solution
1. Open **Visual Studio** and create a new **Class Library**.
2. Add the following piece of code from [How to: Bind to a BusinessObject article]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject%}).

```CSharp
class Product
{
 . . .
}
 
[DataObject]
class Products
{
  . . .
}
```
3. Run the project and close it.
4. Copy the built assembly to clipboard - navigate to the project folder -> **bin** -> **Debug** and copy the dll file.
5. Navigate to the installation folder of the Report designer (for example: *C:\Program Files (x86)\Progress\Telerik Reporting R1 2019\Report Designer* ) and paste the .dll file.
6. Open the **Telerik.ReportDesigner.exe.config** file through an editor and add a reference for the assembly. For example:

```
<Telerik.Reporting>
        <AssemblyReferences>
            <add name="MyClassLibrary"/>
        </AssemblyReferences>
</Telerik.Reporting>
```
7. Save and close.
8. Open the **Report Designer** and create a new report.
9. Navigate to **Data** -> **Object Data Source**.
10. Select from the **Available data source types** and follow the Wizard instructions until the process is completed.
