---
title: File Cache Provider
page_title: Configuring the File Cache Providers for the Reporting engine
description: "Learn how to configure the file cache provider for the Reporting engine when working with Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-file-cache-provider
previous_url: /using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-file-cache-provider, /configuring-telerik-reporting-file-session-state-provider
tags: telerik, reporting, embedding, reports, cache, management, configuring, file, provider
published: True
position: 2
reportingArea: General
---

# Configuring the File Cache Provider

> The cache settings mentioned in this article are not obligatory, and they do not apply to the __HTML5 Report Viewer__ or its Angular, WebForms, MVC and other wrappers. Details about the Cache Storage of the Reporting REST Service that works with the HTML5 Report Viewer are available in [Report Viewer and Reporting REST services]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%}) and [REST Service Storage Settings]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}).

The file cache provider is used to cache rendered pages and resources as temporary files on disk. This can help reducing the memory footprint of the application without sacrificing the performance significantly. It is necessary to configure the [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) first and then use the following XML snippet that configures the viewers in the application to use the file cache provider:

````XML
<Telerik.Reporting>
	<Cache provider="File" />
</Telerik.Reporting>
````

By default, this provider stores the files in the temporary folder of the current user. However it can be configured to store the files in another location by specifying the "BasePath" parameter, as illustrated below:

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

The __BasePath__ can represent either an absolute path on disk or a relative path. In the latter case the path is mapped to the application’s working directory.

> In web applications deployed on a web farm, the __BasePath__ parameter should specify a shared folder with the necessary permissions which should be accessible from all servers.

## See Also

* [Configuring Cache]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-cache%})
* [Configuring the Database Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%})
* [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
