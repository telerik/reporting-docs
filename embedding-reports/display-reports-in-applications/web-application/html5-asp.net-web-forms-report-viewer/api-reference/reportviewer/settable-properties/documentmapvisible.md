---
title: DocumentMapVisible
page_title: DocumentMapVisible property
description: "Gets or sets a value indicating whether the document map navigation panel is initially visible in the HTML5 viewer. <remarks>Controls the initial visibility state of the document map that provides hierarchical navigation through report bookmarks and sections. The document map is shown only if the report contains bookmarks. The document map works both in the interactive and print preview view modes.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/documentmapvisible
published: True
reportingArea: WebFormsWrapper
---

# DocumentMapVisible

Gets or sets a value indicating whether the document map navigation panel is initially visible in the HTML5 viewer. <remarks>Controls the initial visibility state of the document map that provides hierarchical navigation through report bookmarks and sections. The document map is shown only if the report contains bookmarks. The document map works both in the interactive and print preview view modes.</remarks>

## Type

`System.Boolean`

## Examples

````JavaScript
<!-- Example: Setting the DocumentMapVisible property on the Telerik ReportViewer -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DocumentMapVisible Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set DocumentMapVisible to true -->
   <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              DocumentMapVisible="true">
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
