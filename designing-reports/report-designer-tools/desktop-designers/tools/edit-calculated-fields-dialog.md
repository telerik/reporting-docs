---
title: Edit Calculated Fields Dialog
page_title: Edit Calculated Fields Dialog at a Glance
description: "Learn more about the Edit Calculated Fields Dialog in the Telerik Reporting Desktop Designers, from where you may invoke it and how to edit or remove a calculated field."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-calculated-fields-dialog
tags: edit,calculated,fields,dialog
published: True
position: 12
previous_url: /ui-calculated-fields
reportingArea: General
---

# Edit Calculated Fields Dialog of the Report Designer

Calculated fields can be used to create new values that do not exist in the data source. For example, a calculated field can represent a new value, a constant, an expression value, user defined function or even a report parameter, or an existing field that is converted to a different datatype.

## Add a Calculated Field

You specify a calculated field manually by creating an expression. The Edit Calculated Fields dialog is available in the property grid of our DataSource components:

* [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%})
* [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%})
* [EntityDataSource]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/entitydatasource-wizard%})
* [OpenAccessDataSource]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/openaccessdatasource-wizard%})

by clicking on the ellipsis of the __CalculatedFields__ property.

![Edit Calculated Fields Dialog of the Report Designer with one calculated field (string) set to the concatenated string of two actual fields](images/CalculatedFields.png)

The dialog accepts __Name__, __DataType__ and __Expression__.

## Edit a Calculated Field

To edit a Calculated Field, click in the inline editors directly.

## Delete a Calculated Field

To delete a Calculated Field, use the Delete Button.

> Names must be unique in the datasource and the expression for a calculated field cannot contain aggregates, RowNumber or ColumnNumber global functions.
