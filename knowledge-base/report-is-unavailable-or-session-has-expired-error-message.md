---
title: Report is unavailable or session has expired error message
description: Report is unavailable or session has expired error message.
type: how-to
page_title: Report is unavailable or session has expired error message
slug: report-is-unavailable-or-session-has-expired-error-message
res_type: kb
---

   
 ## Description  
 The following error is displayed in the web viewer: **Report is unavailable or session has expired**  
   
 ## Solution 
 The **ASP<span>.</span>NET Report Viewer** and **Silverlight Report Viewer** use [**ASP.NET Session**](http://msdn.microsoft.com/en-us/library/ms972429.aspx) in order to preserve the report instance assigned to its Report property during page postbacks and for some design reasons as well, so Session should be enabled at all times!  
 We have narrowed down the possible reasons for this error to three categories:  
 
- **Session has expired**. If you try to refresh the report it would error out as the report is no longer available in session. The session expiration default value is 20 mins, so you might increase it if necessary.
- **Session is lost**. This could happen if the application pool has been recycled. It might be caused by insufficient memory for the asp.net process or due to an internal error (caused by incorrect program logic). Another possible scenario is when using a web farm. It is necessary that the session of the web applications is configured as **SQLServer** or **StateServer** so that it can be common for all applications. For more information please see: [Design Considerations for Out-proc Session State](../asp-net-report-viewer-outproc).
- **Session is unavailable** (ASP<span>.</span>NET Report Viewer only). This can happen if your browser does not accept cookies. In such cases, configuring the [session as cookieless](http://msdn.microsoft.com/en-us/library/aa479314.aspx) would resolve this.



