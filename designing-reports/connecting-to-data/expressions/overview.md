---
title: Overview
page_title: Expressions Explained
description: "Learn the basics about the Expressions in Telerik Reporting, what you may use them for and how to define them."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/overview
tags: overview
published: True
position: 0
previous_url: /report-expressions
---

# Expressions Overview

Expressions are widely used while designing reports, for example to retrieve, calculate, display, group, sort, filter, and parameterize the data in a report. Expressions provide great flexibility to control the content, style, and behavior of your reports. Expressions use the Telerik Reporting's built-in scripting language and are saved in the report definition. When the report runs, the report processor evaluates the expressions and substitutes the expression results for the property values.

To see evaluated expression values in a report, preview the report.

Parameters can be used with expressions to provide additional flexibility for changing the content and appearance of a report.

Expressions begin with an equal `=` and can include a combination of constants, operators, and references to built-in values (fields, parameters, and functions), and to external or custom code.

>important The Expressions __cannot begin with whitespace__. The expression '     =Fields.Data', ```      =Fields.Data```, ````     =Fields.Data````, will be interpreted as a hardcoded string. The correct value is '=Fields.Data'.

>important Expressions are __case-insensitive__. Thus, it is strongly recommended that the data fields, functions, and other objects used in expressions throughout the report are case-insensitive unique. Otherwise, the expression engine will not be able to distinguish between the objects which may lead to unexpected results.

During the evaluation, all defined operations and functions are executed and all built-in objects are replaced with the real data according to the current scope and a single value is returned. The type of the result depends on the expression and should always conform to the property it is applied to.

For example, if you create an expression for the `Style.BackgroundColor` property, the value must evaluate to a _System.Drawing.Color_ object.
