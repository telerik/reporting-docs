---
title: Conditional Formatting
page_title: Conditional Formatting at a glance
description: "Get a better understanding of what conditional formatting is, learn its basic use cases, find out how to add conditional formatting rules, and see different examples."
slug: telerikreporting/designing-reports/styling-reports/conditional-formatting
tags: conditional, formatting
published: True
position: 6
previous_url: /styling-conditional-formatting
reportingArea: General
---

# Conditional Formatting Overview

Conditional formatting allows you to style report items dynamically based on certain rules that are defined in the [Conditional Formatting Rules Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/conditional-formatting-rules-dialog%}). All of this can be done without writing any code. Conditional formatting applies to any report item including sections and the report itself, all using the same [Conditional Formatting Rules Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/conditional-formatting-rules-dialog%}) user interface. See also the [Extending the Simple Report Design Quickstart]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/how-to-extend-a-band-report%}) Quickstart for a walkthrough demonstration of the conditional formatting feature.

## Usages

* Setting a specific color based on a value or other condition;
* Setting a specific text styling based on a value or other condition;
* Setting the visibility of an item based on a value or other condition and a lot more.

## Adding Conditional Formatting Rules

The __ConditionalFormatting__ property contains a collection of formatting rules that are evaluated in the order they are defined. Each rule has an associated style that lets you change styling characteristics when the rule is satisfied. You can choose to stop evaluating rules if a particular rule condition is met.

Each filter condition is made up of an __Expression__, __Operator__ and __Value__.

* __Expression__ can be a data field from the __Fields__ collection or defined using the [Edit Expression Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%}).
* __Operator__ can be simple comparison operators but can also include __Like__ and additional operators to include the top and bottom number of records and the top and bottom percentage of records. See the table of operators below.
* __Value__ can be a literal value, `<blank>` or an expression defined in the [Edit Expression Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%}). When all the filter conditions are met, the rule is fired and the style is applied.

![Image showing the Formatting Rule editor window](images/Style4.png)

You can change the Text, Background, Edges and Line Style for the given item using the [Style Builder dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/style-builder-dialog%}).

![Image showing the Style Builder window](images/Style5.png)

## Samples with Conditional Formatting

* [Display Reports with alternating style rows]({%slug how-to-display-alternating-style-rows%})
* [Change row color based on a value in the row]({%slug change-row-color-based-on-value%})
* [Display "No Data" message for Reports and Subreports]({%slug how-to-display-no-data-message-for-reports-and-subreports%})
* [How to create waterfall chart with Graph item]({%slug how-to-create-waterfall-chart-using-graph%})
