---
title: InteractiveActionExecuting
page_title: InteractiveActionExecuting event
description: "Gets or sets the name of the JavaScript function that will be called when an interactive action is being executed. The interactive action executing event is triggered when user clicks on interactive elements like drill-through links or toggle buttons in the HTML5 viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting
published: True
reportingArea: WebForms
---

# The `InteractiveActionExecuting` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when an interactive action is being executed. The interactive action executing event is triggered when user clicks on interactive elements like drill-through links or toggle buttons in the HTML5 viewer.

## Example

````XML
<!--Example demonstrating how to set the InteractiveActionExecuting property of ClientEvents in the Telerik HTML5 WebForms ReportViewer.
This property specifies the name of the JavaScript function to be called when an interactive action is executed. -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 ReportViewer - InteractiveActionExecuting Example</title>
    <script type="text/javascript">
        // JavaScript function to be called when an interactive action is being executed
        function onInteractiveActionExecuting(e) {
            // e contains information about the action
            alert("Interactive action is executing!");
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
            <ClientEvents InteractiveActionExecuting="onInteractiveActionExecuting" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

