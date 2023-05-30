---
title: Modifying or Creating a Report at Runtime
description: "Learn how to change a report with Conditional Formatting or Bindings, and create or modify a report programmatically at runtime in Telerik Reporting."
type: how-to
page_title: Editing or creating a report at Runtime
slug: modifying-or-creating-a-report-at-run-time
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

Our recommendation is to avoid making changes to the report definition. Note that it is always better to design reports with the [available Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}) and let the designer serialize the settings in a manner that will cause minimum issues on upgrade.

## Solution

- Flexibility in the layout can be achieved by showing/hiding items/sections via [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) and [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}), and [Filtering data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%}) which results in not displaying certain parts of the report e.g. [Using a dynamic filter to show/hide Crosstab/Table/List group members (columns)]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-filtering-to-group%}).

- Flexibility in retrieving data can be achieved by using parameterized data-retrieval methods. The method's arguments can be mapped to [report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) e.g. [Using Parameters with the SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-parameters-with-the-sqldatasource-component%}). You can also use a custom data access layer which fetches data in a manner fitting your requirements, where data objects can be consumed via ObjectDatasource/EntityDataSource or other component. For example, see [Connecting Telerik Reporting to OData feeds](https://www.telerik.com/blogs/connecting-telerik-reporting-to-odata-feeds).

	> In case the available designers and wizards do not help you to accomplish your task, the recommended approach to modify/create reports is before starting to process them (before displaying them).

- **To modify a report**, you can create an instance of the report designed in the Visual Studio Report Designer, or you can [deserialize]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}#deserialize-report-definition-from-xml-file)/[unpackage]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}#unpackaging) a TRDX/TRDP file to get a `Telerik.Reporting.Report` instance for work. Once you have the report instance, you have access to all items in it through the report's `Items` collection. You can use the [Find method](/api/telerik.reporting.reportitembase.itemcollection#Telerik_Reporting_ReportItemBase_ItemCollection_Find_System_String_System_Boolean_) to get a specific item/section that has to be modified.

	An example of such modification is illustrated in [Changing the connection string dynamically according to runtime data]({%slug changing-the-connection-string-dynamically-according-to-runtime-data%}).

- **To create a report**, our recommendation is to start by using the Visual Studio Report Designer. You can create a sample report with the desired layout and test data. The VS Report Designer will serialize automatically the settings in the report's `Designer.cs|vb` file. This code can be re-used and modified at run-time.

> All modifications must be done before wrapping the report in a Report Source object on the server machine. If you are using a Reporting [REST]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%})or [WCF]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-implement-and-use-custom-ireportresolver%}) service, modifications can be done in a **custom ReportSource resolver** plugged in the service.

## Notes

Events are not recommended for modifying/creating items and data source components as they fire once the report's processing is started, at that time, the report template is evaluated against the assigned data.

## See Also

* [Understanding Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/understanding-events%})
