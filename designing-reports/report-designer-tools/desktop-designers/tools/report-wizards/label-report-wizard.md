---
title: Label Report Wizard
page_title: Label Report Wizard at a Glance
description: "Learn more about the Label Report Wizard in the Report Designer and how to use it to create Label reports in Telerik Reporting."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/label-report-wizard
tags: label,report,wizard,designer,create
published: True
position: 2
previous_url: /label-report-wizard
reportingArea: General
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# Label Report Wizard of the Report Designer

Label Report Wizard guides you through the process of creating a report with label layout.

To create a new report with the wizard:

* Standalone Report Designer:

	+ Select __File | New |__ from the Telerik Report Designer File menu; __Click__ on the Label Report Wizard template. Create file dialog opens; Choose a file name and directory. Click __Save__ and the Import Report Wizard opens.

* Visual Studio:

	+ Create a new class library or use an existing one. Verify that the targeted.NET framework version is.NET4(+), Full profile as Client profile is not supported.
	+ __Right-click__ the project context menu and select __Add | New Item | Telerik Report__. Enter a name for the report class and click the __Add__ button to close the dialog. Select report wizard form opens.
	+ Select the __Label Report Wizard__ option from the list and click __OK__.

| __Step__ | __Description__ |
| ------ | ------ |
| __Design Data Layout__ |Use the Categories and the Labels list controls to choose from a list of predefined label layouts to quickly structure the reports visual representation.<br/>See the Label Information and Preview boxes to get a rough idea of how the report will be laid out.|
| __Choose Data Source__ |This page lets you use an existing data source from a list of data sources<br/>or add new Data Source. If you choose to create new data source, click the __Add New Data Source__ button to start the [Data Source Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard%}). It will walk you through an additional set<br/>of steps and when finished will return you to the Report Wizard so you can continue.|
| __Design Data Layout__ |Lets you select data columns from the data source and have them placed in report detail section.<br/>Select from a list located on the left in the dialog titled __Available Fields__.<br/>Use the __Add__ button or just drag and drop the selected field from the __Available Fields__ to the __Displayed Fields__.<br/>Use the __Remove__ button or drag and drop the selected field to move fields from the __Displayed Fields__ list back to the __Available Fields__ list.<br/>Use the __Up__, __Down__ buttons or drag and drop fields within the __Displayed Fields__ list to reorder the fields in the report.|
