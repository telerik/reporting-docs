---
title: Conditional Functions
page_title: Conditional Functions at a Glance
description: "Learn what are the Conditional Functions exposed by Telerik Reporting and how you may embed them in expressions in reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/conditional-functions
tags: conditional,functions,expression,report
published: True
position: 2
previous_url: /expressions-evaluation-flow-functions
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

# Conditional Functions Overview

Use conditional functions to determine if expressions meet a specified condition. Suppose you want to check whether customers fall into a specific age range and if that is the case, include specific data for that customer within the report. You could use the `If` function to make the check, and if the condition is valid, display relevant data, otherwise do not display anything.

## Condional data interpretation

The expressions passed as conditions to a conditional function get evaluated and then interpreted as boolean conditions using the following rules:

- Boolean values are valid conditional values.
- Numerical values are considered valid conditions. `0` is considered `false`, all other numerical values are considered `true`.
- Text values representing a boolean constant are considered valid conditions: `"true"` is considered `true`; `"false"` is considered `false`. The match is case insensitive.
- The `null` value is considered `false`.
- All other values are considered invalid conditional values and would yield an error.

The arguments of the conditional functions are evaluated using a "lazy" algorithm. No argument will get evaluated until its value is necessary. E.g., `If(false, exp1, exp2)` will not evaluate _exp1_ at all.

## Expression evaluation flow functions:

| Function | Description |
| ------ | ------ |
| `If(Condition, ReturnedIfTrue, ReturnedIfFalse)` |Returns the value of the second or third argument, depending on the evaluation of the first argument. If the first argument evaluates to _True_ the second argument is returned, if _False_ the third argument is returned.<br/> _Example_: Prints Over Budget when A is bigger than B `=If(Fields.A > Fields.B, "Over Budget", "OK")`<br/> _Example_: Because A equals 500, B is subtracted from C. If A didn't equal 500, then empty text ("") would be returned. `=If(Fields.A = 500, Fields.B - Fields.C, "")`<br/> _Example_: Prints sum only when vendor ID (numerical value) is not null and different than 0: `=If(Fields.VendorID, Sum(Fields.ContractAmount), "")`<br/> _Example_: Prints sum only when vendor name (text value) is not null: `=If(Fields.VendorName IS null, "", Sum(Fields.ContractAmount))`.|
| `Ifs(Condition1, ReturnedValue1,..., ConditionN, ReturnedValueN, DefaultValue)` |Returns one of the multiple return values, depending on the evaluation of an ordered list of conditions. The odd arguments are the conditions and the corresponding even arguments are the returned results. The result of the function is the first result argument (_ReturnedValueN_) after the first condition (_ConditionN_) that evaluates to `True`. If the last argument of the function is on an odd position, it is considered the default result (_DefaultValue_) and gets returned when none of the previous conditions evaluates to `True`. If there is no default value and none of the conditions evaluates to `True`, the function returns `null`.<br/>_Example_: Use `Ifs` instead of multiple nested `If` functions to return one of three values depending on the value of A.<br/> Use `=Ifs(Fields.A >= 10, "Green", Fields.A >= 1, "Gray", "Red"))`<br/> instead of `=If(Fields.A >= 10, "Green", If(Fields.A >= 1, "Gray", "Red"))`.|
| `Switch(SwitchOnExpression, MatchValue1, ReturnedValue1,..., MatchValueN, ReturnedValueN, DefaultValue)` |Returns one of the multiple return values, depending on the evaluation and then matching of an expression. The first argument is the evaluated expression (_SwitchOnExpression_). Its value is compared to the match value arguments (_MatchValueN_). The latter are in even positions. The first odd argument (_ReturnedValueN_) following the matched value is returned as a result. If the last argument of the function is in an even position, it is considered the default result (_DefaultValue_) and gets returned when the expression doesn't match any of the match values. If there is no default value and the expression doesn't match with any of the match values, the function returns `null`<br/>__The comparison between the switch-on and match values is case-sensitive__.<br/>__The function requires at least one argument__. If no arguments are passed, an error is shown `Type mismatch in function arguments. Cannot find an overload of the function Switch() that accepts arguments of type ()`<br/> _Example_: Use `Switch` to return "True" (when A is 1), "False" (when A is 0) or "Undefined" (otherwise) depending on the value of A. `=Switch(Fields.A, 1, "True", 0, "False", "Undefined"))`.|
| `IsNull(expression, ReplacementValue)` |Evaluates an expression and either returns the resulting value if different than `null` or a replacement value otherwise<br/> _Example_: The function returns 0 (zero) if "Price" is `null`. `=IsNull(Fields.Price, 0)`.|
