---
title: Error
page_title: Error event
description: "Gets or sets the name of the JavaScript function that will be called when an error occurs. The error event is triggered when any error occurs during report processing, rendering, or viewer operations in the HTML5 ReportViewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/error
published: True
reportingArea: WebForms
---

# The `Error` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when an error occurs. The error event is triggered when any error occurs during report processing, rendering, or viewer operations in the HTML5 ReportViewer.

## Example

````XML
<!--Example: Using ClientEvents Error with the ReportViewer-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo - ClientEvents Error Example</title>
</head>
<body>
    <form runat="server">
        <telerik:ReportViewer 
            ID="reportViewer1"
            ServiceUrl="/api/reports/"
            runat="server">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents Error="onReportViewerError" />
        </telerik:ReportViewer>
    </form>
</body>
</html>

<script type="text/javascript">
    // Custom error handler for Telerik ReportViewer
    function onReportViewerError(sender, args) {
        alert("A report error occurred: " + args.Message);
    }
</script>
````

