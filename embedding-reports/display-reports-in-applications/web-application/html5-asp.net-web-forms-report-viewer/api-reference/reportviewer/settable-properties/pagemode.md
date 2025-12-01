---
title: PageMode
page_title: PageMode property
description: "Gets or sets the viewer's page mode. SinglePage - Displays only one report page in PageArea container. ContinuousScroll - Displays large amount of report pages by appending additional pages on demand. <remarks>ContinuousScroll mode enables seamless scrolling through multiple pages with on-demand loading, while SinglePage mode displays one page at a time for focused viewing.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/pagemode
published: True
reportingArea: WebFormsWrapper
---

# PageMode

Gets or sets the viewer's page mode. SinglePage - Displays only one report page in PageArea container. ContinuousScroll - Displays large amount of report pages by appending additional pages on demand. <remarks>ContinuousScroll mode enables seamless scrolling through multiple pages with on-demand loading, while SinglePage mode displays one page at a time for focused viewing.</remarks>

## Type

`Telerik.ReportViewer.Html5.WebForms.PageMode`

## Examples

````JavaScript
<!-- Example demonstrating the use of the PageMode property for the Telerik ReportViewer in WebForms -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PageMode Property Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set PageMode to SinglePage-->
          <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              PageMode="SinglePage">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
