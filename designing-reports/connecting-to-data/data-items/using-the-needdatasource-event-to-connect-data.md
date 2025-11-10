---
title: NeedDataSource Event
page_title: Connecting to data in the NeedDataSource event handler
description: "Learn how to use the NeedDataSource event handler to connect the Telerik Reporting data items to their data in runtime."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/using-the-needdatasource-event-to-connect-data
tags: using,the,needdatasource,event,to,connect,data
published: True
position: 5
previous_url: /data-items-need-data-source-event, /designing-reports-adding-data-source-needdatasource
reportingArea: General
---

# Using the NeedDataSource Event to Connect to Data

In certain scenarios, you may find it impossible to connect to your data at design time. [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) provide a suitable event to notify you that they are about to process so you may provide data for them to render, otherwise, they will be processed as unbound items.

The `NeedDataSource` event is raised by the reporting engine to inform you that the data item is about to be processed and still has no data source attached. The sender of the event is always the processing counterpart of the data item and it is the receiver of the data source.

This event is meant to be used only for providing data source for the report. Once the report is bound, the data source is cached, and the `NeedDataSource` event is no longer fired, unless it depends on the report or data source parameter. Every time the report is previewed, exported, or printed through the viewer it is processed and rendered from scratch, and the data caching improves the performance of these operations. Any other code irrelevant to providing data to the report should be moved to the `ItemDataBinding` event which is fired regardless of whether the report is bound or not.

Below is an example that illustrates how to provide data source to the __Report__ item using the `Report.NeedDataSource` event.

````CSharp
private void Report1_NeedDataSource(object sender, System.EventArgs e)
{
	string sql = @"SELECT Production.Product.Name, Production.Product.ProductNumber FROM Production.Product";
	string connectionString = "Data Source=(local)\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True";
	SqlDataAdapter adapter = new SqlDataAdapter(sql, connectionString);
	DataSet dataSet = new DataSet();
	adapter.Fill(dataSet);
	(sender as Telerik.Reporting.Processing.Report).DataSource = dataSet;
}
````
````VB
Private Sub Report1_NeedDataSource(ByVal sender As Object, ByVal e As System.EventArgs)
	Dim sql As String = "SELECT Production.Product.Name, Production.Product.ProductNumber FROM Production.Product"
	Dim connectionString As String = "Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
	Dim adapter As New SqlDataAdapter(sql, connectionString)
	Dim dataSet As New DataSet()
	adapter.Fill(dataSet)
	TryCast(sender, Telerik.Reporting.Processing.Report).DataSource = dataSet
End Sub
````

## See Also

* [Connecting to Data]({%slug telerikreporting/designing-reports/connecting-to-data/overview%})
* [SqlDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%})
* [ObjectDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%})
* [EntityDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview%})
* [OpenAccessDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/overview%})
* [CubeDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%})
