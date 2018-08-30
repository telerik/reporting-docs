---
title: How to use information from HttpContext in Custom Report Resolver
description: How to copy the needed information from HttpContext to UserIdentity.Context
type: how-to
page_title: Pass HttpContext items to reporting engine 
slug: how-to-pass-information-from-httpcontext-to-reporting-engine
position: 
tags: 
ticketid: 1173333
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>from 12.1 18.620</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
Starting with version [12.0.18.416](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-r1-2018-sp3-12-0-18-416), _System.Web.HttpContext.Current_ is no longer available in the report rendering thread.  
  
Removing _HttpContext.Current_ in the report rendering thread was a necessary change. Its purpose was to allow the rendering engine to use a dedicated rendering thread queue with configurable count, which should significantly improve product's performance.

## Solution
To access the current user context, you can use the [Telerik.Reporting.Processing.UserIdentity.Current](https://docs.telerik.com/reporting/p-telerik-reporting-processing-useridentity-current) static property. It is also possible to use the new [UserIdentity ](https://docs.telerik.com/reporting/expressions-global-objects#useridentity)object in the expression context as a global object: _=UserIdentity_.  

With the changes introduced in [Telerik Reporting 12.1.18.620](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620) it is possible to use the [UserIdentity.Context](https://docs.telerik.com/reporting/p-telerik-reporting-processing-useridentity-context) property to store user objects (for example from the _HttpContext_).
**UserIdentity.Context** can be filled up with the needed values in the _ReportsController_ by overriding the **GetUserIdentity()** method. Here is a sample code :  

```CSharp
// include in the ReportsController class

protected override UserIdentity GetUserIdentity()
{
    var identity = base.GetUserIdentity();
    identity.Context = new System.Collections.Concurrent.ConcurrentDictionary<string, object>();
    identity.Context["UrlReferrer"] = System.Web.HttpContext.Current.Request.UrlReferrer;
    
    // Any other available information can be stored in the identity.Context in the same way

    return identity;
}
```
  
The __UserIdentity.Current.Context\["UrlRefferer"\]__ should then be used (instead of _HttpContext.Current.Request.UrlReferrer_) to access the corresponding property/information.
For example, you can access the _UrlRefferer_ as :  
  
```CSharp
// can be included in the Resolve() method of the Custom Report Resolver
Uri urlReferrer = (Uri)UserIdentity.Current.Context["UrlRefferer"];
```
