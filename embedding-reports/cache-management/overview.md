---
title: Overview
page_title: Cache Management System Explained
description: "Learn more about the dedicated Telerik Reporting cache management system which stores and caches rendered pages and large resources."
slug: telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/overview
previous_url: /using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/overview, /using-telerik-reporting-in-applications-session-state-management, /embedding-reports/cache-management/
tags: telerik, reporting, embedding, reports, cache, management, system, overview
published: True
position: 0
---

# Cache Management System Overview

__Telerik Reporting__ uses a dedicated cache management system to store and cache rendered pages and some large resources such as images on external storage. This cache management system is utilized by the Reporting Engine that processes and renders the reports.

> The cache settings mentioned in this article are not obligatory, and they do not apply to the __HTML5 Report Viewer__ or its Angular, WebForms, MVC, and other wrappers. Details about the Cache Storage of the Reporting REST Service that works with the HTML5 Report Viewer are available in [Report Viewer and Reporting REST services]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%}).

The report viewers with embedded Reporting Engine use the cache management system automatically as shown in the following illustration:

![The report rendering workflow diagram with the cache system is shown schematically.](images/SessionState/sessionmanagement1.png)

Here is the list of Report Viewers that work with embedded Reporting Engine:

* __WinForms ReportViewer__ - settings must be applied in the application configuration file. By default the viewer keeps the report state in memory;
* __WPF ReportViewer__ - settings must be applied in the application configuration file. By default the viewer keeps the report state in memory;
* __Silverlight ReportViewer (not supported since R1 2023 SP1)__ - settings must be applied in the [Reporting WCF service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview%}) application configuration file. By default the viewer keeps the report state in memory;
* __ASP.NET WebForms ReportViewer (obsolete web viewer)__ - settings must be applied in the application configuration file. By default the viewer keeps the report state in the ASP.NET Session;

The Reporting REST Service that serves report documents to the HTML5-based Report Viewers hosts a Reporting Engine that also utilizes the cache management system while rendering the report documents. After finishing with the rendering, the REST Service moves the prepared document or document pages and all the needed resources, for example, the images for the HTML renderings to the [REST Service Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}) and releases the cache.

The utilization of the cache management system constitutes an important difference between the viewers working with embedded Reporting Engine and with Reporting REST Service. The former reuse the processing report, hence fetching and processing the data only once for a report, storing the necessary processing objects in the cache. The REST Service processes the report again with each new rendering.

## Cache Management

Such cache management implementation offers the following key benefits:

* __Reduced memory footprint__ – since the rendered pages and resources are cached on external storage rather than being kept in memory, the viewers can handle very large reports with thousands of pages and images without increasing the memory consumed by the application too much.
* __Improved performance__ – the caching mechanism implemented by the cache management system can lead to improved performance of the viewers in certain scenarios.
* __Improved scalability__ – web farms can be configured to cache rendered reports on a dedicated database server. This allows subsequent requests to the same report to be served by different machines in the web farm leading to better load balancing. Only the database storage is shared between all machines in the farm, as shown in the following illustration:

	![Shared database storage between all machines in a web farm shown schematically.](images/SessionState/sessionmanagement2.png)

## See Also

* [Configuring Cache]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-cache%})
* [Configuring the File Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-file-cache-provider%})
* [Configuring the Database Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%})
* [Configuring Custom Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-custom-cache-provider%})
