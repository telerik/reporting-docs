---
title: processing Element
page_title: processing Element 
description: processing Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element
tags: processing,element
published: True
position: 3
previous_url: /configuring-telerik-reporting-cacheDefinitionProperties
---
<style>
table th:first-of-type {
	width: 10%;
}
table th:nth-of-type(2) {
	width: 90%;
}
</style>
# processing Element

The Processing element specifies the configuration settings that will be applied during the processing of the report. 

## `<processing>` element

|   |   |
| ------ | ------ |
|Attributes|__cacheDefinitionProperties__ - optional boolean attribute. Determines if the report definition properties will be cached during the processing, making them immutable.|
|Child elements|__resourceResolver__ – optional element. Changes the behavior of the default resource resolving mechanism. Only one `resourceResolver` element can be used in the `<processing>` element.|
|Parent element|__Telerik.Reporting__ - specifies the root element of the Telerik Reporting configuration settings. Only one `<processing>` element can be used in the `Telerik.Reporting` element.|


### Example

XML-based configuration file: 

````XML
<Telerik.Reporting>
	<processing cacheDefinitionProperties="false">
		<!--The element below represents a Path resource resolver:-->
		<!--<resourceResolver provider="path">
			<parameters>
				<parameter name="directory" value="c:\\CommonResourcesDirectory\\" />
			</parameters>
		</resourceResolver>-->
		<!-- The element below represents a custom implementation of resource resolver-->
		<!-- The typeName should include first the class of the custom ResourceResolver(including the namespace) and the second part, be separated by a comma, is the name of the assembly that will contain that code(can be the same project)
		e.g. "CSharp.Net6.Html5IntegrationDemo.CustomResourceResolver, CSharp.Net6.Html5IntegrationDemo"-->
		<resourceResolver provider="custom">
			<parameters>
				<parameter name="typeName" value="Namespace.CustomResourceResolverClass, AssemblyName" />
				<parameter name="constructorParameter1" value="constructorParameterValue1" />
			</parameters>
		</resourceResolver>
		<!-- The element below represents a custom implementation of a sharedDataSourcer resolver-->
		<!-- The typeName should include first the class of the custom ResourceResolver(including the namespace) and the second part, be separated by a comma, is the name of the assembly that will contain that code(can be the same project)
		e.g. "CSharp.Net6.Html5IntegrationDemo.CustomSharedDataSourceResolver, CSharp.Net6.Html5IntegrationDemo"-->
		<sharedResourceResolver provider="custom">
			<parameters>
				<parameter name="typeName" value="Namespace.CustomSharedDataSourceResolverClass, AssemblyName" />
				<parameter name="constructorParameter1" value="constructorParameterValue1" />
			</parameters>
		</resourceResolver>
	</processing>
</Telerik.Reporting>
````

JSON-based configuration file: 

````JSON
"telerikReporting": {
	"processing": {
		"cacheDefinitionProperties": "false",
		"resourceResolver": {
			// The element below represents a Path resource resolver:
			//"provider": "path",
			//"parameters": [
			//	{
			//		"name": "directory",
			//		"value": "C:\\Temp\\RestServiceStorage"
			//	}
			//]
			// The element below represents a custom implementation of resource resolver
			//The typeName should include first the class of the custom ResourceResolver(including the namespace) and the second part, be separated by a comma, is the name of the assembly that will contain that code(can be the same project)
			// e.g. "CSharp.Net6.Html5IntegrationDemo.CustomResourceResolver, CSharp.Net6.Html5IntegrationDemo"
			"provider": "custom",
			"parameters": [
				{
					"name": "typeName",
					"value": "Namespace.CustomResourceResolverClass, AssemblyName"
				},
				{
					"name": "constructorParameter1",
					"value": "constructorParameterValue1"
				}
			]
		},
		"sharedDataSourceResolver": {
			// The element below represents an implementation of a SharedDataSource resolver that uses a path provider:
			//"provider": "path",
			//"parameters": [
			//  {
			//    "name": "directory",
			//    "value": "c:\\CommonSharedDataSources\\"
			//  }
			//],

			// The element below represents an implementation of a SharedDataSource resolver that uses a custom type provider
			// The typeName should include first the class of the custom ResourceResolver(including the namespace) and the second part, be separated by a comma, is the name of the assembly that will contain that code(can be the same project)
			// e.g. "CSharp.Net6.Html5IntegrationDemo.CustomSharedDataSourceResolver, CSharp.Net6.Html5IntegrationDemo"
			"provider": "custom",
				"parameters": [
				{
					"name": "typename",
					"value": "Namespace.CustomSharedDataSourceResolverClass, AssemblyName"
				}
			]
		}
	}
}
````


