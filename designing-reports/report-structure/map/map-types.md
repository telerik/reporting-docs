---
title: Map Types
page_title: Map Types | for Telerik Reporting Documentation
description: Map Types
slug: telerikreporting/designing-reports/report-structure/map/map-types
tags: map,types
published: True
position: 2
---

# Map Types



It is important to choose an appropriate map type for the type of data that you are presenting. This will determine how well the data can be interpreted when put in map form.

## Choosing a Map Type

Each map type has unique characteristics to help you visualize your dataset. You can use any map type to           display your data, but your data will be easier to read when you use a map type that is suitable to your data,           based on what you are trying to show in your report.         

The supported map types are:         

* __Point__  - similar to the Graph's [Scatter Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview%}),               it is used to display a correlations between two sets of values.               The main difference is that the first values set is defined using a geographical coordinates, which will position every data point onto the map.               The second values set is used as a measure and displays a bubble with variable size depending on the measured value, i.e.                the differences between the data points are based on the size of the point. The larger the point is,                the larger is the difference between the two data points.               

  ![Map Point Chart](images/Map/MapPointChart.png)

* __Pie__  - such a chart is used to display grouped data as a Graph's               [Pie Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/pie-charts/overview%}) on every data point. As with the Point map type, the data point               coordinates are defined by the GeoLocation group. The analytical data, needed to create the pie chart, is obtained using the child groups               of the GeoLocation group. A how-to article that explains how to setup such a map, can be found               [here]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-setup-a-map-using-the-map-wizard%}).               

  ![Map Pie Chart](images/Map/MapPieChart.png)

* __Column__  - identical to the __Pie chart type__ , with the only difference that the analytical               data is presented using the Graph's [Column Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/column-charts/overview%}). A more advanced example               that shows how to create such a map and add some additional extras, can be found               [here]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-create-a-map-with-barchart-series-using-csv-data-source%}).               

  ![Map Column Chart](images/Map/MapColumnChart.png)

*  [Choropleth](http://en.wikipedia.org/wiki/Choropleth_map)                 - a thematic map that uses graded color differences to display a               measure over predefined regions or areas. It is one of the most popular ways to visualize how a measure varies across               a geographic area. An example how to create a Choropleth map can be found                [here]({%slug telerikreporting/designing-reports/report-structure/map/how-to/how-to-setup-a-choropleth-using-the-map-wizard%}).             

  ![Choropleth Chart Type](images/Map/Choropleth/Choropleth_ChartType.png)The Choropleth item is basically a [Map item ]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%}) with a special kind of series and groups.               To create a choropleth map, there is no need to configure a [Location provider]({%slug telerikreporting/designing-reports/report-structure/map/structure/location-providers%})               or use a  [GeoLocationMapGroup](/reporting/api/Telerik.Reporting.GeoLocationMapGroup)  to obtain the coordinates of the data points.               Instead, it uses a  [ShapeMapSeries](/reporting/api/Telerik.Reporting.ShapeMapSeries)  instance, whose major distinction from the               other Map series is that they define the source which will be used to provide the spatial data. This source can be either a string, formatted               in compliance with the                [Well-known text/Well-known binary](http://en.wikipedia.org/wiki/Well-known_text)                standards, or an                [ESRI Shapefile](http://en.wikipedia.org/wiki/Shapefile) .             



To achieve better appearance, the Map item can define a [Tile Provider]({%slug telerikreporting/designing-reports/report-structure/map/structure/tile-providers%}) which will           draw an image of the requested map extent as a background layer onto the plot area.         

# See Also


 * [Map Overview]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})

 * [Map Structure]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})
