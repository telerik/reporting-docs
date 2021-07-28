---
title: Failed to map the path '/' exception
description: Failed to map the path '/' exception.
type: how-to
page_title: Failed to map the path '/' exception
slug: failed-to-map-the-path---exception
res_type: kb
---

> **Note**
> <br/>
> This article relates to the [Legacy ASP<span>.</span>NET Report Viewer](../asp-net-report-viewer).

## Description  

When trying to show a report in our web ReportViewer control, Visual Studio throws the following exception:  

```   
InvalidOperationException: Failed to map the path '/' 
``` 
   
## Solution  

The exception is raised by the **WebConfigurationManager** class and if we try the following:  
   
```cs
Configuration cfg =  WebConfigurationManager.OpenWebConfiguration(System.Web.Hosting.HostingEnvironment.ApplicationVirtualPath);   
```   

In the **Page\_Load** method, it would cause the same error, which excludes the possibility of this being an issue with the web viewer. 

The error is a peculiar one, because the code is taken straight from the MSDN documentation and the strangest thing is that if you run your web site/app in **IIS**, it would work as expected.  So after some trial and error, the problem got narrowed down to the built-in VS web server *Cassini* - the problem proved to be not running VS as **Administrator**. *Vista* and *Win 7* show warning messages when Visual Studio is not being run as administrator, however there is a tick to "silence" this warning. This way if Visual Studio is not set to run as administrator by default or is not started as administrator explicitly through the context menu "*Run as Administrator*", there are good chances you'll get the **Failed to map the path '/'.** exception.  
 
