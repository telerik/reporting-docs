---
title: Report Functions
page_title: Report Functions Explained
description: "Find out what the built-in Report Functions in Telerik Reporting are and how to use them in expressions in reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/report-functions
tags: report,functions
published: True
position: 8
previous_url: /expressions-report-functions
reportingArea: General
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
| `Fields(name)` |Returns the value of the field with the specified name in the current data scope. Use this function when you want to dynamically change the referred field. For example, you may define string parameter _SortField_ and use `= Fields(Parameters.SortField)` expression as Sorting of a report.|
| `Parameters(name)` |Returns the report parameter with the specified name|
