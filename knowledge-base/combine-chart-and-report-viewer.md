---
title: Integration between Chart (HTML5) and HTML5 Web Forms Report Viewer
description: Combine RadHtmlChart for ASP.NET AJAX and HTML5 Web Forms Report Viewer in one web page
type: how-to
page_title: How to Integrate Chart (HTML5) and HTML5 Web Forms Report Viewer
slug: combine-chart-and-report-viewer
position: 
tags: 
ticketid: 1444203
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>RadHtmlChart for ASP.NET AJAX</td>
		</tr>
	</tbody>
</table>


## Description
This article demonstrates how to combine the [Chart (HTML5)](https://www.telerik.com/products/aspnet-ajax/html-chart.aspx) component 
from Telerik UI for ASP.NET AJAX and the [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}) in one page.

## Solution
1. Load all Kendo scripts on the page and disable the those embedded in the AJAX DLLs:

```
<head runat="server">
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2019.3.1023/styles/kendo.default-v2.min.css" />
    <script src="https://kendo.cdn.telerik.com/2019.3.1023/js/jquery.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2019.3.1023/js/kendo.all.min.js"></script>
    ...
</head>
```

```
<telerik:RadScriptManager ID="RadScriptManager1" runat="server" EnableEmbeddedjQuery="false">
    <Scripts>
        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryExternal.js" />
        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryPlugins.js" />
    </Scripts>
</telerik:RadScriptManager>
```

2. Add the Chart(HTML5):

```
<telerik:RadHtmlChart ID="RadHtmlChart1" runat="server">
    <PlotArea>
        <Series>
            <telerik:ColumnSeries DataFieldY="valueField"></telerik:ColumnSeries>
        </Series>
        <XAxis DataLabelsField="labelsField"></XAxis>
    </PlotArea>
</telerik:RadHtmlChart>
```

3. Add the Telerik Report Viewer:

```
<telerik:ReportViewer
    ID="reportViewer1"
    Width="1300px"
    Height="900px"
    EnableAccessibility="false"
    runat="server">
    <ReportSource IdentifierType="UriReportSource" Identifier="SampleReport.trdp"
    </ReportSource>
    <%-- If set to true shows the Send Mail Message toolbar button --%>
    <SendEmail Enabled="false" />
</telerik:ReportViewer>
```

## Sample
Check the full sample in our [Git Hub repository](https://github.com/telerik/reporting-samples/tree/master/HtmlChartAndReporting).
