---
title: Overview
page_title: Band Report Wizard at a Glance
description: "Learn more about the Band Report Wizard in Telerik Reporting and how you may use it to create Band reports."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview
tags: overview
published: True
position: 0
previous_url: /band-report-wizard, /designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/
reportingArea: General
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 85%;
}
</style>

# Band Report Wizard Overview

The Band Report Wizard guides you through the process of creating a report with a layout based on report sections.

To create a new report with the wizard:

* Standalone Report Designer:

	+ Select __File | New |__ from the Telerik Report Designer File menu; __Click__ on the Band Report Wizard template. Create file dialog opens; Choose a file name and directory. Click __Save__ and the Band Report Wizard opens.

* Visual Studio:

	+ Create a new class library or use an existing one. Verify that the targeted .NET Framework version is .NET 4 or higher. Full profile as Client profile is not supported.
	+ __Right-click__ the project context menu and select __Add | New Item | Telerik Report__. Enter a name for the report class and click the __Add__ button to close the dialog. Select report wizard form opens.
	+ Select the __Band Report Wizard__ option from the list and click __OK__.

| __Step__ | __Description__ |
| ------ | ------ |
| __Choose Data Source__ |This page lets you use an existing data source from a list of data sources<br/> or add a new Data Source. If you choose to create a new data source, click the __Add New Data Source__ button to start the [Data Source Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%}). It will walk you through an additional set<br/>of steps and when finished will return you to the Report Wizard so you can continue.|
| __Design Data Layout__ |Lets you select data columns from the data source and have them placed in the report heading and the detail sections of the report. You can also choose columns to group data by.<br/>Select from a list located on the left in the dialog titled __Available Fields__.<br/> Use the __Report__, __Group__ and __Detail__ buttons to add the selected column from the __Available Fields__ to the respective list of __Displayed Fields__.<br/> Use the __Remove__ button to move fields from the __Displayed Fields__ list back to the __Available Fields__ list. Use the up and down arrow buttons to reorder the columns in the report. |
| __Choose Report Layout__ |Choose from a list of predefined layouts to quickly structure the report's visual representation. See the __Description__ and __Preview__ window to get a rough idea of how the report will be laid out.<br/> Select the __Adjust report items to fit available space__ checkbox to have columns take all the horizontal area available. Unselect this checkbox if you want to add other columns by hand later and need the columns to take up less horizontal space.<br/> Check the __Generate sub-totals__ to have subtotals created at group footers. Appropriate functions are used based on the data type of the column, i.e. Sum() for numeric Count() for other types.|
| __Choose Report Style__ |Select from a predefined list of report styles to give your report a polished look. The preview window provides a general idea of what a finished report will look like.|
