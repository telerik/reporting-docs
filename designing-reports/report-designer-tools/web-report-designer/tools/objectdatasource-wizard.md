---
title: ObjectDataSource Wizard
page_title: ObjectDataSource Wizard Tutorial
description: "Learn how to connect your business object with Telerik Reports through the dedicated Web Report Designer's ObjectDataSource Wizard."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/objectdatasource-wizard
tags: objectdatasource,wizard
published: True
position: 3
previous_url: /web-report-designer-tools-objectdatasource-wizard
---

# ObjectDataSource Wizard Overview

The Object Data Source Wizard allows you to create a new or edit an existing [ObjectDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) in the Telerik Web Report Designer. This article describes how to create a project with business objects and how to add them by using the  Object Data Source Wizard that you can invoke from the Report Designer toolbox with components.

## Creating the DataSource

The purpose of the ObjectDataSource component is to provide business objects data to data items in a declarative manner. For that reason, firstly, you need to create a project with the datasource. Note that it is highly recommended extracting the business objects into a separate project. By doing this, you will be able to use the class in the Standalone designer by just copying the assembly in the designer folder and registering it in the designer config file. In order to select the right type of .NET implementation and version, you can use the [.NET Standard compatibility chart](https://docs.microsoft.com/en-us/dotnet/standard/net-standard) which explains how and when the assemblies can be loaded in different framework versions.

In this example, we will use a `.NET Standard 2.0 Class Library` which is suitable for both .NET Framework and .NET Core applications. It will contain the business objects which in this case will be cars. Below you can see all required steps for building the project.

1. Open Visual Studio and create a new `.NET Standard 2.0 Class Library`. Name the project __CarObjects__.
1. Add a new class named __Car__ which will contain the model of the car.

	````C#
public class Car
	{
		string manufacturer;
		string model;
		int year;
		string imageUrl;
		ArrayList availableColor;
		public Car(string manufacturer, string model, int year, string imageUrl, string[] availableColor)
		{
			this.manufacturer = manufacturer;
			this.model = model;
			this.year = year;
			this.imageUrl = imageUrl;
			this.AvailableColor = new ArrayList(availableColor);
		}
		public string Model
		{
			get { return this.model; }
			set { this.model = value; }
		}
		public string Manufacturer
		{
			get { return this.manufacturer; }
			set { this.manufacturer = value; }
		}
		public int Year
		{
			get { return this.year; }
			set { this.year = value; }
		}
		public string ImageUrl
		{
			get { return this.imageUrl; }
			set { this.imageUrl = value; }
		}
		public ArrayList AvailableColor
		{
			get { return this.availableColor; }
			set { this.availableColor = value; }
		}
	}
````


1. Add another class named __Cars__. It will contain a list with cars.

	````C#
public class Cars : List<Car>
	{
		public Cars()
		{
			Car car;
			car = new Car("Honda", "NSX GT", 2003, "http://www.telerik.com/images/reporting/cars/NSXGT_7.jpg"
			, new string[] { "Black", "Red", "White", "Orange" });
			this.Add(car);
			car = new Car("Nissan", "Skyline R34 GT-R", 2005, "http://www.telerik.com/images/reporting/cars/EVLR34_1.jpg"
			, new string[] { "Black", "White" });
			this.Add(car);
		...
		}
	}
````


1. Build the project.

Now you have the project with data. The next step is to make the configurations in the project with the Web Report Designer.

## Configuring the DataSource in the WebReportDesigner

When started, the application that hosts the Web Report Designer will try to resolve the registered assemblies in the configuration folder of the project. Resolving them means that the .NET runtime will try to load the assemblies into the application domain. For example, the `\bin\Debug\net6.0` folder.

1. You need to add the assembly as a reference to the project or copy it through a post-build action to the output directory of the application. Note that if the assembly depends on other assemblies, you will also have to add the dependent assemblies to the working folder.
1. In order to use the custom assembly for ObjectDataSource, it needs to be registered in the application's configuration file.

	+ For.NET Core applications, this is done in the `appsettings.json` file:

		````JSON
"telerikReporting": {
			"assemblyReferences": [
				{
					"name": "CarObjects"
				}
			]
		}
````

		Another option is by custom implementation of the [IConfiguration](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-7.0) interface.

	+ For.NET Framework projects, the configuration should be added to the `web.config` file.

		````XML
<configuration>
			<configSections>
				<section name="Telerik.Reporting"
					type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
					allowLocation="true"
					allowDefinition="Everywhere" />
			</configSections>
			<Telerik.Reporting>
				<AssemblyReferences>
					<add name="CarObjects"/>
				</AssemblyReferences>
			</Telerik.Reporting>
		</configuration>
````

	We are ready with the configuration. Now, let's step to the wizard.

## Adding the ObjectDataSource through the Wizard

Once you have registered the assembly, run the Web Report Designer project. Go to the __Components__ tab and click on __Object Data Source__. Follow the steps below to complete Wizard.

1. __Choose a business object__ The selected business object type's assembly-qualified name will be stored in the data source component's DataSource property. In this screen, expand __CarObjects__ and select __Cars__. Click on __Next__.
1. __Choose a data member__ The business object instance will be created using its default constructor. You have the option to specify a different constructor or a data member (method or property) that will return the data. Here, you need to keep the default option - __Use the default constructor__. Click on __Next__.
1. __Configure data source parameters__ In this step, you can specify default value or expression and design-time value for data source parameters. In this scenario, this step will be skipped because the selected default constructor does not have any parameters.
1. __Preview data source results__ During data preview the business object will be called using the configured design-time parameter values if such are specified. This is the last step of the wizard. After pressing __Finish__ the wizard will configure the ObjectDataSource component with the specified settings and close.

## Displaying the Data

As a final step, let's display the data from the ObjectDataSource in the report.

1. From the __Explorer__ tab, click on the Report.
1. Then, from the Properties pane, go to __Data__ -> __DataSource__ and select the ObjectDataSource.
1. Drag the fields from the __Explorer__ tab to the report and hit  __Preview__.

## See Also

* [ObjectDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%})
* [Connecting the ObjectDataSource component to a Data Source from desktop report designer]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})
