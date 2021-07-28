---
title: Error in Internet Explorer "Only secure content is displayed"
description: Error in Internet Explorer "Only secure content is displayed".
type: how-to
page_title: Error in Internet Explorer "Only secure content is displayed"
slug: error-in-internet-explorer-only-secure-content-is-displayed
res_type: kb
---

## Description

Error in Internet Explorer: **"Only secure content is displayed"** when you try to load a page with the [HTML5 Viewer](../html5-report-viewer).  
  
## Solution  
   
The HTML5 Viewer is a client-side widget consisting of **Kendo UI** widgets and functionality for communicating with a Telerik Reporting RESt service instance. The Ui and the functionality are added via *JavaScript* and *CSS* files loaded on the same page.  
  
 f you use an **IFRAME element** to load the page with the HTML5 Viewer, and all requests are issued over HTTPS, the error can occur due to a left link that uses **HTTP**.  
  
 The issue can be detected by running the page in Internet Explorer with opened Console ([F12 Developer Tools](https://docs.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/samples/gg589507(v=vs.85)?redirectedfrom=MSDN)). In the error logs you will see a message like the following:  

```
HTTPS security is compromised by http://kendo.cdn.telerik.com/2015.3.930/styles/kendo.common.min.css
```

This will hint you which CSS/JS file is requested over HTTP.  
