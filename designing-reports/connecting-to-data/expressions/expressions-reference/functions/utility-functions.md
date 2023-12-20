---
title: Utility Functions
page_title: Utility Functions at a Glance
description: "Find out what are the built-in Utility Functions in Telerik Reporting and how to use them in expressions in reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/utility-functions
tags: utility,functions,expressions,report
published: True
position: 10
previous_url: /expressions-utility-functions
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 25%;
}
table th:nth-of-type(3) {
	width: 50%;
}
</style>

# Utility Functions Overview

## Access built-in utility functions

| Function | Parameters | Description |
| ------ | ------ | ------ |
|`Array(args)`|args (_object []_)|Returns an array of the passed object instances.<br/>_Example:_ `=Array("item1","item2")` will return `object [] {"item1", "item2"}`|
|`Item(index, collection)`|index (_int_)<br/>collection (IEnumerable)|Returns the element of the collection with the given index (zero-based).<br/> _Example:_ `=Item(0, Array(10,20,30))` will return `10`<br/>_Example:_ `= Item(1, Parameters.Parameter1.Value)` will return the second item from the Multivalue Report Parameter named _Parameter1_. This will be `b` when the user has selected the values `a`, `b`, `c`, and `d` in the same order.|
|`Uri(uriString, uriKind)`|uriString (_string_)<br/>uriKind (_string_) *optional, the default is RelativeOrAbsolute* |Returns an instance of *System.Uri* <br/>_Example:_ `=Uri("c:\temp\myFile.json", "absolute")` will return `new Uri("c:\temp\myFile.json", System.UriKind.Absolute)`|
