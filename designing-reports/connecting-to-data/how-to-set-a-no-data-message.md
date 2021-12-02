---
title: How to Set a No Data Message
page_title: How to Set a No Data Message | for Telerik Reporting Documentation
description: How to Set a No Data Message
slug: telerikreporting/designing-reports/connecting-to-data/how-to-set-a-no-data-message
tags: how,to,set,a,no,data,message
published: True
position: 6
---

# How to Set a No Data Message



The "No Data Message" feature allows you to display text, style or hide the empty space of a nested [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}),         which data source returns no records.       

## How To Set NoDataMessage:

1. Click the data item on the design surface to select it.               The __Properties Browser__  displays the properties for the selected item.             

1. In the __Properties Browser__ , expand the __No Data__  node.             

1. Set the __NoDataMessage__  property to the text you want to display.               Alternatively, click the Edit(…) button to open the [Edit Expression Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%})               and create an expression.             

1. Optionally to style the no data message, click the __NoDataStyle__  Edit(…) button               and set the style properties according to your requirements.             

## Usage

When you want to specify text to show in the rendered report in place of a nested [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) that has no data,           set the data item __NoDataMessage__  property. At run time, the report engine retrieves the datasource result set           and if the result set is empty and the NoDataMessage is specfied, in place of the data item the NoDataMessage is rendered.         

>note The "No Data Message" feature is available for nested Data items: Table, List, Crosstab, Graph, Map.The condition to use the feature is to have a nested Data item with DataSource property set to a valid data object, different than NULL.             If the data object is filtered to zero returned records, the feature is triggered.           


## "No Data Message" for Reports

Reports do not support the NoDataMessage property. If a report's DataSource returns zero records, only static           [sections]({%slug telerikreporting/designing-reports/report-structure/overview%}) are rendered -           Page Header and Footer sections, Report Header and Footer sections, Group Header and Footer sections of groups not based on fields.           These sections can be used for displaying a message to the user.         

If a report's DataSource is reset or set to NULL, the report preview will show the designed report structure without data,           which includes Detail section and dynamic groups' Group Header and Footer sections.         
