---
title: Constants
page_title: Constants at a Glance
description: "Learn more about the built-in Constants in Telerik Reporting and how you may use them in report expressions."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/constants
tags: constants,expression,report,built-in
published: True
position: 1
previous_url: /expressions-constants
reportingArea: General
---

# Constants Overview

## Built-in constants

`False` , `True` , `null`.

## Literal text

In an expression, literal text is text that is enclosed in single or double quotation marks.

Example:

`="Product name: " + Fields.ProductName`

or

`='Product name: ' + Fields.ProductName`

>note Because quotation marks are special characters inside the literal text, you need to double the quotation mark to escape it. Other option is to use the other quotation marks as literal delimiters (then our quotation mark will not be a special symbol). The following table shows some examples of quotation mark combinations in an expression and their result:

| Expression | Result |
| ------ | ------ |
|'It''s my birthday'|It's my birthday|
|"It""s my birthday"|It"s my birthday|
|'It"s my birthday'|It"s my birthday|
|"It's my birthday"|It's my birthday|

Some report item properties allow the usage of [ Embedded Expressions ]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/embedded-expressions%}), which provide easy concatenation of string literals with expression terms.

## Numeric constants

They are resolved to:

* `Integer` if decimal point is not used - for example `1`, `256`, `65000`
* `Decimal` if decimal point is used - for example `1.0`, `25.6`

Example:

`= Fields.LineTotal < 100`

## Date-time constants

`Date` values should be enclosed within pound signs `#`.

Example:

`=Fields.Birthdate < #1/31/82#`
