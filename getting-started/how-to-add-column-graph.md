---
title: How to Add Column Graph
page_title: How to Add Column Graph | for Telerik Reporting Documentation
description: How to Add Column Graph
slug: telerikreporting/getting-started/how-to-add-column-graph
tags: how,to,add,column,graph
published: True
position: 8
---

# How to Add Column Graph



This article is part of the Demo report guide on getting started with Telerik Reporting and demonstrates         how to add a new graph which will display the top five stores per year and per quarter.       


1. Click on the Report Header section and then go to __Insert__ > __Bar__ > __Clustered Bar__             to add the new graph next to the pie chart.             

1. From __Graph Wizard__, use the __graphDataSource__, then drag __StoreName__ to __Categories__,               __OrderDate__ to __Series__, and __Sum(LineTotal)__ to __Values__.             

1. Sort and filter the series groups and the category groups. You can also set specific colors through the __Color palette__ option.             Set the series groups in the folowing way:             

   + __Grouping__ : =Quarter(Fields.OrderDate)

   + __Sorting__ : =Quarter(Fields.OrderDate) ASCSet the cetagories grpups in the following way:             

   + __Filtering__ :                 

   + __Expression__ : =Sum(Fields.LineTotal)

   + __Operator__ : Top N

   + __Value__ : =5

   + __Sorting__ : =Quarter(Fields.OrderDate) ASC

## Previewing the Result

Preview the result by clicking __Preview__ > __PrintPreview__.           

  ![FinalGS](images/FinalGS.PNG)

## Previous Steps

* [First Steps]({%slug telerikreporting/getting-started/first-steps%})

* [Creating the Demo Report]({%slug telerikreporting/getting-started/creating-the-demo-report%})

* [Setting the Page Header]({%slug telerikreporting/getting-started/setting-the-page-header%})

* [Creating the Table and Populating it with Data]({%slug telerikreporting/getting-started/creating-the-table-and-populating-it-with-data%})

* [Creating the Graph]({%slug telerikreporting/getting-started/creating-the-graph%})

* [Setting the Page Footer]({%slug telerikreporting/getting-started/setting-the-page-footer%})

* [Integrating the Report in.NET Framework Application]({%slug telerikreporting/getting-started/integrating-the-report-in-.net-framework-application%})

* [Parameterizing the Graph]({%slug telerikreporting/getting-started/parameterizing-the-graph%})

## Demo project

You can find the full project in our  [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/FirstStepsProject).         

#
# See Also

[Designing reports]({%slug telerikreporting/designing-reports/overview%})

