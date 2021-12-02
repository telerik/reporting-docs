---
title: Text Functions
page_title: Text Functions | for Telerik Reporting Documentation
description: Text Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions
tags: text,functions
published: True
position: 9
---

# Text Functions



Use Text functions to manipulate the text in your report. Text functions can use the following data types: String and Integer.

## String manipulation:


| Function | Description |
| ------ | ------ |
| __Format(format, value)__ |Formats the value using the specified format string. Example:`=Format(' LineTotal: {0} ', Fields.LineTotal)`. Detailed information about<br/>              date and time format specifiers can be found in  [Standard Date and Time Format Strings](https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-date-and-time-format-strings) and  [Custom Date and Time Format Strings](https://docs.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings) articles.|
| __FormatWithCulture(cultureName, format, args)__ |Formats the value using the specified format string and culture name. Example:`=FormatWithCulture("en-GB", "Price: {0:C}", Fields.Price)`.<br/>              To use  [                  invariant culture<br/>                ](                  https://docs.microsoft.com/en-us/dotnet/api/system.globalization.cultureinfo.invariantculture?view=netframework-4.7.2#System_Globalization_CultureInfo_InvariantCulture<br/>                ) , the first argument must be an empty string. Detailed information about culture names can be found in  [Windows Language Code Identifier (LCID) Reference](https://msdn.microsoft.com/en-us/library/cc233982.aspx) article.|
| __IndexOfSubstr(string, substring)__ |Returns the index of the first occurrence of a string, within the specified text.|
| __IsValidXhtml(markup)__ |Determines if the provided markup is valid XHTML that HtmlTextBox can parse.|
| __Join(separator, strings)__ |Returns a string created by joining a number of substrings contained in an array.|
| __Len(string)__ |Gets the number of characters in a string.|
| __Replace(string, oldSubstring, newSubstring)__ |Returns a new string in which all occurrences of a substring in the current string are replaced with another specified substring.|
| __Space(count)__ |Returns a string consisting of the specified number of spaces.|
| __Split(separator, string)__ |Returns a string array that contains the substrings in this instance that are delimited by the specified separator.|
| __StringCompare(stringA, stringB)__ |Compares two specified strings and returns an integer that indicates their relative position in the sort order.|
| __StripHtmlTags(string)__ |Strips the HTML tags from the input text.|
| __Substr(string, startIndex, length)__ |Retrieves a substring from a string. The substring starts at a specified character position and has a specified length. Example:`=SubStr("Telerik", 0, 3)`returns "Tel".|
| __ToLower(string)__ |Returns a copy of the specified string converted to lowercase.|
| __ToUpper(string)__ |Returns a copy of the specified string converted to uppercase.|
| __Trim(string)__ |Removes all leading and trailing whitespace from the passed in string.|
| __TrimEnd(string)__ |Removes all occurrences of white space characters from the end of this instance.|
| __TrimStart(string)__ |Removes all occurrences of white space characters from the beginning of this instance|




# See Also

