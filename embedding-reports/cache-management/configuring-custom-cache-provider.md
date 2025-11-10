---
title: Custom Cache Providers
page_title: Configuring Custom Cache Providers for the Reporting engine
description: "Learn how to configure a custom cache provider for the Reporting engine when working with Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-custom-cache-provider
previous_url: /using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-custom-cache-provider, /configuring-telerik-reporting-custom-provider
tags: telerik, reporting, embedding, reports, cache, management, configuring, custom, provider
published: True
position: 4
reportingArea: General
---

# Configuring Custom Cache Providers

> The cache settings mentioned in this article are not obligatory, and they do not apply to the __HTML5 Report Viewer__ or its Angular, WebForms, MVC and other wrappers. Details about the Cache Storage of the Reporting REST Service that works with the HTML5 Report Viewer are available in [Report Viewer and Reporting REST services]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%}) and [REST Service Storage Settings]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}).

Except the preconfigured cache providers, additional providers can be used. To do that create a __MyCache__ class that implements the Telerik.Reporting.Cache.Interfaces.ICache interface. Then implement the Telerik.Reporting.Cache.Interfaces.ICacheProvider interface and its only method should return a new instance of the __MyCache__ class.

> The cache provider should have a parameterless constructor in order to be instantiated by the Reporting engine.

{{source=CodeSnippets\CS\API\Telerik\Reporting\CustomCacheProviderSnippets.cs region=CustomCacheProviderImplementation}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\CustomCacheProviderSnippets.vb region=CustomCacheProviderImplementation}}

{{source=CodeSnippets\CS\API\Telerik\Reporting\CustomCacheProviderSnippets.cs region=CustomCacheImplementation}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\CustomCacheProviderSnippets.vb region=CustomCacheImplementation}}

To register this new provider set the __provider__ attribute of the "Cache" element to the class name which implements ICacheProvider. Under "Providers" child element of the "Cache" element, create a "Provider" element with the same __name__ attribute as the __provider__ attribute of the "Cache" element. The __type__ attribute should be the [assembly qualified name](https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?view=net-7.0#System_Type_AssemblyQualifiedName) of MyCacheProvider type. The following code snippet demonstrates how to configure such custom provider:

````XML
<Telerik.Reporting>
	<Cache provider="MyCacheProvider">
		<Providers>
			<Provider name="MyCacheProvider" type="MyNameSpace.MyCacheProvider, AssemblyName, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
				<Parameters>
					<Parameter />
				</Parameters>
			</Provider>
		</Providers>
	</Cache>
</Telerik.Reporting>
````


## See Also

* [Configuring Cache]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-cache%})
* [Configuring the File Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-file-cache-provider%})
* [Configuring the Database Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%})
