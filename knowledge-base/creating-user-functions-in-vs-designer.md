---
title: Creating User Functions in Visual Studio Report Designer
description: Learn how to create custom user functions in VS Report Designer.
type: how-to
page_title: How to Create and Utilize User Functions in VS Report Designer
slug: creating-user-functions-in-vs-designer
tags: reporting, user, function, designer, vs, visual, studio, net, framework
res_type: kb
ticketid: 1680822
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- |
|  | Visual Studio Report Designer |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This tutorial shows how to create and utilize custom [user functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}).

## Solution

Let's start with creating a Class library (**.NET Framework**) project and add a **Report** class using the [Item Templates]({%slug reporting-integration-with-visual-studio%}) in Visual Studio. 

### User Functions Defined in the Report class

If your custom user function as a **public static** (**Public Shared** in *VB.NET*) method is a part of the current Report class:

````C#
public partial class Report1 : Telerik.Reporting.Report
{
    public Report1()
    {
        InitializeComponent();
    }

    [Function(IsVisible = true, Category = "My Functions", Namespace = "My", Description = "Say Hi")]
    public static string Greet(string name)
    {
        return string.Format("Hello, {0}", name);
    }
}
````

It can be invoked from an expression by its name, specifying the necessary parameters in the braces, e.g., setting the **Value** of a **TextBox** to:

`= Greet("Dess")`

![User Function in Report class](images/user-function-in-report.gif)   

### User Functions Defined in an External Assembly

1. If your custom user functions are linked from an external assembly (e.g., MyFunctions.dll), for the designer to recognize them, you will have to extend the configuration of the start application. 

	For the Visual Studio Report Designer, this is the **'devenv.exe.config'** file that resides in *'C:\Program Files (x86)\Microsoft Visual Studio X.0\Common7\IDE'* by default (it is recommended to create a backup copy before modifying it). 

	>important Do not forget to close the Visual Studio instance before modifying its configuration file. Run `Notepad` (or other editing tool) as an administrator to perform the changes.

	````XML
	<configSections>
			<section
				name="Telerik.Reporting"
				type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
				allowLocation="true"
				allowDefinition="Everywhere"/>
	</configSections>
	<Telerik.Reporting>
		<AssemblyReferences>
			<add name="MyFunctions" />
		</AssemblyReferences>
	</Telerik.Reporting>
	````


1. Copy the custom assembly in the same folder as the devenv.exe.config.
1. You can type the expression by specifying the full name of the function and passing a parameter of the expected type. - `= MyFunctions.GetImageFromURL("image url")`

The custom function accepts an image URL and returns an Image object that can be assigned to a PictureBox item.

<!-- COMMENTED BECAUSE OF MISSING GIF
![User Function in External assembly](images/user-function-in-external-assembly.gif)   
-->

## See Also

- [Visual Studio Templates]({%slug reporting-integration-with-visual-studio%})
- [Custom User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%})
