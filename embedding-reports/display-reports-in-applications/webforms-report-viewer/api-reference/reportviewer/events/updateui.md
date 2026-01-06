---
title: UpdateUi
page_title: UpdateUi event
description: "Gets or sets the name of the JavaScript function that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with reports. The UI update event is triggered whenever the HTML5 ReportViewer interface needs to refresh during user interactions."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/updateui
published: True
reportingArea: WebForms
---

# The `UpdateUi` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with reports. The UI update event is triggered whenever the HTML5 ReportViewer interface needs to refresh during user interactions.

## Example

````XML
<!-- Example demonstrating the use of the UpdateUi property in <telerik:ReportViewer>
The UpdateUi property specifies the JavaScript function to call on UI updates. -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Viewer UpdateUi Example</title>
    <script type="text/javascript">
        // Custom function to handle UI update events for the report viewer
        function onReportViewerUpdateUi(args) {
            // Logic to update UI can be placed here
            console.log('Report Viewer UI updated', args);
        }
    </script>
</head>
<body>
    <form runat="server">
        <!-- Set the UpdateUi client event property -->
<telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents UpdateUi="onReportViewerUpdateUi" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````



