---
title: HttpContext.Current.User is not available in the data-retrieval method executed by an ObjectDataSource component
description: HttpContext.Current.User is not available in the data-retrieval method executed by an ObjectDataSource component.
type: how-to
page_title: HttpContext.Current.User is not available in the data-retrieval method executed by an ObjectDataSource component
slug: httpcontext.current.user-is-not-available-in-the-data-retrieval-method-executed-by-an-objectdatasource-component
res_type: kb
---

## Description
 
**HttpContext.Current.User** is not available in the data-retrieval method executed by an ObjectDataSource component.  
  
## Solution
   
The data-retrieval method is executed in a different context where the current user's information is not transferred. You can parameterize the data-retrieval method and pass the **ID** of the user (as *Integer*, *String*) via report parameter e.g. [Using Parameters with the ObjectDataSource Component.](../object-data-source-using-expressions) In the data-retrieval method you can use the passed ID or re-retrieve the users' information.  
  
If you are using the HTML5 Viewer and Reporting REST WebAPI based service, to secure the information transferred in requests, please consider encrypting it and using **HTTPS**. The current context and user will be available in the Reporting REST service's methods. If you need to check and compare the client(viewer)'s information on the server, you can override the [ReportsControllerBase methods](../methods-t-telerik-reporting-services-webapi-reportscontrollerbase) like [**GetParameters**](../m-telerik-reporting-services-webapi-reportscontrollerbase-getparameters) and [**CreateInstance**](../m-telerik-reporting-services-webapi-reportscontrollerbase-createinstance).   

