---
title: Report Parameters
page_title: Using Expressions in Report Parameters at a Glance
description: "Learn which Report Parameter properties support Expressions and how to configure them properly in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/report-parameters
tags: report,parameters
published: True
position: 6
previous_url: /expressions-report-parameters
reportingArea: General
---

# Expressions in Report Parameters

Report parameters expose `AvailableValues`, which represents the valid set of value/label pairs that the end user can choose from.

The `AvailableValues.ValueMember`  and `AvailableValues.DisplayMember` are usually names of columns from the `AvailableValues.DataSource`, but sometimes you may need to use an expression to combine values from more columns as values/labels/text of the parameters. Expressions are also valid ValueMember/DisplayMembers, for example:

`='Mr. ' + Fields.LastName + ', ' + Fields.FirstName`

You may also use [embedded expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/embedded-expressions%}):

`Mr. {Fields.LastName}, {Fields.FirstName}`

## See Also

* [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})
* [Using Report Parameters in Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-in-expressions%})
