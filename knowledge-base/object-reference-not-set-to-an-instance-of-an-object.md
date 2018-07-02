---
title: Object reference not set to an instance of an object
description: System.NullReferenceException Object reference not set to an instance of an object. at Telerik.Reporting.Cache.CacheStorage.AddInSet(String key, String value)
type: troubleshooting
page_title: Object reference not set to an instance of an object
slug: object-reference-not-set-to-an-instance-of-an-object
position: 
tags: ReportViewer
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
Upon deploying, sometimes the following exception occurs when the report viewer attempts to request a report for rendering:
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
The **System.Diagnostics.Trace.WriteLine(error)** code line means that if you attach a trace listener as suggested in my previous reply the error message above will be present in the trace listener log.

The error message above might mean that either the file storage got corrupted, or you are using the service in a multiple-instance environment (web farm environment) and the default implementation of the REST service storage ([FileStorage](https://docs.telerik.com/reporting/t-telerik-reporting-cache-file-filestorage)) is not suitable for a multiple-instance environment. Based on the observations up until now I can offer two approaches to resolve this:

1. For *web farm environment scenario*, our recommendation is to change the storage to use a **MsSqlServerStorage** or **RedisStorage** implementation - For further reference, please check [IStorage implementation suitable for deploying in Web Farms](https://docs.telerik.com/reporting/telerik-reporting-rest-service-storage#istorage-implementation-suitable-for-deploying-in-web-farms) section of the help article.

2. For *single-instance environment scenario*, our assumption is that the file storage became corrupted. You can try to reset only the report viewer storage data by going to the file storage location. By default, the REST Service is using *the current user's temporary folder*. In case you are using Telerik Report Server - the default file storage is placed in product installation folder, i.e. *C:\Program Files (x86)\Progress\Telerik Report Server\Telerik.ReportServer.Web\Data* (delete only the folder with the randomly generated name and leave the TRS folder which contains the Report Server data). 
Before deleting anything, we recommend creating a back up just in case if valuable production data is already stored.



## See Also
* [REST Service Storage Overview](https://docs.telerik.com/reporting/telerik-reporting-rest-service-storage)
* [How To: Configure MS Sql database storage](https://docs.telerik.com/reporting/telerik-reporting-rest-howto-use-mssql-storage)
* [How to: Use Redis storage](https://docs.telerik.com/reporting/telerik-reporting-rest-howto-use-redis-storage)
