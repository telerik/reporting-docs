---
title: Changes on items in report events are not applied
description: Modifying report items in report events does not work.
type: how-to
page_title: Editing report items in report events does not take effect
slug: changes-on-items-in-report-events-are-not-applied
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

In Telerik Reporting versions **prior to R3 2016**, all changes in events were accepted, even these applied on items' definitions. When items' definitions are modified in events, changes are applied on all consecutive processing elements with an expected result.  
  
- Modifying report in events prior to **R3 2016:**  

```cs
void report_NeedDataSource(object sender, EventArgs e)
{
    this.DataSource = GetReportData();
    this.table.DataSource = GetTableData();
}
```
  
- **As of [R3 2016]({%slug telerikreporting/upgrade/2016/r3-2016%}#api-breaking-changes)**, we applied an optimization change in the report rendering algorithm and now each definition item property values are read and cached once the report rendering starts.   

> If you are working with item definitions in events, they will **not** be modified. For more details, check the updated [Understanding Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/understanding-events%}) help article.

- Modifying report in events **after R3 2016:**  

```cs
void report_NeedDataSource(object sender, EventArgs e)
{
    Telerik.Reporting.Processing.Report processingReport = (Telerik.Reporting.Processing.Report)sender;
    processingReport.DataSource = GetReportData();
}
```

> In the report **NeedDataSource** and **ItemDataBinding** events, the processing instances of the other report items are not created yet. Hence, it is not possible to modify other items in these Report events.  
 
- Modifying other items in events **after R3 2016:**  

```cs
void table_NeedDataSource(object sender, EventArgs e)
{
    Telerik.Reporting.Processing.Table processingTable = (Telerik.Reporting.Processing.Table)sender;
    processingTable.DataSource = GetTableData();
}
```

## Solution

In all versions of Telerik Reporting, changes in events are possible if they are applied on the **processing elements**, not the items' definitions (report elements accessible through **this.** in C# or **Me.** in VB.NET). The valid approaches are illustrated in [Accessing Report Items Programmatically]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/access-report-items-programmatically%}).  
  
The recommended approach is to use the *expression engine* and to avoid custom code in events:  

1. [Conditional Formatting]({% slug telerikreporting/designing-reports/styling-reports/conditional-formatting %}) to control styles via expressions;
2. [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to set properties of items via expressions;
3. [User functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) to set properties of items, when the [built-in functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/overview%}) are not sufficient.

The usage of the expression engine assures items will be modified at the right moment.  
 
## Notes

If you have many legacy reports and changing the code in events in all of them is not an option, you could give up on the property **resolution optimization** and turn it **off**. To do so, apply the following settings in [Telerik.Reporting configuration section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}#telerik-reporting-configuration-section) in application configuration file:  

```xml
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
  <!-- section handler ok; 1 extension  -->
  <configSections>
    <section
      name="Telerik.Reporting"
      type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting.Configuration, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
      allowLocation="true"
      allowDefinition="Everywhere"/>
  </configSections>
  <Telerik.Reporting>
    <processing cacheDefinitionProperties="false" />
  </Telerik.Reporting>
   
</configuration>
```

## See Also

- [How to use the ReportItem.DataObject property in expressions]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions%})

- [How to Databind to Collection Properties](./how-to-databind-to-collection-properties)

- [How to bind Sub Report to Main Report's Data](./how-to-bind-sub-report-to-main-report-s-data)

- [Change Sub Report based on Main Report's Data](./change-sub-report-based-on-main-report-s-data)

- [Changing the connection string dynamically according to runtime data](./changing-the-connection-string-dynamically-according-to-runtime-data) (the same approach can be used if you need to change data sources and to modify the report structure at run-time).
