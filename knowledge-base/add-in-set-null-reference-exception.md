---
title: Telerik.Reporting.Cache.CacheStorage.AddInSet NullReferenceException
description: NullReferenceException at Telerik.Reporting.Cache.CacheStorage.AddInSet(String key, String value)
type: troubleshooting
page_title: AddInSet NullReferenceException
slug: add-in-set-null-reference-exception
position: 
tags: reportviewer,storage
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
The following exception occurs when the report viewer attempts to request a report:
```
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
The stack trace shows that the exception happens when the REST service tries to interact with the storage. The method which throws is called **AddInSet**. Here is the implementation of this method:
``` CSharp
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
The **System.Diagnostics.Trace.WriteLine(error)** code line means that if a trace listener is attached, the error message above will be present in the trace listener log.

The error message above might mean that either the file storage got corrupted, or the service is in a multiple-instance environment (web farm environment) and the default implementation of the REST service storage ([FileStorage](https://docs.telerik.com/reporting/t-telerik-reporting-cache-file-filestorage)) is not suitable for such environment. The issue can be approached depending on the environment specifications:

1. In **web farm environments** it is recommended to change the storage to use a **MsSqlServerStorage** or **RedisStorage** implementation. For further details check [IStorage implementation suitable for deploying in Web Farms](https://docs.telerik.com/reporting/telerik-reporting-rest-service-storage#istorage-implementation-suitable-for-deploying-in-web-farms).

2. In **single-instance environments** reset the report viewer storage data by deleting the contents of the file storage location. By default, the REST Service is using *the current user's temporary folder*. In case of using Telerik Report Server the default file storage is placed in the product installation folder, i.e. *C:\Program Files (x86)\Progress\Telerik Report Server\Telerik.ReportServer.Web\Data* (delete only the folder with the randomly generated name and leave the TRS folder which contains the Report Server data intact). 
We recommend creating a backup before resetting the storage.



## See Also
* [REST Service Storage Overview](https://docs.telerik.com/reporting/telerik-reporting-rest-service-storage)
* [How To: Configure MS Sql database storage](https://docs.telerik.com/reporting/telerik-reporting-rest-howto-use-mssql-storage)
* [How to: Use Redis storage](https://docs.telerik.com/reporting/telerik-reporting-rest-howto-use-redis-storage)
