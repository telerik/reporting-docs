---
title: Operators
page_title: Operators | for Telerik Reporting Documentation
description: Operators
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/operators
tags: operators
published: True
position: 2
---

# Operators



## Arithmetic operators

| Operator | Description |
| ------ | ------ |
| __+__ |addition|
| __-__ |subtraction|
| __*__ |multiplication|
| __/__ |division|
| __%__ |the remainder after division|
| __Mod__ |modulu|

## String Concatenation

| Operator | Description |
| ------ | ------ |
| __+__ |Concatenation, joining stringsExample: Fields.FirstName + " " + Fields.LastName|

## Comparison operators

| Operator | Description |
| ------ | ------ |
| __<__ |less than|
| __<=__ |less than or equal to|
| __```<>```__ |not equal to|
| __=__ |equal|
| __>__ |greater than|
| __>=__ |greater than or equal to|
| __Between__ |selects a range of data between two values|
| __In__ |Compare to a list of items. The list can be a any collection of objects|
| __Like__ |pattern matching|
| __IS  [NOT] NULL__ |If the value of expression is __NULL__ , __IS NULL__ returns __TRUE__ ;                         otherwise, it returns __FALSE__ .If the value of expression is __NULL__ , __IS NOT NULL__ returns __FALSE__ ;                     otherwise, it returns __TRUE__ |

>note  __Null__  values represent missing unknown data and are usually used as placeholders for unknown or inapplicable values.            It is not possible to test for  __null__  values with comparison operators such as  __=__  or  __```<>```__ .           The  __IS [NOT] NULL__  operator should be used instead.         

## Logical/Bitwise operators

| Operator | Description |
| ------ | ------ |
| __And__ |Combines two Boolean expressions and returns __TRUE__ when both expressions are __TRUE__ |
| __Not__ |Using __NOT__ negates an expression|
| __Or__ |Combines two Boolean expressions and returns __TRUE__ when either of the conditions is __TRUE__ |
| __?:__ |Conditional operator.<br/>            Returns one of two values depending on the value of a Boolean expression. <br/>            Usage: =Fields.DiscountAvailable ? Fields.X : Fields.Y|
| __??__ |Null-coalescing operator.<br/>            Returns the left-hand operand if the operand is not null; <br/>            otherwise it returns the right hand operand.  <br/>            Usage: =Fields.Description ?? "N/A|

## Using wildcards for operators

Both the __*__  and __%__  can be used interchangeably for wildcard characters             in a LIKE comparison. If the string in a LIKE clause contains a *             or %, those characters should be escaped in brackets ([]). If a             bracket is in the clause, the bracket characters should be escaped             in brackets (for example [[] or [&cd;). A wildcard is allowed             at the start and end of a pattern, or at the end of a pattern, or             at the start of a pattern. For example:

* "ItemName LIKE '*product*'"

* "ItemName LIKE '*product'"

* "ItemName LIKE 'product*'"

Wildcard characters are not allowed in the middle of a string.                 For example, 'te*xt' is not allowed.
