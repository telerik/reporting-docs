---
title: JavaScript runtime error - Object doesn't support property or method 'telerik_ReportViewer'
description: JavaScript runtime - error Object doesn't support property or method 'telerik_ReportViewer'.
type: how-to
page_title: JavaScript runtime error - Object doesn't support property or method 'telerik_ReportViewer'
slug: javascript-runtime-error-object-doesnt-support-property-or-method-telerik_reportviewer
res_type: kb
---

## Problem 
**0x800a01b6 - JavaScript runtime error: Object doesn't support property or method 'telerik\_ReportViewer'.**  
  
 The above error message appear in the browser's console when running a web application with the HTML5 Report Viewer.  
  
## Solution

 The [HTML5 Report Viewer](../html5-report-viewer) is an HTML\CSS\JS client-side widget. The viewer requires a link to **jQuery v1.9.1. or above**, which may be in contradiction with other components loading jQuery on their own.  
  
 Verify the page loads jQuery of version 1.9.1 or above only once.  
  
 Also if you use [Telerik UI for ASP.NET AJAX RadScriptManager](../../devtools/aspnet-ajax/controls/scriptmanager/overview), it loads its embedded version of jQuery. You can use the external link to other jQuery file by setting the EnableEmbeddedjQuery property of RadScriptManager to false.  
 For more details, check [Disabling the Embedded jQuery](../../devtools/aspnet-ajax/controls/scriptmanager/disabling-the-embedded-jquery).

