---
title: Design Time Data
page_title: Working With Data at Design Time Explained
description: "Learn which data sources are available at design time, and which only at runtime as well as how to work with the data available at design time."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/working-with-data-at-design-time
tags: working,with,data,at,design,time
published: True
position: 30
previous_url: /connecting-to-data-working-with-data-at-design-time
reportingArea: General
---

# Working With Data at Design Time

The [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) would show data source related information (incl. data source schema) when a valid data source is available at design time. As the __Report Designer__ works inside __Visual Studio__, a valid data source means:

* A data source object that is instantiated and initialized in the InitializeComponent() method of the designed object class - this is the only part of the class that __Visual Studio__ designer respects.
* The data source object should be operational at design time. This means that Visual Studio (through the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})

With the above in mind, there are two cases:

## Data sources available at design time

The __Data Source Components__ designed and developed specifically for __Telerik Reports__, overcome most of the design time issues while providing the freedom to connect [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) to a wide variety of data sources incl. databases, OR/mappers, Analysis Services' Cubes, etc. without requiring code. Data source components can only read the data and cannot modify it. Every data source component is an instance of the [DataSource](/reporting/api/Telerik.Reporting.DataSource) class. Having valid data source attached to [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) at design time allows you to take advantage of all design time goodness and work with the [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}). For more information please see [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) and [DataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%}).

## Data source available only at runtime

This approach is useful when you cannot get the report's data source at design time or want to avoid loading real data into __Visual Studio__ at design time. In this case you would have to mock your data just to enable the __Report Designer__ to show any data schema. This will enable you to adjust the layout of the report and bind report items to the available data fields, while the real data will be loaded only at runtime either in [NeedDataSource event]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/using-the-needdatasource-event-to-connect-data%}) or in the actual application.

## See Also

* [DataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%})
* [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%})
* [ObjectDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard%})
* [OpenAccessDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/openaccessdatasource-wizard%})
* [EntityDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/entitydatasource-wizard%})
* [CubeDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/cubedatasource-wizard%})
