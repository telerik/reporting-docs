---
title: Modifying or Creating a report at Run-Time
description: Modifying or Creating a report at Run-Time.
type: how-to
page_title: Modifying or Creating a report at Run-Time
slug: modifying-or-creating-a-report-at-run-time
res_type: kb
---

## Description

A frequently asked question is how to change the designed report's settings or to create an item or the whole report at run-time.
 
  
## Solution    
  
In general, our recommendation is to avoid making changes to the report definition. Note that it is always better to design reports with the [available Report Designers](../report-designers) and let the designer serialize the settings in a manner that will cause minimum issues on upgrade.  
 In general, [Telerik Reporting Upgrade Wizard](../ui-upgrade-wizard) does not affect project items not related to reports or custom code.   
  
Flexibility in the layout can be achieved by showing/hiding items/sections via [Conditional Formatting](../styling-conditional-formatting) and [Bindings](../expressions-bindings), and [Filtering data](../data-items-filtering-data) which results in not displaying certain parts of the report e.g. [Using a dynamic filter to show/hide Crosstab/Table/List group members (columns)](../data-items-how-to-add-filtering-to-group).  
 Flexibility in retrieving data can be achieved by using parameterized data-retrieval methods. The method's arguments can be mapped to [report parameters](../designing-reports-parameters) e.g. [Using Parameters with the SqlDataSource component](../sql-data-source-using-parameters). You can also use a custom data access layer which fetches data in a manner fitting your requirements, where data objects can be consumed via ObjectDatasource/EntityDataSource or else component e.g. [Connecting Telerik Reporting to OData feeds](../../blogs/connecting-telerik-reporting-to-odata-feeds).  
  
  
**In case the available designers and wizards do not help you to accomplish your task, the recommended approach to modify/create reports is before starting to process them (before displaying them).**  
  
**To modify a report**, you can create an instance of the report designed in the Visual Studio Report Designer, or you can [deserialize](../programmatic-xml-serialization#deserialize-report-definition-from-xml-file)/[unpackage](../report-packaging-trdp#unpackaging) a TRDX/TRDP file to get a *Telerik.Reporting.Report* instance for work.  
 Once you have the report instance, you have access to all items in it through the report's Items collection. You can use the [Find method](../overload-telerik-reporting-reportitembase-itemcollection-find) to get a specific item/section that has to be modified.   
 An example of such modification is illustrated in [Changing the connection string dynamically according to runtime data](./changing-the-connection-string-dynamically-according-to-runtime-data).  
*Note that all modifications must be done before wrapping the report in a Report Source object on the server machine. If you are using a Reporting [REST](../telerik-reporting-rest-custom-report-resolver)or [WCF](../wcf-report-service-how-to-add-custom-report-resolver) service, modifications can be done in a **custom resolver** plugged in the service.*  
  
**To create a report**, our recommendation is to start by using the Visual Studio Report Designer. You can create a sample report with the desired layout and test data. The VS Report Designer will serialize automatically the settings in the report's **Designer.cs|vb** file. this code can be re-used and modified at run-time.  
*Note that all modifications must be done before wrapping the report in a Report Source object on the server machine. If you are using a Reporting [REST](../telerik-reporting-rest-custom-report-resolver)or [WCF](../wcf-report-service-how-to-add-custom-report-resolver) service, modifications can be done in a **custom resolver** plugged in the service.*  
  
  
## Note

Events are not recommended for modifying/creating items and data source components as they fire once the report's processing is started - [Understanding Events](../understanding-events). At that time the report template is evaluated against the assigned data.

