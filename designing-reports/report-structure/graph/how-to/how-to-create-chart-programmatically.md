---
title: How to Create Chart Programmatically
page_title: How to Create Chart Programmatically | for Telerik Reporting Documentation
description: How to Create Chart Programmatically
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-create-chart-programmatically
tags: how,to,create,chart,programmatically
published: True
position: 7
---

# How to Create Chart Programmatically



The steps below show how to create a minimal chart definition with the Graph item programmatically

>important The example below is an alternative to using the Report Designer for creating a chart.            If applicable for your scenario our recommendation is to create your chart in the designer            with Graph Wizard or manually as elaborated in the [How to Create Chart Step by Step]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-create-chart-step-by-step%}) help article.         


## 



{{source=CodeSnippets\CS\API\Telerik\Reporting\GraphSnippets.cs region=AddNewGraphColumnChartType}}
````C#
	            //Instantiate a new Graph
	            var graph1 = new Telerik.Reporting.Graph();
	            //The name property should be set for all report objects!
	            graph1.Name = "graph1";
	            //Set the desired graph size
	            graph1.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Cm(13), 
	                Telerik.Reporting.Drawing.Unit.Cm(7));
	            //Set the desired graph location.
	            //We place the graph item in the parent container's top left corner.
	            graph1.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Cm(0), Telerik.Reporting.Drawing.Unit.Cm(0));
	            //Add the graph item in parent container.
	            //We add the graph item in the report's detail section.
	            this.detail.Items.Add(graph1);
	
	            //Setup the SqlDataSource
	            var sqlDataSource1 = new Telerik.Reporting.SqlDataSource();
	            sqlDataSource1.ConnectionString = "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString";
	            sqlDataSource1.Name = "sqlDataSource1";
	            sqlDataSource1.SelectCommand = "SELECT SOD.LineTotal, SOH.OrderDate, PC.Name AS ProductCategory FROM Sales.SalesOrderHeader " +
	                "AS SOH INNER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID INNER JOIN Production.Product " +
	                "AS P ON SOD.ProductID = P.ProductID INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = " +
	                "PS.ProductSubcategoryID INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID ";
	            //Set the DataSource property to the new SqlDataSource component.
	            graph1.DataSource = sqlDataSource1;
	
	            //Create the category group.
	            //The CategoryGroups hierarchy defines the data points in the Graph series. 
	            var productCategoryGroup = new Telerik.Reporting.GraphGroup();
	            productCategoryGroup.Name = "categoryGroup1";
	            //Add a new grouping to the graph group.
	            //In this case you have a group by product categories in the CategoryGroups hierarchy.
	            //The number of different categories will determine how many data points the series will have at runtime. 
	            //If the product categories consist of 'Accessories', 'Bikes', 'Components' and 'Clothing' categories, 
	            //the series in the Graph will have four data points. 
	            productCategoryGroup.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.ProductCategory"));
	            productCategoryGroup.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.ProductCategory", Telerik.Reporting.SortDirection.Asc));
	            graph1.CategoryGroups.Add(productCategoryGroup);
	
	            //The SeriesGroups hierarchy defines the series at runtime. 
	            var orderDateGroup = new Telerik.Reporting.GraphGroup();
	            orderDateGroup.Name = "seriesGroup1";
	            //Add a new grouping to the Graph group.
	            //In this case you have a group by the Year field in the SeriesGroups hierarchy. 
	            //The number of different years will determine how many series will appear on the Graph. 
	            //If the Year field contains the years 2001, 2002, 2003, and 2004, 
	            //the Graph will display four series for every series definition bound to this group. 
	            orderDateGroup.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.OrderDate.Year"));
	            orderDateGroup.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.OrderDate.Year", Telerik.Reporting.SortDirection.Asc));
	            graph1.SeriesGroups.Add(orderDateGroup);
	
	            //Setup Graph Axis with CategoryScale.
	            //The Axis represents a single dimension of the coordinate system.
	            var graphAxisCategoryScale = new Telerik.Reporting.GraphAxis();
	            graphAxisCategoryScale.Name = "GraphAxis1";
	            //The Scale defines how the data is projected on the axis;
	            //The CategoryScale represents an ordinal scale with discrete domain like names and categories.
	            graphAxisCategoryScale.Scale = new Telerik.Reporting.CategoryScale();
	
	            //Setup Graph axis with NumericalScale.
	            var graphAxisNumericScale = new Telerik.Reporting.GraphAxis();
	            graphAxisNumericScale.Name = "GraphAxis2";
	            //The numerical scale represents a scale with continuous domain of numbers: 
	            //integer numbers (Int16, Int32, Int64) or floating point numbers (Single, Double), etc;
	            graphAxisNumericScale.Scale = new Telerik.Reporting.NumericalScale();
	
	            //The Graph item uses a two-dimensional coordinate system that uniquely identifies the position of each data point. 
	            //Each coordinate system consists of two axes(reference lines) and an origin. 
	            var cartesianCoordinateSystem1 = new Telerik.Reporting.CartesianCoordinateSystem();
	            cartesianCoordinateSystem1.Name = "cartesianCoordinateSystem1";
	            cartesianCoordinateSystem1.XAxis = graphAxisCategoryScale;
	            cartesianCoordinateSystem1.YAxis = graphAxisNumericScale;
	            graph1.CoordinateSystems.Add(cartesianCoordinateSystem1);
	
	            //The Graph Series are series of data points that represents individual measurements.
	            //At runtime the intersection between the series group hierarchy members 
	            //and the category group hierarchy members defines the data points in the series.
	            //For each data point one or more aggregate functions are calculated to define 
	            //the value/coordinates of the data points.
	            var barSeries1 = new Telerik.Reporting.BarSeries();
	            barSeries1.CategoryGroup = productCategoryGroup;
	            barSeries1.CoordinateSystem = cartesianCoordinateSystem1;
	            barSeries1.LegendItem.Value = "= Fields.OrderDate.Year";
	            barSeries1.SeriesGroup = orderDateGroup;
	            barSeries1.Y = "=IsNull(Sum(Fields.LineTotal), 0) / 1000.0";
	            graph1.Series.Add(barSeries1);
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\GraphSnippets.vb region=AddNewGraphColumnChartType}}
````VB
	       'Instantiate a new Graph
	        Dim graph1 = New Graph()
	        'The name property should be set for all report objects!
	        graph1.Name = "graph1"
	        'Set the desired graph size
	        graph1.Size = New SizeU(Unit.Cm(13), Unit.Cm(7))
	        'Set the desired graph location.
	        'We place the graph item in the parent container's top left corner.
	        graph1.Location = New PointU(Unit.Cm(0), Unit.Cm(0))
	        'Add the graph item in parent container.
	        'We add the graph item in the report's detail section.
	        Me.detail.Items.Add(graph1)
	
	        'Setup the SqlDataSource
	        Dim sqlDataSource1 = New SqlDataSource()
	        sqlDataSource1.ConnectionString = "My.MySettings.TelerikConnectionString"
	        sqlDataSource1.Name = "sqlDataSource1"
	        sqlDataSource1.SelectCommand = "SELECT SOD.LineTotal, SOH.OrderDate, PC.Name AS ProductCategory FROM Sales.SalesOrderHeader " &
	            "AS SOH INNER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID INNER JOIN Production.Product " &
	            "AS P ON SOD.ProductID = P.ProductID INNER JOIN Production.ProductSubcategory AS PS ON P.ProductSubcategoryID = " &
	            "PS.ProductSubcategoryID INNER JOIN Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID"
	        'Set the DataSource property to the new SqlDataSource component.
	        graph1.DataSource = sqlDataSource1
	
	        'Create the category group.
	        'The CategoryGroups hierarchy defines the data points in the Graph series. 
	        Dim productCategoryGroup = New GraphGroup()
	        productCategoryGroup.Name = "categoryGroup1"
	        'Add a new grouping to the graph group.
	        'In this case you have a group by product categories in the CategoryGroups hierarchy.
	        'The number of different categories will determine how many data points the series will have at runtime. 
	        'If the product categories consist of 'Accessories', 'Bikes', 'Components' and 'Clothing' categories, 
	        'the series in the Graph will have four data points. 
	        productCategoryGroup.Groupings.Add(New Grouping("=Fields.ProductCategory"))
	        productCategoryGroup.Sortings.Add(New Sorting("=Fields.ProductCategory", SortDirection.Asc))
	        graph1.CategoryGroups.Add(productCategoryGroup)
	
	        'The SeriesGroups hierarchy defines the series at runtime. 
	        Dim orderDateGroup = New GraphGroup()
	        orderDateGroup.Name = "seriesGroup1"
	        'Add a new grouping to the Graph group.
	        'In this case you have a group by the Year field in the SeriesGroups hierarchy. 
	        'The number of different years will determine how many series will appear on the Graph. 
	        'If the Year field contains the years 2001, 2002, 2003, and 2004, 
	        'the Graph will display four series for every series definition bound to this group. 
	        orderDateGroup.Groupings.Add(New Grouping("=Fields.OrderDate.Year"))
	        orderDateGroup.Sortings.Add(New Sorting("=Fields.OrderDate.Year", SortDirection.Asc))
	        graph1.SeriesGroups.Add(orderDateGroup)
	
	        'Setup Graph Axis with CategoryScale.
	        'The Axis represents a single dimension of the coordinate system.
	        Dim graphAxisCategoryScale = New GraphAxis()
	        graphAxisCategoryScale.Name = "GraphAxis1"
	        'The Scale defines how the data is projected on the axis;
	        'The CategoryScale represents an ordinal scale with discrete domain like names and categories.
	        graphAxisCategoryScale.Scale = New CategoryScale()
	
	        'Setup Graph axis with NumericalScale.
	        Dim graphAxisNumericScale = New GraphAxis()
	        graphAxisNumericScale.Name = "GraphAxis2"
	        'The numerical scale represents a scale with continuous domain of numbers: 
	        'integer numbers (Int16, Int32, Int64) or floating point numbers (Single, Double), etc;
	        graphAxisNumericScale.Scale = New NumericalScale()
	
	        'The Graph item uses a two-dimensional coordinate system that uniquely identifies the position of each data point. 
	        'Each coordinate system consists of two axes(reference lines) and an origin. 
	        Dim cartesianCoordinateSystem1 = New CartesianCoordinateSystem()
	        cartesianCoordinateSystem1.Name = "cartesianCoordinateSystem1"
	        cartesianCoordinateSystem1.XAxis = graphAxisCategoryScale
	        cartesianCoordinateSystem1.YAxis = graphAxisNumericScale
	        graph1.CoordinateSystems.Add(cartesianCoordinateSystem1)
	
	        'The Graph Series are series of data points that represents individual measurements.
	        'At runtime the intersection between the series group hierarchy members 
	        'and the category group hierarchy members defines the data points in the series.
	        'For each data point one or more aggregate functions are calculated to define 
	        'the value/coordinates of the data points.
	        Dim barSeries1 = New BarSeries()
	        barSeries1.CategoryGroup = productCategoryGroup
	        barSeries1.CoordinateSystem = cartesianCoordinateSystem1
	        barSeries1.LegendItem.Value = "= Fields.OrderDate.Year"
	        barSeries1.SeriesGroup = orderDateGroup
	        barSeries1.Y = "=IsNull(Sum(Fields.LineTotal), 0) / 1000.0"
	        graph1.Series.Add(barSeries1)
````



# See Also

