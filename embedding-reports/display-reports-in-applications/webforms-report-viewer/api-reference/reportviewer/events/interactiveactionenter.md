---
title: InteractiveActionEnter
page_title: InteractiveActionEnter event
description: "Gets or sets the name of the JavaScript function that will be called when the mouse cursor enters the area of a report item's action. The interactive action enter event is triggered when the mouse hovers over interactive report elements in the HTML5 viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/interactiveactionenter
published: True
reportingArea: WebForms
---

# The `InteractiveActionEnter` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when the mouse cursor enters the area of a report item's action. The interactive action enter event is triggered when the mouse hovers over interactive report elements in the HTML5 viewer.

## Example

````XML
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script type="text/javascript">
        // Example JavaScript function for InteractiveActionEnter event
        function onActionEnter(sender, args) {
            // Handle action enter
            alert('Interactive action entered!');
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
            <ClientEvents InteractiveActionEnter="onActionEnter" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/overview%})
* [InteractiveActionExecuting]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting%})
* [InteractiveActionLeave]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/interactiveactionleave%})

