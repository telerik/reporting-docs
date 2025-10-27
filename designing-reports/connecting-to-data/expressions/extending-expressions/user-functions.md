---
title: Custom User Functions
page_title: Custom User Functions Explained
description: "Learn how to create, incorporate, and use custom User Functions in expressions in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions
tags: user,functions,expressions,create,report
published: True
position: 1
previous_url: /expressions-user-functions
---

# Custom User Functions Overview

User functions allow you to extend the default behavior of the Telerik Reporting engine. User functions are __public static__ (__Public Shared__ in VB.NET) methods that should always return a value and can take an arbitrary number of input parameters.

> Optional parameters are not supported. The Reporting engine uses reflection to discover and invoke the custom user functions. This requires an exact match between the number and the type of the function parameters.

There are two ways to utilize user functions:

1. When any __public static__ (__Public Shared__ in VB.NET) method is part of the current report class. In this case, they can be invoked from an expression by their name, specifying the necessary parameters in the braces:

	__Invoking a User Function from the same report class__

	`= ResolveUrl("~/Images/Logo.jpg")`

1. When any __public static__ (__Public Shared__ in VB.NET) method reside in a loaded assembly. In this case, they can be invoked from an expression by their fully qualified name, including the full namespace and the name of the type they belong to, and specifying the necessary parameters in the braces:

	__Invoking a User Function from loaded assembly__

	`= Telerik.Reporting.Report.Report1.ResolveUrl("~/Images/Logo.jpg")`

If the loaded assembly contains many __public static__ (__Public Shared__ in VB.NET) methods, this might produce some clutter in the Edit Expression dialog, when browsing for existing user functions. To overcome this problem, you can use the IsVisible attribute to hide any methods, which are not intended to be used as user functions. See the code sample below:

__Example:__

{{source=CodeSnippets\CS\API\Telerik\Reporting\Expressions\UserFunctionsSnippets.cs region=UserFunctionsAttributeIsVisibleSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Expressions\UserFunctionsSnippets.vb region=UserFunctionsAttributeIsVisibleSnippet}}

## User Functions Visibility in Report Designers

As of 2025 Q1 (19.0.25.211), the __User Function__ resolution behavior has been changed. The `IsVisible` property of the `Function` attribute can now be used to more precisely control which functions are loaded by the Reporting Engine. Below you can find more information about the new behavior:

* By default, all public static methods in the chosen assembly(ies) are loaded;
* If at least one public static method in the assembly(ies) is decorated with the `Function` attribute and has its [IsVisible](/api/telerik.reporting.expressions.functionattribute#Telerik_Reporting_Expressions_FunctionAttribute_IsVisible) property set to `True` _(true by default)_, only public static methods with the same configuration will be loaded. Public static methods that are not decorated with the `Function` attribute or have their [IsVisible](/api/telerik.reporting.expressions.functionattribute#Telerik_Reporting_Expressions_FunctionAttribute_IsVisible) properties set to `False`, will not be loaded.
* If a type is decorated with the `Function` attribute and has its [IsVisible](/api/telerik.reporting.expressions.functionattribute#Telerik_Reporting_Expressions_FunctionAttribute_IsVisible) property set to `False`, none of the methods in this class will be loaded.
* If a type is decorated with the `Function` attribute and has its [IsVisible](/api/telerik.reporting.expressions.functionattribute#Telerik_Reporting_Expressions_FunctionAttribute_IsVisible) property set to `True`, all methods in it, except for the ones decorated with `IsVisible = False`, will be loaded.

## User Function Discovery

The automatic user function discovery applies only to assemblies that are explicitly configured through [assemblyReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) or [typeReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeReferences-element%}) in the application configuration. This behavior prevents potential security vulnerabilities where malicious actors could exploit report definitions to invoke unintended methods from the host application.

Even functions defined directly in the executing assembly are not automatically discovered. This behavior is intentional to prevent issues in scenarios where the Reporting engine is embedded in applications with many publicly accessible classes and methods. For example, in applications that host the Web Report Designer, automatically loading all functions from the executing assembly could clutter the function list with unintended methods.

## Providing metadata for functions

You can provide descriptive metadata about your user functions through attributes. Attributes are specialized classes that are applied to code elements. At compile time, attributes are emitted into metadata that is available to the common language runtime and reporting engine.

Attributes are attached to a component by preceding the component with a reference to the attribute and providing any relevant parameters. This call to the constructor is placed within angle brackets `<>` in Visual Basic and regular brackets `[]` in C#.

__FunctionAttribute__

The `FunctionAttribute` allows you to specify metadata for user functions. This metadata describes the _Category_, _Name_, _Namespace_, _Description_, and whether this function should be visible (_IsVisible_) for the Reporting Engine or not. If it is visible, it will be displayed in the _Edit Expression Dialog_ so you can utilize it in an Expression.

__DescriptionAttribute__

The `DescriptionAttribute` allows you to specify a description for the user function parameters. The description will be displayed in the _Edit Expression Dialog_ when you select a User Function.

__Example:__

{{source=CodeSnippets\CS\API\Telerik\Reporting\Expressions\UserFunctionsSnippets.cs region=UserFunctionsAttributeSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Expressions\UserFunctionsSnippets.vb region=UserFunctionsAttributeSnippet}}

To invoke this function, set the following expression:

`= My.Greet("John Doe")`

## Extending Reporting Engine with User Functions

If your custom user functions are linked from an external assembly, for the designer to recognize them, you will have to [extend the configuration of the start application]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}).

For the Visual Studio Report Designer this is the 'devenv.exe.config' file that resides in 'C:\Program Files (x86)\Microsoft Visual Studio X.0\Common7\IDE' by default (it is recommended to create a backup copy before modifying it). You can type the expression by specifying the full assembly qualified name of the function and passing a parameter of the expected type.

To run the report in other projects, use the same approach - add the assembly to the root folder from where the application is executed and configure it to load the external assembly by extending the configuration.

## See Also

* [FunctionAttribute](/api/Telerik.Reporting.Expressions.FunctionAttribute)
