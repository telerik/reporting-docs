---
title: ObjectDataSource Wizard
page_title: ObjectDataSource Wizard at a Glance
description: "Learn more about the ObjectDataSource Wizard of the Telerik Reporting Desktop Designers and how to configure the ObjectDataSource properties with it."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard
tags: objectdatasource,wizard
published: True
position: 60
previous_url: /objectDataSource-Wizard
---

# ObjectDataSource Wizard of the Report Designer

After the __ObjectDataSource__ wizard appears you have to perform the following steps:

1. __Select a Business Object__ In this step you have to specify the business object to use for your data source. The available business objects are organized in two tabs for easier navigation:

	+ __Available data source types__ This tab lists all available types that can be used with the __ObjectDataSource__ component. That includes all public, non-abstract, non-generic classes and structures from the current project and from all other referenced projects. The types are organized in a hierarchical manner grouped by namespace:

		> If the desired type does not appear in the list, make sure the current project is built and all necessary project references are added. If you use the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) have in mind that Visual Studio is a 32-bit application, so the designer is restricted to x86 mode even on x64 platforms, which prevents the ObjectDataSource Wizard from discovering any types from x64 assemblies. The solution is to use different platform configurations: for " __Debug__ " builds it is best to use " __Any CPU__ ", while for " __Release__ " builds you can use " __x64__ " instead.

		> When the __"Show data components only"__ check box is checked, only the types marked with the DataObjectAttribute are listed. This is useful for distinguishing the types appropriate for data binding from the regular ones.

		````C#
[System.ComponentModel.DataObject()]
		public class Cars : List<Car>;
		{
			....
		}
````
		````VB
<System.ComponentModel.DataObject>
		Public Class Cars
			Inherits List(Of Car)
			....
		End Class
````


	+ __Existing data source components__ This tab lists all existing components in the current report that can be used with the __ObjectDataSource__ component. That includes all components from the component tray in the designer that are not data source components themselves.

		> When the __"Show data components only"__ check box is checked, only the components marked with the __DataObjectAttribute__ are listed. This is useful for distinguishing the components appropriate for data binding from the regular ones.

1. __Choose a data member__ In this step you have to specify a member from the chosen business object that is responsible for data retrieval.

	+ __No data source member__ – selecting this option specifies that there is no specific member responsible for retrieving data. In this case the chosen business object itself serves as a data source for the report. If you have specified a type in the previous step, the default constructor of the chosen type is used to create a new instance of the business object.
	+ __Choose a data source member__ – selecting this option allows you to specify a member of the business object that is responsible for data retrieval. The list of displayed members is contextual and depends on the selection from the previous step.
	+ __When a business object type is chosen__, the list of available members is the following:

		+ All public instance constructors
		+ All public instance properties
		+ All public static (shared in VB.NET) properties
		+ All public instance methods
		+ All public static (shared in VB.NET) methods

	+ __When a business object component is chosen__, the list of available members is the following:

		+ All public instance properties
		+ All public instance methods

	+ __When the "Show data components only" check box is checked__, only the methods that are marked with the __DataObjectMethodAttribute__ attribute are listed, and only if the specified type of the data method is __DataObjectMethodType.Select__. Here are some sample Cars class methods:

		{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=DataMethodSnippet}}
		{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=DataMethodSnippet}}

		When the __"Show data components only"__ check box from the previous step is not checked, all public members of the Cars business object type are listed. When the check box is checked, only the methods with the __DataObjectMethodAttribute__ attribute appear in the list. This is especially useful for filtering only the methods that are appropriate for data binding.

	> If the chosen member does not have any parameters, this is the last step of the wizard. However, if the specified member has parameters, the next step allows you to configure those parameters.

1. __Configure Data Source Parameters__ : Each argument of the selected method corresponds to a data source parameter. This step allows you to specify for each parameter a constant value, an expression, or create a new __ReportParameter__ and the expression will be set automatically to it.

	> The names and types of the defined parameters should match exactly the arguments of the selected method. In case this requirement is not fulfilled the __ObjectDataSource__ component will not be able to resolve or call correctly the method and will raise an exception at runtime. This is the last step of the wizard. After pressing the __Finish__ button the wizard will create the __ObjectDataSource__ component with the specified settings. In case you are using [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}), the wizard will automatically add the necessary [AssemblyReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) element in report's project configuration file. If the configuration file does not exist, it will be created prior to populating and added to the current project. If the configuration file is under source control, it will be checked out. After finishing the above operations, the wizard will close and return the user to the designer.

## See Also

* [Overview]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%})
* [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%})
* [Data Source Components Problems]({%slug telerikreporting/designing-reports/connecting-to-data/troubleshooting/data-source-components-problems%})