### CacheDefinitionProperties

We provide a mechanism for caching the report definition properties that boosts the performance. Naturally it prevents modifying the report during processing stage. The default value of the property is __True__. 

Basically, the [Report Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%}) are not intended to be used to modify the report definition, as explained in the [Understanding Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/understanding-events%}) article. For that reason, in [R3 2016 (10.2.16.914)](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-r3-2016-(version-10-2-16-914)) for performance reasons, we introduced a change - `cacheDefinitionProperties` which caches the report definition properties, so such modifications are not respected. Setting the _cacheDefinitionProperties_ to _false_ will skip the definition item properties caching, which will allow the report definition to be changed in the report events. This may result in parformance penalty though. 

Starting with [R3 2022 SP1 (16.2.22.1109)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2022-sp1-16-2-22-1109) `CacheDefinitionProperties` was exposed as a Report definition property in the `ReportEngineSettings` properties collecction, so that you may specify it per Report. The property value may be set to `Default`, `True`, or `False`. The `Default`, which is the default value, lets you specify that the Reporting engine should respect the _cacheDefinitionProperties_ set in its configuration on the project level.

### ResourceResolver

__resourceResolver__ element allows to alter the default resource-resolving mechanism. This element determines which implementation of the [Telerik.Reporting.Interfaces.IResourceResolver](/reporting/api/Telerik.Reporting.Interfaces.IResourceResolver) interface will be used by the processing engine to resolve the resources that are specified in the report definition. Such resources are: 

* Images used by [Telerik.Reporting.PictureBox](/reporting/api/Telerik.Reporting.PictureBox) and [Telerik.Reporting.CheckBox](/reporting/api/Telerik.Reporting.CheckBox) report items, referenced by a relative path. 

* Elements from report's [Telerik.Reporting.Drawing.ExternalStyleSheet](/reporting/api/Telerik.Reporting.Drawing.ExternalStyleSheet) collection, referenced by a relative path. 

* __Source__ property of [Telerik.Reporting.Data.CsvDataSource](/reporting/api/Telerik.Reporting.Data.CsvDataSource) and [Telerik.Reporting.Data.JsonDataSource](/reporting/api/Telerik.Reporting.Data.JsonDataSource) report items, referenced by a relative path. 

This __ResourceResolver__ is intended to be used in scenarios where the resources are not retrieved from a local file path but rather obtained from a different type of storage. As an example, Telerik Report Server persists its assets in a storage that can be file-based or can use a MSSQL or Redis database as a backend. Processing a report definition that has relative paths to its resources would not work in this scenario, unless the necessary resources are not placed in folders relative to the root of the Telerik Report Server web application. The custom resource resolver can be used here to provide specific logic that will retrieve the necessary resources as byte arrays using the resource identifier from the report definition. 

### `<resourceResolver>` element

