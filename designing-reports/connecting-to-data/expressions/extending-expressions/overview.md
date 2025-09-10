---
title: Overview
page_title: Extending Expressions Explained
description: "Learn how to Extend the Expressions with custom User functions and User aggregate functions in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/overview
tags: overview,functions,expressions,report,extend,aggregate
published: True
position: 0
previous_url: /expressions-extending-expressions, /designing-reports/connecting-to-data/expressions/extending-expressions/
---

# Extending Expressions Overview

Expressions can easily be extended by providing user functions written in any .NET language. This is very useful in addition to the built-in functions, providing more complex domain-specific calculations or uniform calculations because it speeds up the processing and boosts the performance. Furthermore, you can add custom aggregate functions to apply domain-specific logic while accumulating values.

In order to expose your custom functions, so they can be utilized by the Reporting engine, you have to add a reference to the assembly they are defined in. This can be done through the [assemblyReferences element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) in the application's configuration file.

````XML
<configuration>
	<configSections>
		<section
			name="Telerik.Reporting"
			type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
			allowLocation="true"
			allowDefinition="Everywhere"/>
	</configSections>
	…
	<Telerik.Reporting>
		<assemblyReferences>
			<add name="MyCustomAssembly" version="1.0.0.0" />
		</assemblyReferences>
	</Telerik.Reporting>
</configuration>
````
````JSON
"telerikReporting": {
    "assemblyReferences": [
        {
            "name": "MyCustomAssembly",
            "version": "1.0.0.0"
        }
    ]
}
````

## See Also

* [User functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%})
* [User Aggregate functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%})
