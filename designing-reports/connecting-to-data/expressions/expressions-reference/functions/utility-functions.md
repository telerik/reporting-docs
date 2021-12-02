---
title: Utility Functions
page_title: Utility Functions | for Telerik Reporting Documentation
description: Utility Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/utility-functions
tags: utility,functions
published: True
position: 10
---

# Utility Functions



## Access built-in utility functions


| Function | Parameters | Description |
| ------ | ------ | ------ |
| __Array(args)__ |args (Object [])|Returns an array of the passed object instances.                 For example: *=Array("item1","item2")* will return object [] {"item1", "item2"}|
| __Item(index,collection)__ |index (int)collection (IEnumerable)|Returns the element of the collection with the given index (zero based).                 For example: *=Item(0, Array(10,20,30))* will return 10|
| __HtmlEncode(value)__ |value (String)|HTML-encodes a string and returns the encoded string.                 For example: *=HtmlEncode("&Telerik")* will return &amp;Telerik|
| __HtmlDecode(value)__ |value (String)|Converts a string that has been HTML-encoded into a decoded string.                 For example: *=HtmlDecode("&amp;Telerik")* will return &Telerik|
| __Uri(uriString,uriKind)__ |uriString (string)uriKind (string) *optional, the default is RelativeOrAbsolute* |Returns an instance of *System.Uri* For example: *=Uri("c:\temp\myFile.json", "absolute")* will return *new Uri("c:\temp\myFile.json", System.UriKind.Absolute)*|




# See Also

