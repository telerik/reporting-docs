---
title: Conditional Functions
page_title: Conditional Functions 
description: Conditional Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/conditional-functions
tags: conditional,functions
published: True
position: 2
previous_url: /expressions-evaluation-flow-functions
---
<style>
table th:first-of-type {
    width: 25%;
}
table th:nth-of-type(2) {
    width: 75%;
}
</style>

# Conditional Functions

Use conditional functions to determine if expressions meet specified condition. Suppose you want to check whether customers fall into a specific age range and if that is the case, include specific data for that customer within the report. You could use the IIF function to make the check, and if the condition is valid, display relevant data, otherwise do not display anything.

Conditional functions can use the following data types: Boolean, DateTime, Integer, Decimal, Float, EntityKey, and String.

## Expression evaluation flow functions:

| Function | Description |
| ------ | ------ |
| __IIf(expression, ReturnedIfTrue, ReturnedIfFalse)__ |Returns one of two objects, depending on the evaluation of an expression. The first parameter is the expression. If the expression evaluates to True the second parameter is returned, if false the third parameter is returned. Both parameters are evaluated prior to the function execution. <br/> _Example_: Prints Over Budget when A is bigger than B =IIf(Fields.A > Fields.B, "Over Budget", "OK") <br/> _Example_: Use multiple IIF functions (also known as "nested IIFs") to return one of three values depending on the value of A. `=IIf(Fields.A >= 10, "Green", IIf(Fields.A >= 1, "Gray", "Red"))` <br/> _Example_: Because A equals 500, B is subtracted from C. If A didn't equal 500, then empty text ("") would be returned. `=IIf(Fields.A>500, Fields.B-Fields.C, "")` <br/> _Example_: Prints sum only when vendor is not null: `=IIf(IsNull(Fields.VendorID, 0)=0,'', Sum(Fields.ContractAmount))`.|
| __Ifs(Expression1, ReturnedValue1,..., ExpressionN, ReturnedValueN, DefaultValue)__ |Returns one of multiple objects, depending on the evaluation of an ordered list of expressions. The odd arguments are the expressions and the even arguments are the returned results. The result of the function is the first result argument (_ReturnedValueN_) after the first expression (_ExpressionN_) that evaluates to _True_. If the last argument of the function is on an odd position, it is considered as the default result (_DefaultValue_) and gets returned when none of the expressions evaluates to _True_. If there is no default value and none of the expressions evaluates to _True_, the function returns _Null_.<br/>_Example_: Use IFS instead of multiple IIF functions to return one of three values depending on the value of A. `=Ifs(Fields.A >= 10, "Green", Fields.A >= 1, "Gray", "Red"))`.|
| __Switch(SwitchOnExpression, MatchValue1, ReturnedValue1,..., MatchValueN, ReturnedValueN, DefaultValue)__ |Returns one of multiple objects, depending on the evaluation of an expression. The first argument is the evaluated expression (_SwitchOnExpression_). Its value is compared to the match value arguments (_MatchValueN_). The latter are on even positions. The first odd argument (_ReturnedValueN_) following the matched value is returned as a result. If the last argument of the function is on an even position, it is considered as the default result (_DefaultValue_) and gets returned when the expression doesn't match with any of the match values. If there is no default value and the expression doesn't match with any of the match values, the function returns _Null_<br/>__The comparison between the switch on and match values is case-sensitive__.<br/>__The function requires at least one argument__. If no arguments are passed, an exception is shown `Type mismatch in function arguments. Cannot find an overload of the function Switch() that accepts arguments of type ()`<br/> _Example_: Use SWITCH to return "True" (when A is 1), "False" (when A is 0) or "Undefined" (otherwise) depending on the value of A. `=Switch(Fields.A, 1, "True", 0, "False", "Undefined"))`.|
| __IsNull(expression, ReplacementValue)__ |Checks an expression and either returns the checked expression or a replacement value.<br/>_Example_: The function returns 0 (zero) if "Price" is _Null_. `=IsNull(Fields.Price, 0)`.|

>warning The reporting engine first evaluates the function parameters and then passes the result values to the function. This means that you need to make sure the parameters of the function are valid statements prior to executing the function.
