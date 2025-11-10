---
title: Text Functions
page_title: Text Functions at a Glance
description: "Find out what are the built-in Text Functions in Telerik Reporting and how to use them in expressions in reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions
tags: text,functions,expressions,report
published: True
position: 9
previous_url: /expressions-text-functions
reportingArea: General
---
<style>
table th:first-of-type {
	width: 40%;
}
table th:nth-of-type(2) {
	width: 60%;
}
</style>

# Text Functions Overview

Use Text functions to manipulate the text in your report. Text functions can use the following data types: String and Integer.

## String manipulation:

| Function | Description |
| ------ | ------ |
| `Format(format, value)` |Formats the value using the specified format string. <br/>Example:`=Format(' LineTotal: {0} ', Fields.LineTotal)`<br/>Detailed information about date and time format specifiers can be found in [Standard Date and Time Format Strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings) and [Custom Date and Time Format Strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings) articles.|
| `FormatWithCulture(cultureName, format, args)` |Formats the value using the specified format string and culture name. <br/>Example:`=FormatWithCulture("en-GB", "Price: {0:C}", Fields.Price)`<br/>To use [invariant culture](https://learn.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo.invariantculture?view=netframework-4.7.2#System_Globalization_CultureInfo_InvariantCulture), the first argument must be an empty string. Detailed information about culture names can be found in [Windows Language Code Identifier (LCID) Reference](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-lcid/a9eac961-e77d-41a6-90a5-ce1a8b0cdb9c) article.|
| `IndexOfSubstr(string, substring)` |Returns the index of the first occurrence of a string, within the specified text.|
| `IsValidXhtml(markup)` |Determines if the provided markup is valid XHTML that HtmlTextBox can parse.|
| `HtmlEncode(value)` |HTML-encodes a text and returns the encoded text.<br/> For example: `=HtmlEncode("&Telerik")` will return `&amp;Telerik`|
| `HtmlDecode(value)` |Converts a text that has been HTML-encoded, into a decoded text.<br/> For example: `=HtmlDecode("&amp;Telerik")` will return `&Telerik`|
| `Join(separator, strings)` |Returns a string created by joining a number of substrings contained in an array.|
| `Len(string)` |Gets the number of characters in a string.|
| `Replace(string, oldSubstring, newSubstring)` |Returns a new string in which all occurrences of a substring in the current string are replaced with another specified substring.|
| `Space(count)` |Returns a string consisting of the specified number of spaces.|
| `Split(separator, string)` |Returns a string array that contains the substrings in this instance that are delimited by the specified separator.|
| `StringCompare(stringA, stringB)` |Compares two specified strings and returns an integer that indicates their relative position in the sort order.|
| `StripHtmlTags(string)` |Strips the HTML tags from the input text.|
| `Substr(string, startIndex, length)` |Retrieves a substring from a string. The substring starts at a specified character position and has a specified length. <br/>Example:`=SubStr("Telerik", 0, 3)` returns "Tel".|
| `ToLower(string)` |Returns a copy of the specified string converted to lowercase.|
| `ToUpper(string)` |Returns a copy of the specified string converted to uppercase.|
| `Trim(string)` |Removes all leading and trailing whitespace from the passed in string.|
| `TrimEnd(string)` |Removes all occurrences of white space characters from the end of this instance.|
| `TrimStart(string)` |Removes all occurrences of white space characters from the beginning of this instance|
