---
title: Report Functions
page_title: Report Functions Explained
description: "Find out what are the built-in Report Functions in Telerik Reporting and how to use them in expressions in reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/report-functions
tags: report,functions
published: True
position: 8
previous_url: /expressions-report-functions
---
<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# Report Functions Overview

## Access built-in collection functions

| Function | Description |
| ------ | ------ |
| `Fields(fieldName)` |Returns the value of the field with the specified name in the current dat scope. Use this function when you want to dynamically change the referred field. For example you may define string parameter _SortField_ and use<br/> `=Fields(Parameters.SortField)` <br/>expression as Sorting of a report.|
| `Parameters(parameterName)` |Returns the report parameter with the specified name|
