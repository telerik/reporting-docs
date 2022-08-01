---
title: User Functions
page_title: User Functions 
description: User Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions
tags: user,functions
published: True
position: 1
---

# User Functions

User functions allow you to extend the default behavior of the Telerik Reporting engine. User functions are __public static__ (__Public Shared__ in VB.NET) methods that should always return a value and can take an arbitrary number of input parameters.       

There are two ways to utilize user functions:

1. When any __public static__ (__Public Shared__ in VB.NET) method is part of the current report class. In this case they can be invoked from an expression by their name, specifying the necessary parameters in the braces:             

   __Invoking an User Function from the same report class__ 
   
   ````
= ResolveUrl("~/Images/Logo.jpg")
````

1. When any __public static__  (__Public Shared__  in VB.NET) method reside in a loaded assembly. In this case they can be invoked from an expression by their fully qualified name, including the full namespace and the name of the type they belong to, and specifying the necessary parameters in the braces:             

   __Invoking an User Function from loaded assembly__ 
   
   ````
= Telerik.Reporting.Report.Report1.ResolveUrl("~/Images/Logo.jpg")
````


If the loaded assembly contains many __public static__ (__Public Shared__ in VB.NET) methods, this might produce some clutter in the Edit Expression dialog, when browsing for existing user functions. In order to overcome this problem, you can use the IsVisible attribute to hide any methods, which are not intended to be used as user functions. See the code example below:         

__Example:__ 

{{source=CodeSnippets\CS\API\Telerik\Reporting\Expressions\UserFunctionsSnippets.cs region=UserFunctionsAttributeIsVisibleSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Expressions\UserFunctionsSnippets.vb region=UserFunctionsAttributeIsVisibleSnippet}}

## Providing metadata for functions

You can provide descriptive metadata about your user functions through attributes. Attributes are specialized classes that are applied to code elements. At compile time, attributes are emitted into metadata that is available to the common language runtime and reporting engine.         

Attributes are attached to a component by preceding the component with a reference to the attribute and providing any relevant parameters. This call to the constructor is placed within angle brackets << in Visual Basic and regular brackets [] in C#.         

__FunctionAttribute__ 

The FunctionAttribute allows you to specify metadata for user function. This metadata describes the Category, Name, Namespace, Description and whether this function should be visible (IsVisible) for the reporting engine or not. If it is visible, it would be displayed in the Edit Expression Dialog so you can utilize it in an Expression.         

__DescriptionAttribute__ 

The DescriptionAttribute allows you to specify a description for the user function parameters. The description would be displayed in the Edit Expression Dialog when you select an user function.         

__Example:__ 

{{source=CodeSnippets\CS\API\Telerik\Reporting\Expressions\UserFunctionsSnippets.cs region=UserFunctionsAttributeSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Expressions\UserFunctionsSnippets.vb region=UserFunctionsAttributeSnippet}}

To invoke this function, set the following expression:

````
= My.Greet("John Doe")
````

## Extending Reporting Engine with User Functions

If your custom user functions are linked from an external assembly, in order the designer to recognize them, you will have to [extend the configuration of the start application]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}).

 > The Standalone Report Designer cannot recognize assemblies that target .NET Core/5/6 and higher or .NET Standard 2.1 and higher

For the Visual Studio Report Designer this is the 'deveng.exe.config' file that resides in 'C:\Program Files (x86)\Microsoft Visual Studio X.0\Common7\IDE' by default (it is recommended to create a backup copy before modifying it). You can type the expression by specifying the full assembly qualified name of the function and passing a parameter of the expected type. 

To run the report in other projects, use the same approach - add the assembly to the root folder from where the application is executed and configure it to load the external assembly by extending the configuration. 

## See Also

 * [FunctionAttribute](/reporting/api/Telerik.Reporting.Expressions.FunctionAttribute) 
