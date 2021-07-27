---
title: This document already has a 'DocumentElement' node exception
description: This document already has a 'DocumentElement' node exception.
type: how-to
page_title: This document already has a 'DocumentElement' node exception
slug: this-document-already-has-a-documentelement-node-exception
res_type: kb
---

> **Note**
> <br/>
> This article relates to the [Legacy ASP<span>.</span>NET Report Viewer](../asp-net-report-viewer).

## Description

When adding a ReportViewer control to an **.aspx** page, Visual Studio throws the following exception:

``` 
The ReportViewer control failed to setup the http handler in the web.config file. 
You may experience troubles when viewing the report.   

Exception details:  This document already has a 'DocumentElement' node.
```
 
## Solution

This happens when a default namespace is added to the root **&lt;configuration&gt;** element of the **web.config** file. 

For example: 

 ```xml
<configuration xmlns="http://schemas.microsoft.com/.NetConfiguration/v2.0">
 ```

This doesn’t cause any runtime problems, but in case you try to alter the web.config like we do, it would throw the exception above.

To avoid the error just delete the **xmlns** reference and have the root configuration element look like the following: 

```xml
<configuration> 
```
Also, restart Visual Studio. Once you start it back up, we would successfully alter the web.config adding our http handlers for the ReportViewer with no errors.  

> **Note**
> <br/>
> Another "side-effect" of having default namespace is missing **intellisense** for the web.config file. More info on that is available in [this blog post](http://weblogs.asp.net/scottgu/archive/2005/12/02/432077.aspx).  
   
   
 

