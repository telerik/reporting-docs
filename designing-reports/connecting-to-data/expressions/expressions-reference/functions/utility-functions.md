---
title: Utility Functions
page_title: Utility Functions 
description: Utility Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/utility-functions
tags: utility,functions
published: True
position: 10
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

# Utility Functions

## Access built-in utility functions

| Function | Parameters | Description |
| ------ | ------ | ------ |
|__Array(args)__|args (_object []_)|Returns an array of the passed object instances.<br/> For example: `=Array("item1","item2")` will return `object [] {"item1", "item2"}`|
|__Item(index, collection)__|index (_int_)<br/>collection (IEnumerable)|Returns the element of the collection with the given index (zero based).<br/> For example: `=Item(0, Array(10,20,30))` will return `10`|
|__HtmlEncode(value)__|value (_string_)|HTML-encodes a string and returns the encoded string.<br/> For example: `=HtmlEncode("&Telerik")` will return `&amp;Telerik`|
|__HtmlDecode(value)__|value (_string_)|Converts a string that has been HTML-encoded into a decoded string.<br/> For example: `=HtmlDecode("&amp;Telerik")` will return `&Telerik`|
|__Uri(uriString, uriKind)__|uriString (_string_)<br/>uriKind (_string_) *optional, the default is RelativeOrAbsolute* |Returns an instance of *System.Uri* <br/> For example: `=Uri("c:\temp\myFile.json", "absolute")` will return `new Uri("c:\temp\myFile.json", System.UriKind.Absolute)`|
