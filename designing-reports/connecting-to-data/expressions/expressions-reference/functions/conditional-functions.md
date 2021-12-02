---
title: Conditional Functions
page_title: Conditional Functions | for Telerik Reporting Documentation
description: Conditional Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/conditional-functions
tags: conditional,functions
published: True
position: 2
---

# Conditional Functions



Use conditional functions to determine if expressions meet specified condition. Suppose you want to check      	whether customers fall into a specific age range and if that is the case, include specific data for that customer within the report.     	You could use the IIF function to make the check, and if the condition is valid, display relevant data, otherwise do not      	display anything.

Conditional functions can use the following data types: Boolean, DateTime, Integer, Decimal, Float, EntityKey, and String.

## Expression evaluation flow functions:


| Function | Description |
| ------ | ------ |
| __IIf(expression, ReturnedIfTrue, ReturnedIfFalse)__ |Returns one of two objects, depending on the evaluation of an expression. The first parameter is the expression. If    	the expression evaluates to True the second parameter is returned, if false the third parameter is returned. Both parameters are      evaluated prior to the function execution.Example: Prints Over Budget when A is bigger than B =IIf(Fields.A > Fields.B, "Over Budget", "OK")Example: Use multiple IIF functions (also known as "nested IIFs") to return one of three values depending on the value of A.         =IIf(Fields.A >= 10, "Green", IIf(Fields.A >= 1, "Gray", "Red"))Example: Because A equals 500, B is subtracted from C. If A didn't equal 500, then empty text ("") would be returned. =IIf(Fields.A>500, Fields.B-Fields.C, "")Example: Prints sum only when vendor is not null: IIf(IsNull(Fields.VendorID, 0)=0,'', Sum(Fields.ContractAmount)).|
| __IsNull(expression, ReplacementValue)__ |Checks an expression and either returns the checked expression or a replacement value. Example where zero is returned if "Price" is null: IsNull(Fields.Price, 0)|




>warning The reporting engine first evaluates the function parameters and then passes the result values to the function. This means that 	you need to make sure the parameters of the function are valid statements prior to executing the function. 	


# See Also

