---
title: restReportService Element
page_title: Configuring the restReportService Element
description: "Learn how to set the Reporting REST Service configuration settings from the configuration file of the running project via the restReportService configuration element."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element
tags: restreportservice,element
published: True
position: 5
previous_url: /configuring-telerik-reporting-restreportservice

---
<style>
table th:first-of-type {
	width: 10%;
}
table th:nth-of-type(2) {
	width: 90%;
}
</style>

# restReportService Element Overview

The `restReportService` element specifies the configuration settings for the Reporting REST Service. For this element to be respected, the corresponding Reports service implementation should pass a [ConfigSectionReportServiceConfiguration](/api/Telerik.Reporting.Services.ConfigSectionReportServiceConfiguration) instance instead of a [ReportServiceConfiguration](/api/Telerik.Reporting.Services.ReportServiceConfiguration) instance.

For example, initializing the [ReportServiceConfiguration](/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_ReportServiceConfiguration) for the [ReportsControllerBase](/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase) instance would look like this:

````CSharp
configurationInstance = new ConfigSectionReportServiceConfiguration
{
	HostAppId = "Html5DemoApp",
	ReportSourceResolver = new UriReportSourceResolver("PATH_TO_REPORTS_FOLDER")
		.AddFallbackResolver(new TypeReportSourceResolver());,
};
````

>note The initialization block does not have the [Storage](/api/Telerik.Reporting.Services.IReportServiceConfiguration#Telerik_Reporting_Services_IReportServiceConfiguration_Storage) property set, because it would override the values obtained from the configuration file.

## Attributes and Elements

__`<restReportService>` element__

|   |   |
| ------ | ------ |
|Attributes|<ul><li>__hostAppId__ – optional string attribute. Specifies a unique constant name among the applications hosting a reports service and reusing the same storage destination. The ID is used as a prefix when composing the storage keys to avoid data overlap between apps. When not set, the report service utilizes the [AppDomainSetup.ApplicationName property](https://learn.microsoft.com/en-us/dotnet/api/system.appdomainsetup.applicationname?view=netframework-4.8#System_AppDomainSetup_ApplicationName) of the current application domain. In some cases, this default value might not be unique enough.</li><li>__workerCount__ – optional integer attribute. Specifies the count of the worker threads that render report documents. The default value is equal to the logical processors available on the server machine.</li><li>__clientSessionTimeout__ – optional integer attribute. Specifies the value in minutes indicating how long a client session will be preserved in the service storage after the last interaction from this client. The value must be greater than zero. The default value is 15 minutes.</li><li>__reportSharingTimeout__ – optional integer attribute. Specifies the value in minutes indicating how long a rendered report document will be viable for reuse for all clients. The value must be greater than or equal to zero. A zero value will prevent rendered report document reuse by other clients. The client that has rendered the report originally will still reuse it. The default value is zero.</li><li>__exceptionsVerbosity__ – optional string attribute. Specifies the verbosity level of the exception information returned in the response when an exception occurs during report rendering. The supported values are *normal* and *detailed*. When set to *normal*, the response will contain only the exception message. When set to *detailed*, the response will contain the exception type and stack trace. The default value is *normal*.</li></ul>|
|Child elements|<ul><li>__reportResolver__ – specifies the report source resolver implementation that will be used for report resolving from the service.</li><li>__storage__ – specifies the storage implementation that will be used for internal storage from the report service.</li></ul>|
|Parent element|__Telerik.Reporting__ – specifies the root element of the Telerik Reporting configuration settings. Only a single restReportService child element can be used inside the Telerik.Reporting root element.|

__`<reportResolver>` element__

|   |   |
| ------ | ------ |
|Attributes|<ul><li>__provider__<ul><li>__file__<ul><li>__directory__ - string parameter. Specifies the physical directory where reports are located. Used as path prefix when relative path is passed for resolving.</li></ul></li><li>__type__</li></ul></li></ul>|
|Child elements|__parameters__ – specifies a collection of parameters for the current provider. Only one __parameters__ child element can be used in the __provider__ parent element.|
|Parent element|__restReportService__|

__`<storage>` element__

|   |   |
| ------ | ------ |
|Attributes|<ul><li>__provider__<ul><li>__redis__<ul><li>__configuration__ - string parameter. The [Redis configuration string](https://stackexchange.github.io/StackExchange.Redis/Configuration). </li><li>__databaseNumber__ - optional integer parameter. Determines the number of the database that should be used.</li></ul></li><li>__msSqlServer__<ul><li>__connectionString__ - string parameter. The connection string to the backend storage.</li><li>__commandTimeout__ - optional integer parameter. Determines the CommandTimeout that will be used when executing database commands, in seconds. The default value is 30.</li></ul></li><li>__file__<ul><li>__directory__ - optional string parameter. The directory which will contain the files representing the stored values.</li></ul></li><li>__database__<ul><li>__backendName__ - string parameter. Specifies which database engine should be used.</li><li>__connectionString__ - string parameter. A connection string that should be used to connect to the cache database.</li></ul></li></ul></li></ul>|
|Child elements|__parameters__ – specifies a collection of parameters for the current provider. Only one __parameters__ child element can be used in the __provider__ parent element.|
|Parent element|__restReportService__|

## Examples

XML-based configuration file:

````XML
<configuration>
…
	<Telerik.Reporting>
		<restReportService hostAppId="Application1" workerCount="4" reportSharingTimeout="10" clientSessionTimeout="10" exceptionsVerbosity="detailed">
			<reportResolver provider="type" />
			<storage provider="file">
				<parameters>
					<parameter name="directory" value="C:\Temp\RestServiceStorage" />
				</parameters>
			</storage>
			<!--<storage provider="Redis">
				<parameters>
					<parameter name="configuration" value="localhost:10001" />
					<parameter name="databaseNumber" value="1" />
				</parameters>
			</storage>-->
			<!--<storage provider="MSSQLServer">
				<parameters>
					<parameter name="connectionString" value="Data Source=(local)\SQLEXPRESS;Initial Catalog=RestServiceStorage;Integrated Security=SSPI" />
					<parameter name="commandTimeout" value="60" />
				</parameters>
			</storage>-->
		</restReportService>
	</Telerik.Reporting>
…
</configuration>
````

JSON-based configuration file:

````JSON
"telerikReporting": {
	"restReportService": {
		"hostAppId": "Application1",
		"workerCount": 4,
		"reportSharingTimeout": 10,
		"clientSessionTimeout": 10,
		"exceptionsVerbosity": "detailed",
		"reportResolver": {
			"provider": "type"
		},
		"storage": {
			"provider": "file",
			"parameters": [
				{
					"name": "directory",
					"value": "c:\\temp"
				}
			]
		}
	},
}
````


## See Also

* [How to implement the ReportsController in an application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%})
* [How to Add Telerik Reporting REST ServiceStack to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/how-to-add-telerik-reporting-rest-servicestack-to-web-application%})
