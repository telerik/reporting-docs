---
title: How to create HTML5 MVC Report Viewer inside master page layout
description: How to initialize HTML5 MVC Report Viewer with included master layout markup 
type: how-to
page_title: Configuring the HTML5 MVC Report Viewer as partial view of the master view
slug: how-to-create-html5-mvc-report-viewer-inside-master-page-layout
position: 
tags: HTML5MVCReportViewer
ticketid: 1161797
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>MVC</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
</table>


## Description
When using [HTML5 ASP.NET MVC Report Viewer](https://docs.telerik.com/reporting/mvc-report-viewer-extension-overview) to display reports in MVC application, by default its not specified any Layout, so it is set to null.

In general, setting Layout explicitly to null might be necessary if you want to get rid of a standard layout defined in *_Layout.cshtml*. When you make *@{Layout=null}* you are explicitly saying that this your final layout so it is not nested in any master layout.

## Solution
In the scenario of HTML5 MVC Report Viewer, using Layout = null in order to remove the default layout inheritance in that view. This allows including the whole HTML structure of Web page using markup, i.e. styles, scripts, meta information, custom body layout etc.

So, to create a MVC web application which contains the report viewer page inside the master layout, the report viewer template (for example ReportViewer.cshtml) must have only the body part. All meta information, styles and scripts, which are referred between the opening and closing *head* tags, have to be moved in the master Layout file in order to run correctly.

**ReportViewer.cshtml** file should contain only the body part, for example:

```CSharp
@using DemoWebMVCApplication
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc
@{  
 Layout = "~/Views/Shared/_Layout.cshtml";
}

@(Html.TelerikReporting().ReportViewer()
        .Id("reportViewer1")
        .ServiceUrl(Url.Content("~/api/reports"))
        .ReportSource(new UriReportSource() { Uri = "SampleReport.trdp" })
        .ViewMode(ViewMode.Interactive)
        .ScaleMode(ScaleMode.Specific)
        .Scale(1.0)
        .PersistSession(false)
        .PrintMode(PrintMode.AutoSelect)
        .EnableAccessibility(false)
)
```

And the **_Layout.cshtml** file should contain all links and scripts:

```HTML
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>@ViewBag.Title - My ASP.NET Application</title>
    @Styles.Render("~/Content/css")
    @Scripts.Render("~/bundles/modernizr")

    @* Links and scripts from the report viewer *@
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link href="http://kendo.cdn.telerik.com/2015.3.930/styles/kendo.common.min.css" rel="stylesheet" />
    <link href="http://kendo.cdn.telerik.com/2015.3.930/styles/kendo.blueopal.min.css" rel="stylesheet" />
    <style>
        #reportViewer1 {
            position: relative;
            width: 1300px;
            height: 900px;
            font-family: Verdana, Arial;
        }
    </style>
    @* End of the head resources*@
	
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                @Html.ActionLink("Application name", "Index", "Home", new { area = "" }, new { @class = "navbar-brand" })
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li>@Html.ActionLink("Home", "Index", "Home")</li>
                    <li>@Html.ActionLink("About", "About", "Home")</li>
                    <li>@Html.ActionLink("Contact", "Contact", "Home")</li>
                    <li>@Html.ActionLink("Report", "Report", "Home")</li>
                </ul>
                @Html.Partial("_LoginPartial")
            </div>
        </div>
    </div>
    <div class="container body-content">
        @RenderBody()
        <hr />
        <footer>
            <p>&copy; @DateTime.Now.Year - My ASP.NET Application</p>
        </footer>
    </div>

    @Scripts.Render("~/bundles/jquery")
    @Scripts.Render("~/bundles/bootstrap")
    @RenderSection("scripts", required: false)

    @* Scripts from the report view. Note that in order to be fired, they need to be at the end of the body *@
    <script src="@Url.Content("~/ReportViewer/js/telerikReportViewer.kendo-12.0.18.315.min.js")"></script>
    <script src="@Url.Content("~/ReportViewer/js/telerikReportViewer-12.0.18.315.min.js")"></script>
    @*End of the scripts*@
	
</body>
</html>
```
