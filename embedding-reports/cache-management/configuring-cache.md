---
title: Cache Management
page_title: Configuring the Cache Management System of the Reporting Engine
description: "Learn how to configure the cache management system of the Reporting engine by specifying a cache provider when working with Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-cache
previous_url: /using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-cache, /configuring-telerik-reporting-session-state
tags: telerik, reporting, embedding, reports, cache, management, configuring
published: True
position: 1
reportingArea: General
---

<style>
table th:first-of-type {
	width: 13%;
}
table th:nth-of-type(2) {
	width: 57%;
}
table th:nth-of-type(3) {
	width: 30%;
}
</style>

# Configuring the Cache Management System

> The cache settings mentioned in this article are not obligatory, and they do not apply to the __HTML5 Report Viewer__ or its Angular, WebForms, MVC and other wrappers. Details about the Cache Storage of the Reporting REST Service that works with the HTML5 Report Viewer are available in [Report Viewer and Reporting REST services]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%}) and [REST Service Storage Settings]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}).

The cache management system can be configured by specifying one or more cache providers in the [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) of the application’s configuration file. For example, the following XML snippet configures the cache to store the rendered pages and resources in the file system:

````XML
<Telerik.Reporting>
	<Cache provider="File" />
</Telerik.Reporting>
````

The "provider" attribute of the "Cache" element specifies the name of the current cache provider used by the viewers. There are several preconfigured providers that can be used by applications without any additional setup: 

| Provider | Description | Parameters |
| ------ | ------ | ------ |
|__Auto__|The actual provider is chosen automatically according to the characteristics of the stored resource and the permissions granted to the application. This is the default setting if the "Cache" element is omitted from the configuration section.|__BasePath__ - specifies the location in which to store the files when __File__ cache provider has been chosen.|
|__Memory__|All rendered pages and resources are stored in memory. Use this setting to improve the performance when rendering relatively small reports in desktop applications. However, this could also increase the memory footprint of the application significantly for large reports.|No parameters are defined for this provider.|
|__File__|All rendered pages and resources are stored as temporary files in the file system.|__BasePath__ - specifies the location in which to store the files.|
|__IsolatedStorage__|All rendered pages and resources are stored as temporary files in the isolated storage.|No parameters are defined for this provider.|
|__Database__|Stores all resources in database. Uses __Telerik Data Access__ to access the database.|<ul><li>__BackendName__ - specifies the name of the chosen backend.</li><li>__ConnectionString__ - specifies the connection string to the database.</li></ul>|
|__ADO.NET__|Stores all resources in the database. Uses __ADO.NET__ provider to access the database.|<ul><li>__ProviderName__ - specifies the ADO.NET provider.</li><li>__ConnectionString__ - specifies the connection string to the database.</li></ul>|

>note When the __Auto__ cache provider is __not__ explicitly specified in the __Cache__ section it resorts to using only __Memory__ cache if the ASP.NET Session state is configured as out-of-process. When the __Auto__ cache provider is explicitly set, the __BasePath__ parameter should specify a shared folder if using the web application in a web farm.

>note When using the __File__ cache provider in an ASP.NET application deployed on a web farm, the __BasePath__ parameter should specify a shared folder with the necessary permissions which should be accessible from all servers.

>note __IsolatedStorage__ cache provider should not be used in web applications configured to use an out-of-process ASP.NET Session state mode.

The individual providers are registered by adding one or more "Provider" elements. The "name" attribute specifies the friendly name of the provider and the "type" attribute specifies the assembly-qualified type name of that provider. It is not necessary to specify the "type" for the preconfigured providers in the table above. If the provider requires additional parameters, these can be specified under the "Parameters" child element of the "Provider" element. The individual parameters are specified by adding one or more "Parameter" elements. The "name" attribute specifies the name of the parameter and the "value" attribute specifies the value of that parameter.

````XML
<Telerik.Reporting>
	<Cache provider="File">
		<Providers>
			<Provider name="File">
				<Parameters>
					<Parameter name="BasePath" value="C:\MyDataCache" />
				</Parameters>
			</Provider>
		</Providers>
	</Cache>
</Telerik.Reporting>
````


## See Also

* [Configuring the File Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-file-cache-provider%})
* [Configuring the Database Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%})
* [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
