---
title: Edit Expression Dialog
page_title: Edit Expression Dialog at a Glance
description: "Learn more about the Edit Expression Dialog in the Telerik Reporting Desktop Designers, how to invoke it and how to set the Expression value."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog
tags: edit,expression,dialog
published: True
position: 7
previous_url: /ui-edit-expression
---

# Edit Expression Dialog of the Report Designer

The `Edit Expression` dialog allows you to dynamically produce a value for a report item in place of a hard-coded value. The `Edit Expression` dialog provides a list of predefined and dynamic elements that can be used in your expression. A list of expression element categories is located in the lower left-hand list of the dialog, the elements for each category are located in the lower middle of the dialog, and descriptions are displayed in the lower right-hand of the dialog.

To use the `Edit Expression` dialog either type an [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) in directly or double-click the list of elements in the bottom middle list to add them to the expression. In the figure below an expression with a database field multiplied by a coefficient provides an extended price value.

![Edit Expression Dialog of the Report Designer with Functions and sqlDataSource1 fields expanded.](images/UI014.png)

>tip You may add a new line as a string in the Expression with the `Edit Expression` dialog.
>
>````
>= Fields.FirstLine + "
>" + Fields.SecondLine
>````
>
>The result will be the values of the two fiels being displayed one above the other in the corresponding report item.

For a list of the supported expression elements see [Using Item Binding Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%}).
