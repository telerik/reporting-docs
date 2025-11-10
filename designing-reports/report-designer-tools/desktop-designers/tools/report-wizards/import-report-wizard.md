---
title: Import Report Wizard
page_title: Import Report Wizard at a Glance
description: "Learn more about the Import Report Wizard in the Report Designer and how to use it to convert report definitions from other formats to Telerik Reporting supported formats."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/import-report-wizard
tags: import,report,wizard,convert,designer
published: True
position: 3
previous_url: /import-report-wizard, /designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/
reportingArea: General
---

# Import Report Wizard of the Report Designer

Import Report Wizard guides you through the process of converting a report from another reporting format. The reporting solutions we can convert from are listed in [Overview]({%slug telerikreporting/designing-reports/converting-reports-from-other-reporting-solutions/overview%}).

To start the report conversion:

* Standalone Report Designer:

	+ Select __File | New |__ from the Telerik Report Designer File menu; __Click__ on the Import Report Wizard template. Create file dialog opens; Choose a file name and directory. Click __Save__ and the Import Report Wizard opens.

* Visual Studio:

	+ Create a new class library or use an existing one. Verify that the targeted.NET framework version is.NET4(+), Full profile as Client profile is not supported.
	+ __Right-click__ the project context menu and select __Add | New Item | Telerik Report__. Enter a name for the report class and click the __Add__ button to close the dialog. The Import Report Wizard opens.

| __Step__ | __Description__ |
| ------ | ------ |
| __Report Converter Page__ |Choose from a list of the available converters.|
| __Report Conversion Summary__ |This page lets you review the conversion summary.<br/> Click Finish to continue with the report setup.|
