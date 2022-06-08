---
title: How do I set 100% height to the ASP.NET WebForms Report Viewer
description: This article elaborates on how to set full height of the legacy ASP.NET Report Viewer 
type: how-to
page_title: How do I set 100% height to the ASP.NET WebForms Report Viewer
slug: how-to-set-100-percent-height-to-the-asp-net-report-viewer
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>ASP.NET WebForms Report Viewer (legacy)</td>
	</tr>
</table>

## Solution
In order to have the Web ReportViewer display with 100% height, you need to specify height to the whole DOM tree:

```HTML
<html xmlns="http://www.w3.org/1999/xhtml" id="html">
<head runat="server">
  <title>telerik Report Viewer</title>
  <style type="text/css">   
  html#html, body#body, form#form1, div#content
  { 
    height: 100%;
  }
  </style>
</head>
<body id="body">
  <form id="form1" runat="server">              
  <div id="content">
  	<telerik:ReportViewer ID="ReportViewer1" runat="server" height="100%"/>
  </div>
  </form>
</body>
</html>
```

In some cases you would need to remove the default doctype (or use a less restrictive one) in order to get this working (e.g. IE 6).

## See Also
  [ASP.NET Web Forms Report Viewer](../asp-net-report-viewer)
  
  [How to: Add report viewer to a web page](../asp-net-report-viewer-embedding)
