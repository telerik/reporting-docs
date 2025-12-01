---
title: Embedded Expressions
page_title: Embedded Expressions at a Glance
description: "Learn more about Embedded Expressions in Telerik Reporting, and how to use them when assigning values in reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/embedded-expressions
tags: embedded,expressions,reports
published: True
position: 2
previous_url: /expressions-embedded
reportingArea: General
---

# Embedded Expressions Overview

Some properties that accept String values allow mixing text with expressions. When evaluated, expressions will be replaced by their result thus forming the runtime value of the property.

Expressions are embedded in a string literal by surrounding them with curly brackets `{}`:

`Hi Mr. {Fields.LastName}, {Fields.FirstName}!`

In the example above the expressions `Fields.FirstName` and `Fields.LastName` are embedded in a string constant and when evaluated will produce a result like this:

`Hi Mr. Smith, John!`

If used in a string literal, curly brackets - `{ }` should be escaped with double brackets like this: `{%raw%}{{{%endraw%}` or `{%raw%}}}{%endraw%}`.

The following properties support embedded expressions:

* TextBox.Value
* HtmlTextBox.Value
* CheckBox.Text
* ReportParameter.Text
* ReportParameter.AvailableValues.DisplayMember
* ReportParameter.AvailableValues.ValueMember
