---
title: processing Element
page_title: Configuring the processing Element
description: "Learn how to configure the processing options of the reporting engine, such as whether the definition properties should be cached, or to set up custom SharedDataSource and Resources resolvers."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element
tags: processing, element
published: True
position: 3
previous_url: /configuring-telerik-reporting-cacheDefinitionProperties
reportingArea: General
components: [general]
---

<style>
table th:first-of-type {
	width: 10%;
}
table th:nth-of-type(2) {
	width: 90%;
}
</style>

# processing Element Overview

The Processing element specifies the configuration settings that will be applied during the processing of the report.

## `<processing>` element

The following table summarizes the configuration parts of the `<processing>` element. The attributes and child elements are described in the sections below.

| Configuration part | Description |
| ------ | ------ |
|Attributes|See [Processing Attributes](#processing-attributes) for the optional processing settings.|
|Child elements|See [Processing Child Elements](#processing-child-elements) for the optional resolvers, graphics engine, and external report paths.|
|Parent element|__Telerik.Reporting__ - specifies the root element of the Telerik Reporting configuration settings. Only one `<processing>` element can be used in the `Telerik.Reporting` element.|

### Processing Attributes

The `<processing>` element supports the following attributes:

* __cacheDefinitionProperties__ - optional boolean attribute. Determines if the report definition properties will be cached during the processing, making them immutable.
* __allowCultureDependentDataFieldNames__ - optional boolean attribute, disabled by default. Determines whether the processing engine uses culture-dependent string comparison. Keeping it disabled improves general processing performance.
* __traceVerbosity__ - optional attribute of type [TraceLevel](https://learn.microsoft.com/en-us/dotnet/api/system.diagnostics.tracelevel), **Info** by default. Determines the verbosity of the default trace output.
* __validateReportPaths__ - optional boolean attribute, **enabled** by default. Determines whether report source paths can be resolved outside the base path specified in the [UriReportSourceResolver when using Reporting REST Services](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview), or the base application path when using embedded Reporting Engine or [rendering with the ReportProcessor](slug:telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine). When enabled, only [UNC (network) paths](https://learn.microsoft.com/en-us/dotnet/standard/io/file-path-formats#unc-paths) listed in the _externalReportPaths_ child element would be allowed. Keeping it enabled is the recommended configuration in terms of security.

### Processing Child Elements

The `<processing>` element supports the following child elements:

* __resourceResolver__ – optional element. Changes the behavior of the default resource resolving mechanism. Only one `resourceResolver` element can be used in the `<processing>` element.
* __sharedDataSourceResolver__ – optional element. Changes the behavior of the default SharedDataSource resolving mechanism. Only one `sharedDataSourceResolver` element can be used in the `<processing>` element.
* __graphicsEngine__ – optional element. Sets the graphics engine used for processing and rendering the reports. Only one `graphicsEngine` element can be used in the `<processing>` element.
* __externalReportPaths__ - optional element. A collection of explicitly allowed UNC (network) paths for report document resolution. The collection is taken into account only when the optional attribute _validateReportPaths_ is _enabled_ (default).

### Example

The following XML and JSON examples show how to configure the report engine's processing settings.

{{source=CodeSnippets\MvcCS\XmlConfiguration\ProcessingElementConfiguration.xml region=ProcessingElementConfiguration}}
{{source=CodeSnippets\Blazor\Docs\JSON\ProcessingConfig.json region=ProcessingConfig}}

## CacheDefinitionProperties

We provide a mechanism for caching the report definition properties that boost performance. Naturally, it prevents modifying the report during the processing stage. The default value of the property is __True__.

The [Report Events](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview) are not intended to be used to modify the report definition, as explained in the [Understanding Events](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/understanding-events) article. For that reason, in [R3 2016 (10.2.16.914)](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-r3-2016-(version-10-2-16-914)), we introduced a change - `cacheDefinitionProperties` which caches the report definition properties, so such modifications are not respected. Setting the _cacheDefinitionProperties_ to _false_ will skip the definition item properties caching, which will allow the report definition to be changed in the report events. This may result in a performance penalty, though.

Starting with [R3 2022 SP1 (16.2.22.1109)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2022-sp1-16-2-22-1109), `CacheDefinitionProperties` was exposed as a Report definition property in the `ReportEngineSettings` properties collection, so that you may specify it per Report. The property value may be set to `Default`, `True`, or `False`. The `Default`, which is the default value, lets you specify that the Reporting engine should respect the _cacheDefinitionProperties_ set in its configuration on the project level.

## Graphics Engine

The __graphicsEngine__ element was introduced with the Skia graphics engine in [R3 2023 (17.2.23.1010)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010). It sets the graphics engine used for processing and rendering the reports. There are two implementations of the graphics engine: GDI-based and SkiaSharp-based. GDI is not supported on non-Windows platforms for applications that target .NET {{site.mindotnetversion}} or higher. Skia implementation has cross-platform support. The active implementation is determined by the value of the  __engineName__ element, which corresponds with the members of the [Telerik.Drawing.Contract.GraphicsEngine](/api/Telerik.Drawing.Contract.GraphicsEngine) enumeration.

If the __graphicsEngine__ element is not present in the configuration file, the *PlatformDependent* value will be used.
Skia implementation is not available in applications that target the .NET Framework. They can only work with the GDI graphics engine.

### `<graphicsEngine>` element

The following table describes the attribute of the `<graphicsEngine>` element. Its supported values are listed in the next section.

| Configuration part | Description |
| ------ | ------ |
|Attributes| __engineName__ – required string attribute. Determines the type of [Telerik.Drawing.Contract.GraphicsEngine](/api/Telerik.Drawing.Contract.GraphicsEngine) used in the application.|

#### Engine Name Values

The `engineName` attribute supports the following values:

* __PlatformDependent__ - the default value. On the Windows platform, the application will use the GDI graphics engine. On non-Windows platforms, the application will use the Skia graphics engine.
* __Gdi__ - the application will use GDI+ graphics engine. On non-Windows platforms, this will cause runtime exceptions of type __PlatformNotSupported__ to be thrown. Available for applications that target either .NET Framework or .NET.
* __Skia__ - uses SkiaSharp for rendering. Can be used on Windows and non-Windows platforms in applications that target .NET (.NET Framework is not supported).

## Validate Report Paths

By default, the declarative report definitions (TRDP, TRDX, and TRBP files) can be resolved only from paths within the application hosting the Reporting Engine when using ReportProcessor or embedded Reporting Engine with the desktop viewers; the `UriReportSourceResolver` when using Reporting REST Services; and those specified in the __externalReportPaths__ element. The attribute __validateReportPaths__ lets you allow all external paths by setting it to _false_ (the default is _true_).

### `<externalReportPaths>` element

Add external [UNC (network) paths](https://learn.microsoft.com/en-us/dotnet/standard/io/file-path-formats#unc-paths) for report document resolution. The collection is taken into account only when the optional attribute _validateReportPaths_ is _enabled_ (default).

## ResourceResolver

__resourceResolver__ element allows to alter the default resource-resolving mechanism. This element determines which implementation of the [Telerik.Reporting.Interfaces.IResourceResolver](/api/Telerik.Reporting.Interfaces.IResourceResolver) interface will be used by the processing engine to resolve the resources that are specified in the report definition. Such resources are:

* Images used by [Telerik.Reporting.PictureBox](/api/Telerik.Reporting.PictureBox) and [Telerik.Reporting.CheckBox](/api/Telerik.Reporting.CheckBox) report items, referenced by a relative path.
* Elements from the report's [Telerik.Reporting.Drawing.ExternalStyleSheet](/api/Telerik.Reporting.Drawing.ExternalStyleSheet) collection, referenced by a relative path.
* __Source__ property of [Telerik.Reporting.CsvDataSource](/api/Telerik.Reporting.CsvDataSource) and [Telerik.Reporting.JsonDataSource](/api/Telerik.Reporting.JsonDataSource) report items, referenced by a relative path.

Use a custom __ResourceResolver__ to retrieve resources from storage other than a local file path. For example, Telerik Report Server can store its assets in files, an MSSQL database, or a Redis database. A custom resolver retrieves resources as byte arrays using the resource identifiers from the report definition.

For file-based resources, the `path` provider described below resolves resources from the directory specified in its `<parameters>` element.

### `<resourceResolver>` element

The following table summarizes the `<resourceResolver>` configuration. Provider choices and their supported parameters are described in the sections below.

| Configuration part | Description |
| ------ | ------ |
|Attributes| __provider__ – required string attribute. Determines the provider type of the ResourceResolver instance. Only `path` and `custom` are supported.|
|Child elements| __parameters__ – specifies a collection of parameters for the resource resolver in the `<resourceResolver>` element. Only one __parameters__ element can be used in the `<resourceResolver>` element.|
|Parent element| __processing__ - specifies the parent element of the Telerik Reporting configuration settings.|

#### Resource Resolver Providers

The `provider` attribute supports the following types:

* __path__ - Specifies to use an internal ResourceResolver instance that will resolve the resources from a given directory specified in the `<parameters>` element.
* __custom__ - Specifies to use a custom ResourceResolver instance that implements [Telerik.Reporting.Interfaces.IResourceResolver](/api/Telerik.Reporting.Interfaces.IResourceResolver) interface. It will be instantiated at runtime from the type name specified in the `<parameters>` element.

#### Supported Parameters for the path Resource Resolver Provider

Set the following parameter in the `<parameters>` collection:

* __name__: _directory_
* __value__: the path to the directory that contains the resources to be resolved.

#### Supported Parameters for the custom Resource Resolver Provider

Set the following parameter in the `<parameters>` collection:

* __name__: _typeName_
* __value__: the assembly qualified name of the type that implements the [Telerik.Reporting.Interfaces.IResourceResolver](/api/Telerik.Reporting.Interfaces.IResourceResolver) interface.

The parameters collection of the __custom__ provider can contain additional entries that will be passed to the constructor of the type. If no additional parameters are specified, the parameterless constructor will be used.

## SharedDataSourceResolver

__sharedDataSourceResolver__ element allows to alter the default shared DataSource(`.sdsx`)-resolving mechanism. This element determines which implementation of the [Telerik.Reporting.Processing.Data.ISharedDataSourceResolver](/api/Telerik.Reporting.Processing.Data.ISharedDataSourceResolver) interface will be used by the processing engine to resolve the shared DataSources references that are specified in the report definition.

This __SharedDataSourceResolver__ is intended to be used in scenarios where the `.sdsx` files are not retrieved from a local file path but rather obtained from a different type of storage. As an example, if a custom [Telerik.WebReportDesigner.Services.ISharedDataSourceStorage](/api/Telerik.WebReportDesigner.Services.ISharedDataSourceStorage) is implemented where the `.sdsx` files are stored in a database, then a custom `SharedDataSourceResolver` would be necessary to provide specific logic that will retrieve the `.sdsx` XML from the database and will then [Deserialize](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml#deserialize-from-xml) it to an instance of the [Telerik.Reporting.DataSource](/api/Telerik.Reporting.DataSource) class and return it in the `Resolve` method.

### `<sharedDataSourceResolver>` element

The following table summarizes the `<sharedDataSourceResolver>` configuration. Provider choices and their supported parameters are described in the sections below.

| Configuration part | Description |
| ------ | ------ |
|Attributes| __provider__ – required string attribute. Determines the provider type of the SharedDataSourceResolver instance. Only `path` and `custom` are supported.|
|Child elements| __parameters__ – specifies a collection of parameters for the resource resolver in the `<sharedDataSourceResolver>` element. Only one __parameters__ element can be used in the `<sharedDataSourceResolver>` element.|
|Parent element| __processing__ - specifies the parent element of the Telerik Reporting configuration settings.|

#### Shared Data Source Resolver Providers

The `provider` attribute supports the following types:

* __path__ - Specifies to use an internal SharedDataSourceResolver instance that will resolve the resources from a given directory specified in the `<parameters>` element.
* __custom__ - Specifies to use a custom SharedDataSourceResolver instance that implements [Telerik.Reporting.Processing.Data.ISharedDataSourceResolver](/api/Telerik.Reporting.Processing.Data.ISharedDataSourceResolver) interface. It will be instantiated at runtime from the type name specified in the `<parameters>` element.

#### Supported Parameters for the path Shared Data Source Resolver Provider

Set the following parameter in the `<parameters>` collection:

* __name__: _directory_
* __value__: the path to the directory that contains the resources to be resolved.

#### Supported Parameters for the custom Shared Data Source Resolver Provider

Set the following parameter in the `<parameters>` collection:

* __name__: _typeName_
* __value__: the assembly qualified name of the type that implements the [Telerik.Reporting.Processing.Data.ISharedDataSourceResolver](/api/Telerik.Reporting.Processing.Data.ISharedDataSourceResolver) interface.

The parameters collection of the __custom__ provider can contain additional entries that will be passed to the constructor of the type. If no additional parameters are specified, the parameterless constructor will be used.

## See Also

* [Application Configuration Files](https://learn.microsoft.com/en-us/windows/win32/sbscs/application-configuration-files)
* [How the Runtime Locates Assemblies](https://learn.microsoft.com/en-us/dotnet/framework/deployment/how-the-runtime-locates-assemblies)
* [`<probing>` Element](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/probing-element)
* [Configure the Reporting Engine (Overview)](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview)
