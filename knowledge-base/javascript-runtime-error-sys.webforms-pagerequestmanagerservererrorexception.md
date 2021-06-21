---
title: JavaScript runtime error Sys.WebForms.PageRequestManagerServerErrorException - Value cannot be null.
description: JavaScript runtime error - Sys.WebForms.PageRequestManagerServerErrorException - Value cannot be null..
type: troubleshooting
page_title: JavaScript runtime error - Sys WebForms.PageRequestManagerServerErrorException Value cannot be null.
slug: javascript-runtime-error-sys.webforms-pagerequestmanagerservererrorexception
res_type: kb
---

## Relates to the <a href="/asp-net-report-viewer" target="_blank">Legacy Report Viewer</a>

## Description  
**0x800a139e - JavaScript runtime error: Sys.WebForms.PageRequestManagerServerErrorException: Value cannot be null.**  
  
 The above error occurs when testing a Web Application in browser, run from Visual Studio 2013+.  
    
## Solution   
  
 Such error can occur if the Web application is *Ajaxified*. BrowserLink is introduced in Visual Studio 2013. It can intersect AJAX calls, resulting in a JavaScript runtime error. To test the application you can switch off BrowserLink from Visual Studio settings.  
  
 For more details, check <a href="https://www.asp.net/visual-studio/overview/2013/using-browser-link" target="_blank">Using Browser Link in Visual Studio 2013</a> (source www.asp.net).

