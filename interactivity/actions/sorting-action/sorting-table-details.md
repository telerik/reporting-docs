---
title: Sorting Table Details
page_title: Configure a Sorting Action for the Table Details
description: "Learn how to configure and use a Sorting Interactive Action for the Table Details in Telerik Reporting."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-table-details
tags: sorting,table,details
published: True
position: 10
previous_url: /interactive-sorting-action-table-details
reportingArea: General
---

# Ordering the Table Details

This document demonstrates how to enable interactive sorting with the `Standalone Report Designer` or with the `Visual Studio Report Designer`.

## Prerequisites

To follow the steps in this guide, you need the following:

* A Telerik Reporting installation with an enabled [Examples feature]({%slug telerikreporting/installation%})
* Microsoft SQL Server with AdventureWorks

## Procedure

The following steps describe how to add an interactive __sort__ button to a column header in the __Detail Section__ of a report. This enables a user to click on the button and sort the table rows by the value displayed in that column.

1. Locate the `Product Catalog` sample report and open it with the __Standalone Report Designer__ or with the __Visual Studio Report Designer__. Depending on the Report Designer of your choice, you will locate the __Product Catalog__ sample report in one of the following folders:

	+ Examples for the Standalone Report Designer - `%PROGRAMFILES(x86)%\Progress\Telerik Reporting {Version}\Report Designer\Examples`
	+ Examples for the Visual Studio Report Designer – `%PROGRAMFILES(x86)%\Progress\Telerik Reporting {Version}\Examples\CSharp\`

	>note Replace __{Version}__ in the Examples path with your Telerik Reporting version.

1. In the Report Designer, make sure you use __Design View__.
1. Select the __List Price__ text box - this is the column header where we want to add an interactive sorting button.
1. In the __Properties__ window, open the __Action__ editor.
1. Select the __Sorting__ action.
1. Click the __Select sort targets__ button. The __Edit Sorting Action targets__ window appears.
1. Click the __New__ button to add a new target.
1. Select __table1 (Table)__ in the drop-down and click __OK__.
1. In the __Sort expressions__ drop-down menu, select the field that corresponds to the column for which you are defining a sorting action. In this case, use the `=Fields.ListPrice` expression and click __OK__.

	>note Specifying a sort expression is required.

To verify the sorting action:

1. Preview the report
1. Navigate to __Bikes__ in the document map.
1. Click the __List Price__ column interactive sorting button.
