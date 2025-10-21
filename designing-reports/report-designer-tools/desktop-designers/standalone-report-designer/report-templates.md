---
title: Report Templates
page_title: Report Templates Explained
description: "Learn more about Report Templates in the Telerik Reporting Standalone Report Designer, how to create and reuse them."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/report-templates
tags: report,templates
published: True
position: 1
previous_url: /standalone-report-designer-report-templates
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# Report Templates Overview

The Report templates in Telerik Reporting hold the initial report layout and styling, and allow for creating reports with consistent look and feel. They save time by skipping the repetitive tasks associated with building a new report every time, so that users can focus on the specific requirements of the new report. These tasks may include setting page sizes, connecting to data sources, defining headers and footers (such as adding a logo and page numbers), as well as styling.

Use the Export Template wizard to create new templates from reports that are currently opened in the Report Wizard. You can access this wizard from the File menu by clicking Export Template.

1. Start the Report Designer and open a report that you would like to use as report template. Navigate to File menu and click __Export Template...__
1. The __Export Template Wizard__ is started. Navigate to second step __Select Template Source__ where you select the item that you want to export. You can select only one item. Click __Next__.
1. In the __Select Template Options__ step, select options for your template:

	| Template Options | Description |
	| ------ | ------ |
	|Template name|Specifies the name for the template to display in the __New__ menu option -> Available Templates in the File menu.|
	|Template description|Specifies a description of the template to display in the __New__ menu option -> Available Templates in the File menu.|
	|Preview Image|Select the icon to use for the template in the __New__ menu option -> Available Templates in the File menu. Click the __Browse__ button to browse for the desired image file. The selected icon file is included in the template when it is exported.|

1. Click __Finish__. If the template name you have specified already exists, you would be asked to override it.

The Telerik Report Designer searches for and automatically loads templates from the following directories:

* The default template directory located in the Telerik Report Designer’s default working directory. The default working directory is located in the user documents folder named Telerik Report Designer.
* The template directory located in the application folder. The application folder is where the Telerik Report Designer executable is located.


## See Also

* [Report Templates in Web Report Designer]({%slug web-report-designer-report-templates%})
