---
title: Events
page_title: Events of the HTML5 ASP.NET WebForms Report Viewer
description: Complete list of events available in the HTML5 ASP.NET WebForms Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events
tags: events
published: True
reportingArea: WebForms
position: 4
---

# Events of the HTML5 ASP.NET WebForms Report Viewer

## Error

Gets or sets the name of the JavaScript function that will be called when an error occurs. The error event is triggered when any error occurs during report processing, rendering, or viewer operations in the HTML5 ReportViewer.

### Example

````C#
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


## ExportBegin

Gets or sets the name of the JavaScript function that will be called prior to starting the report export command. The export begin event is triggered before the HTML5 ReportViewer starts generating the export document.

### Example

````C#
<!-- Example: Setting the ExportBegin client event in the ReportViewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script type="text/javascript">
        // JavaScript function to handle ExportBegin event
        function onExportBegin(sender, args) {
            // Add custom logic before export starts
            alert("Export is about to begin.");
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
            <ClientEvents ExportBegin="onExportBegin" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ExportEnd

Gets or sets the name of the JavaScript function that will be called when the exported document is ready for download, but prior to the actual downloading. The export end event is triggered when the export document is ready but before the download starts.

### Example

````C#
<!-- Example: Setting the ExportEnd client event in the ReportViewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
   <script type="text/javascript">
    // This function will be called when the export is ready for download
    function onExportEnd(e) {
        // Custom logic here
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
            <ClientEvents ExportEnd="onExportEnd" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## InteractiveActionEnter

Gets or sets the name of the JavaScript function that will be called when the mouse cursor enters the area of a report item's action. The interactive action enter event is triggered when the mouse hovers over interactive report elements in the HTML5 viewer.

### Example

````C#
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


## InteractiveActionExecuting

Gets or sets the name of the JavaScript function that will be called when an interactive action is being executed. The interactive action executing event is triggered when user clicks on interactive elements like drill-through links or toggle buttons in the HTML5 viewer.

### Example

````C#
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


## InteractiveActionLeave

Gets or sets the name of the JavaScript function that will be called when the mouse cursor leaves the area of a report item's action. The interactive action leave event is triggered when the mouse cursor moves away from interactive report elements in the HTML5 viewer.

### Example

````C#
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


## PageReady

Gets or sets the name of the JavaScript function that will be called every time a page from the report is rendered and ready for display. The page ready event is triggered when each individual report page completes rendering and is ready for display in the HTML5 viewer.

### Example

````C#
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script type="text/javascript">
        // This JavaScript function will be called every time a page is rendered and ready for display
        function onReportPageReady(sender, args) {
            // Custom logic can be added here
            // e.g. alert('A report page is ready!');
        }
    </script>
</head>
<body>
    <form runat="server">
        <!-- Example of setting the PageReady client event property -->
        <telerik:ReportViewer 
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents PageReady="onReportPageReady" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## PrintBegin

Gets or sets the name of the JavaScript function that will be called prior to starting the print report command. The print begin event is triggered before the HTML5 ReportViewer starts generating the print document.

### Example

````C#
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
  <script type="text/javascript">
    // JavaScript function to be called before print command begins
    function onPrintBegin(e) {
        // Custom logic before print starts
        alert("Printing will begin.");
    }
</script>
</head>
<body>
    <form runat="server">
        <!-- Example of setting the PrintBegin client event property -->
        <telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents PrintBegin="onPrintBegin" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## PrintEnd

Gets or sets the name of the JavaScript function that will be called when the print document (Adobe PDF) is ready for download, but prior to being sent to the printer. The print end event is triggered when the PDF print document is ready but before actual printing occurs.

### Example

````C#
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
<script type="text/javascript">
    // This function will be called when the print document is ready for download
    function onPrintEnd(e) {
        // Add custom logic here, e.g. show a message to the user
        alert("Your PDF report is ready for download!");
    }
</script>
</head>
<body>
    <form runat="server">
        <!-- Example of setting the PrintBegin client event property -->
        <telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents PrintBegin="onPrintBegin" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## Ready

Gets or sets the name of the JavaScript function that will be called when the report viewer template is loaded. The ready event is triggered when the HTML5 ReportViewer template and UI components are fully loaded and initialized.

### Example

````C#
<!-- Example demonstrating how to set the ClientEvents.Ready property to specify a JavaScript function -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script type="text/javascript">
        function onReportViewerReady(e) {
            // This function will be called when the ReportViewer template is loaded
            alert("Report Viewer is ready!");
        }
    </script>
</head>
<body>
 <form runat="server">
        <telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents Ready="onReportViewerReady" />
        </telerik:ReportViewer>
 </form>
</body>
</html>
````


## RenderingBegin

Gets or sets the name of the JavaScript function that will be called when the rendering of the report begins. The rendering begin event is triggered when the HTML5 ReportViewer starts processing and rendering the report content.

### Example

````C#
// Example demonstrating the usage of Telerik.ReportViewer.Html5.WebForms.ClientEvents.RenderingBegin property
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSharp.NetFramework.WebFormsIntegrationDemo.Default" %>

<%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RenderingBegin Event Demo</title>
    <script type="text/javascript">
        // JavaScript function to be called when report rendering begins
        function onRenderingBegin(e) {
            console.log("Rendering of the report has begun.");
        }
    </script>
</head>
<body>
    <form runat="server">
        <!-- Minimal ReportViewer with ClientEvents.RenderingBegin set -->
        <telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents RenderingBegin="onRenderingBegin" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## RenderingEnd

Gets or sets the name of the JavaScript function that will be called when the rendering of the report ends. The rendering end event is triggered when the HTML5 ReportViewer completes processing and rendering the report content.

### Example

````C#
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RenderingEnd Event Example</title>
    <script type="text/javascript">
        // This function will be called when the report rendering ends
        function onRenderingEnd(e) {
            alert('Report rendering completed.');
        }
    </script>
</head>
<body>
    <form runat="server">
        <!-- Example of using ClientEvents.RenderingEnd property -->
        <telerik:ReportViewer 
            ID="reportViewer1" 
            runat="server" 
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents RenderingEnd="onRenderingEnd" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## UpdateUi

Gets or sets the name of the JavaScript function that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with reports. The UI update event is triggered whenever the HTML5 ReportViewer interface needs to refresh during user interactions.

### Example

````C#
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


## ViewerToolTipOpening

Gets or sets the name of the JavaScript function that will be called when a tooltip is being opened. The tooltip opening event is triggered when tooltips are about to be displayed for report elements or viewer controls in the HTML5 viewer.

### Example

````C#
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script type="text/javascript">
        // Example JS function for ViewerToolTipOpening client event
        function onViewerToolTipOpening(e, args) {
            // Custom tooltip opening logic
            alert("Tooltip is opening!");
        }
    </script>
</head>
<body>
    <form runat="server">
        <!-- Example: Set ViewerToolTipOpening to a JS function name -->
<telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents ViewerToolTipOpening="onViewerToolTipOpening" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