|   |   |
| ------ | ------ |
|Attributes| __provider__ – required string attribute. Determines the provider type of the ResourceResolver instance. Only two types are supported:<ul><li>__path__ - Specifies to use an internal ResourceResolver instance that will resolve the resources from a given directory specified in the `<parameters>` element.</li><li>__custom__ - Specifies to use a custom ResourceResolver instance that implements [Telerik.Reporting.Interfaces.IResourceResolver](/reporting/api/Telerik.Reporting.Interfaces.IResourceResolver) interface. It will be instantiated at runtime from the type name specified in the `<parameters>` element.</li></ul>|
|Child elements| __parameters__ – specifies a collection of parameters for the resource resolver in the `<resourceResolver>` element. Only one __parameters__ element can be used in the `<resourceResolver>` element.<br/>__Supported parameters for *path* provider__<ul><li>__name__ : _directory_</li><li>__value__ : the path to the directory that contains the resources to be resolved.</li></ul>__Supported parameters for *custom* provider__<ul><li>__name__ : _typeName_</li><li>__value__ : the assembly qualified name of the type that implements the [Telerik.Reporting.Interfaces.IResourceResolver](/reporting/api/Telerik.Reporting.Interfaces.IResourceResolver) interface.</li></ul>The parameters collection of the __custom__ provider can contain additional entries that will be passed to the constructor of the type. If no additional parameters are specified, the parameterless constructor will be used.|
|Parent element| __processing__ - specifies the parent element of the Telerik Reporting configuration settings.|

### SharedDataSourceResolver

__sharedDataSourceResolver__ element allows to alter the default shared DataSource(`.sdsx`)-resolving mechanism. This element determines whihch implementation of the [Telerik.Reporting.Interfaces.ISharedDataSourceResolver](/reporting/api/Telerik.Reporting.Interfaces.ISharedDataSourceResolver) interface will be used by the processing engine to resolve the shared DataSources references that are specified in the report definition.

This __SharedDataSourceResolver__ is intended to be used in scenarios where the `.sdsx` files are not retrieved from a local file path but rather obtained from a different type of storage. As an example, if a custom [Telerik.Reporting.Interfaces.ISharedDataSourceStorage](/reporting/api/Telerik.WebReportDesigner.Services.ISharedDataSourceStorage) is implemented where the `.sdsx` files are stored in a database, then a custom `SharedDataSourceResolver` would be necessary to provide specific logic that will retrieve the `.sdsx` XML from the database and will then [Deserialize]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}#deserialize-from-xml) it to an instance of the [Telerik.Reporting.DataSource](/reporting/api/Telerik.Reporting.DataSource) class and return it in the `Resolve` method. 

### `<sharedDataSourceResolver>` element

|   |   |
| ------ | ------ |
|Attributes| __provider__ – required string attribute. Determines the provider type of the SharedDataSourceResolver instance. Only two types are supported:<ul><li>__path__ - Specifies to use an internal SharedDataSourceResolver instance that will resolve the resources from a given directory specified in the `<parameters>` element.</li><li>__custom__ - Specifies to use a custom SharedDataSourceResolver instance that implements [Telerik.Reporting.Interfaces.ISharedDataSourceResolver](/reporting/api/Telerik.Reporting.Interfaces.ISharedDataSourceResolver) interface. It will be instantiated at runtime from the type name specified in the `<parameters>` element.</li></ul>|
|Child elements| __parameters__ – specifies a collection of parameters for the resource resolver in the `<sharedDataSourceResolver>` element. Only one __parameters__ element can be used in the `<sharedDataSourceResolver>` element.<br/>__Supported parameters for *path* provider__<ul><li>__name__ : _directory_</li><li>__value__ : the path to the directory that contains the resources to be resolved.</li></ul>__Supported parameters for *custom* provider__<ul><li>__name__ : _typeName_</li><li>__value__ : the assembly qualified name of the type that implements the [Telerik.Reporting.Interfaces.ISharedDataSourceResolver](/reporting/api/Telerik.Reporting.Interfaces.ISharedDataSourceResolver) interface.</li></ul>The parameters collection of the __custom__ provider can contain additional entries that will be passed to the constructor of the type. If no additional parameters are specified, the parameterless constructor will be used.|
|Parent element| __processing__ - specifies the parent element of the Telerik Reporting configuration settings.|

## See Also

* [Application Configuration Files](http://msdn.microsoft.com/en-us/library/windows/desktop/aa374182(v=vs.85).aspx)
* [How the Runtime Locates Assemblies](https://docs.microsoft.com/en-us/dotnet/framework/deployment/how-the-runtime-locates-assemblies)
* [`<probing>` Element](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/probing-element)
* [Configure the Reporting Engine (Overview)]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
