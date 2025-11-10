---
title: Operators
page_title: Operators Explained
description: "Find out what Operators are exposed in Telerik Reporting and how you may use them in the expressions in reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/operators
tags: operators,report,expression,use
published: True
position: 2
previous_url: /expressions-operators
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

# Operators Overview

## Arithmetic operators

| Operator | Description |
| ------ | ------ |
| `+` |addition|
| `-` |subtraction|
| `*` |multiplication|
| `/` |division|
| `%` |the remainder after division|
| `Mod` |modulu|

## String Concatenation

| Operator | Description |
| ------ | ------ |
| `+` |Concatenation, joining strings.<br/> Example: `Fields.FirstName + " " + Fields.LastName`|

## Comparison operators

| Operator | Description |
| ------ | ------ |
| `<` |less than|
| `<=` |less than or equal to|
| `<>` |not equal to|
| `=` |equal|
| `>` |greater than|
| `>=` |greater than or equal to|
| `Between` |selects a range of data between two values|
| `In` |Compare to a list of items. The list can be any collection of objects|
| `Like` |pattern matching|
| `IS  [NOT] NULL` |If the value of the expression is ` NULL`, ` IS NULL` returns ` TRUE`; otherwise, it returns ` FALSE` .<br/> If the value of the expression is ` NULL`, ` IS NOT NULL` returns `FALSE`; otherwise, it returns `TRUE` |

>note `Null` values represent missing unknown data and are usually used as placeholders for unknown or inapplicable values. It is not possible to test for __null__ values with comparison operators such as `=` or `<>`. The `IS [NOT] NULL` operator should be used instead.

## Logical operators

| Operator | Description |
| ------ | ------ |
| `And` |Combines two Boolean expressions and returns `TRUE` when both expressions are __TRUE__ |
| `Not` |Using `NOT` negates an expression|
| `Or` |Combines two Boolean expressions and returns `TRUE` when either of the conditions is __TRUE__ |
| `?:` |Conditional operator.<br/> Returns one of two values depending on the value of a Boolean expression. <br/> Usage: `=Fields.DiscountAvailable ? Fields.X : Fields.Y`|
| `??` |Null-coalescing operator.<br/> Returns the left-hand operand if the operand is not null; <br/> otherwise it returns the right-hand operand. <br/> Usage: `=Fields.Description ?? "N/A"`|

## Using wildcards for operators

Both the `*` and `%` can be used interchangeably for wildcard characters in a LIKE comparison. If the string in a `LIKE` clause contains a `*` or `%`, those characters should be escaped in brackets (`[]`). If a bracket is in the clause, the bracket characters should be escaped in brackets (for example `[[]` or `[&cd;`). A wildcard is allowed at the start and end of a pattern, at the end of a pattern, or at the start of a pattern. For example:

* "ItemName LIKE '*product*'"
* "ItemName LIKE '*product'"
* "ItemName LIKE 'product*'"

Wildcard characters are not allowed in the middle of a string. For example, `te*xt` is not allowed.
