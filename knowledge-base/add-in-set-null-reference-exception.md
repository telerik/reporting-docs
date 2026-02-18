---
title: An AddInSet NullReferenceException Is Thrown on Requesting Reports
page_title: AddInSet NullReferenceException on Requesting Reports
description: "Learn how to handle the AddInSet NullReferenceException thrown when requesting reports in Telerik Reporting."
type: troubleshooting
slug: add-in-set-null-reference-exception
tags: telerik, reporting, reportviewer, storage, addint, null, reference, exception, is, thrown
ticketid: 1173719
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

An `AddInSet NullReferenceException` is thrown when the report viewer attempts to request a report.

## Error Message

```JSON
exceptionMessage: "Object reference not set to an instance of an object."
exceptionType: "System.NullReferenceException"
message: "An error has occurred."
stackTrace: "
	at Telerik.Reporting.Cache.CacheStorage.AddInSet(String key, String value)
	at Telerik.Reporting.Services.Engine.PersistableCollection`1.NewItem(String newID, Action`1 initializeObject)
	at Telerik.Reporting.Services.Engine.ReportEngine.RegisterClient()
	at Telerik.Reporting.Services.WebApi.ReportsControllerBase.RegisterClient()
	at Telerik.ReportServer.Web.Controllers.Api.ReportsController.<RegisterClient>b__2()
	at Telerik.ReportServer.Web.Controllers.Api.ReportsController.DoIfUserAvailable(Func`1 action)
	at Telerik.ReportServer.Web.Controllers.Api.ReportsController.RegisterClient()"
```

## Solution

The stack trace shows that the exception happens when the REST service tries to interact with the storage. The method which throws the exception is `AddInSet`.

The following example demonstrates the implementation of `AddInSet`.

```C#
public void AddInSet(string key, string value)
{
	using (this.AcquireSetLock(key))
	{
		var raw = this.GetBytes(key);
		var set = null == raw ? new HashSet<string>() : SerializationUtils.Deserialize<HashSet<string>>(raw);
		if (set == null)
		{
			// Not localizable by design
			const string error = "Incorrect value (null) deserialized. Make sure you are using CacheStorage inside single-instance application deployment only.";

			System.Diagnostics.Trace.WriteLine(error);
			throw new ApplicationException(error);
		}
		set.Add(value);
		this.SetBytes(key, SerializationUtils.Serialize(set));
	}
}
```

The `System.Diagnostics.Trace.WriteLine(error)` code line means that if a trace listener is attached, the error message above will be present in the trace listener log.

The error message might mean that either the file storage got corrupted, or the service is in a multiple-instance environment (web farm environment) and the default implementation of the REST service storage [FileStorage](/api/telerik.reporting.cache.file.filestorage) is not suitable for such environment.

Depending on the environment specifications, you can approach the issue in the following ways:

- In web farm environments, it is recommended to change the storage to use an `MsSqlServerStorage` or `RedisStorage` implementation. For further details, refer to the article on [IStorage implementation suitable for deploying in Web Farms]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}).
- In single-instance environments, reset the report viewer storage data by deleting the contents of the file storage folder. By default, the REST Service is using the temporary folder of the current user. If you are using the Telerik Report Server, the default file storage is placed in the product installation folder, that is, in `C:\Program Files (x86)\Progress\Telerik Report Server\Telerik.ReportServer.Web\Data`. Delete only the folder with the randomly generated name and leave the TRS folder which contains the Report Server data intact.

> tip It is recommended that you create a backup before resetting the storage.

## See Also

- [REST Service Storage Overview]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%})
- [Configuring MS SQL Database Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-configure-an-mssql-database-storage%})
- [Using Redis Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-use-redis-storage%})
