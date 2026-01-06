---
title: InteractiveActionLeave
page_title: InteractiveActionLeave event
description: "Gets or sets the name of the JavaScript function that will be called when the mouse cursor leaves the area of a report item's action. The interactive action leave event is triggered when the mouse cursor moves away from interactive report elements in the HTML5 viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/interactiveactionleave
published: True
reportingArea: WebForms
---

# The `InteractiveActionLeave` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when the mouse cursor leaves the area of a report item's action. The interactive action leave event is triggered when the mouse cursor moves away from interactive report elements in the HTML5 viewer.

## Example

    ````XML
<!--Example demonstrating how to set the InteractiveActionLeave property of ClientEvents in the Telerik HTML5 WebForms ReportViewer. -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 ReportViewer - InteractiveActionExecuting Example</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="/api/reports/resources/js/telerikReportViewer-kendo"></script>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" id="themeCss" />
    <script type="text/javascript">
         // Handler called when mouse leaves the area of a report item's action
    function onInteractiveActionLeave(sender, args) {
        // Your logic here
        console.log("Mouse left interactive action area.");
    }
    </script>
</head>
<body>
    <form runat="server">
        <telerik:ReportViewer 
            ID="reportViewer1"
            ServiceUrl="/api/reports/"
             runat="server">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents InteractiveActionLeave="onInteractiveActionLeave" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


