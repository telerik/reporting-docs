---
title: Report Functions
page_title: Report Functions 
description: Report Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/report-functions
tags: report,functions
published: True
position: 8
---
<style>
table th:first-of-type {
    width: 25%;
}
table th:nth-of-type(2) {
    width: 75%;
}
</style>

# Report Functions

## Access built-in collection functions

| Function | Description |
| ------ | ------ |
| __Fields(fieldName)__ |Returns the value of the field with the specified name in the current dat scope. Use this function when you want to dynamically change the referred field. For example you may define string parameter _SortField_ and use<br/> =Fields(Parameters.SortField) <br/>expression as Sorting of a report.|
| __Parameters(parameterName)__ |Returns the report parameter with the specified name|
