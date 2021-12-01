---
title: How to set the Report Property of the WebReportDesigner Dynamically Through Model
description: Explains how to select the report that will be edited in the web report designer from a view or query it in the URL
type: how-to
page_title: Setting the Report Property Dynamically in the WebReportDesginer in .NET Core MVC
slug: how-to-set-the-report-property-of-the-webreportdesigner-dynamically-through-model
position: 
tags: WebReportDesigner, Report
ticketid: 1543386
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>.NET 5.0 MVC</td>
		</tr>
		<tr>
			<td>Report Designer</td>
			<td>Web Report Designer</td>
		</tr>
	</tbody>
</table>


## Description
This article exaplains how to set the report property of the [Web Report Designer](./web-report-designer) dinamically through a model. By using this approach, you can select the report 
from one view and pass it to the view which contains the Web Report Designer. You can also query the report's name in the URL of the designer.

## Solution
1. Add the **DesignerModel**:

```CSharp
public class DesignerModel
{
    private string reportName;
    public string ReportName { get; set; }

    public DesignerModel(string reportName)
    {
        this.ReportName = reportName;
    }
}
```

2. Add a new controller (for example named **ReportingController**). It contains the action that will bring the user to the view of the designer and with the passed the report's name:

```CSharp
public class ReportingController : Controller
{
    public ActionResult ReportDesigner(string name)
    {
        string reportName = name;
        DesignerModel designer = new DesignerModel(reportName);
        ViewBag.Message = designer;
        return View();
    }
}
```

3. Go to the initial view and add the following piece of code which adds an input for the report's name. The string will be passed to the action of the ReportingController:

```html
<input type="text" id="reportName" value='SampleReport.trdp' />
<input type="button" value="Edit" onclick="location.href='@Url.Action("ReportDesigner", "Reporting")?name=' + $('#reportName').val()" />
```

4. Go to the view of the web report designer and make the following changes:

```JavaScript
@using WebApplication1.Models;

@{

    ViewBag.Title = "Telerik Web Report Designer";
    var designer = ViewBag.Message;
}
. . .
@section scripts {
. . . 
    <script type="text/javascript">
        $(document).ready(function () {
            $("#webReportDesigner").telerik_WebReportDesigner({
                toolboxArea: {
                    layout: "list" //Change to "grid" to display the contents of the Components area in a flow grid layout.
                },
                serviceUrl: "/api/reportdesigner",
                report: "@designer.ReportName",
            }).data("telerik_WebDesigner");
        });
    </script>
}
```

## Notes
The sample project can be found in our GitHub repository.

## See Also
[Web Report Designer](./web-report-designer)
[How to set up in .NET 5 and .NET Core 3.1 applications](./web-report-designer-setup-in-net-core3)
