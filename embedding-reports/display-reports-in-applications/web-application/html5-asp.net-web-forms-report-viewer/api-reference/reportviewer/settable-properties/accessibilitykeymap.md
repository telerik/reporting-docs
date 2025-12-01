---
title: AccessibilityKeyMap
page_title: AccessibilityKeyMap property
description: "Gets or sets the keyboard mappings used when accessibility mode is enabled in the HTML5 viewer. <remarks>Defines custom key combinations for accessibility navigation including content area, document map, menu, and parameters area access when accessibility features are enabled.</remarks>"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/settable-properties/accessibilitykeymap
published: True
reportingArea: WebFormsWrapper
---

# AccessibilityKeyMap

Gets or sets the keyboard mappings used when accessibility mode is enabled in the HTML5 viewer. <remarks>Defines custom key combinations for accessibility navigation including content area, document map, menu, and parameters area access when accessibility features are enabled.</remarks>

## Type

`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`

## Examples

````JavaScript
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demonstrate setting the AccessibilityKeyMap for the ReportViewer</title>
</head>
<body>
    <form runat="server">
           <!-- Demonstrate setting the AccessibilityKeyMap for the ReportViewer -->
        <telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <AccessibilityKeyMap/>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
