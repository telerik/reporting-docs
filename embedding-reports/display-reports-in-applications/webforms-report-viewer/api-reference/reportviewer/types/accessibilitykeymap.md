---
title: Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap
page_title: Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap Type
description: "Provides a class for the key mapping used when report viewer accessibility is enabled."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/accessibilitykeymap
published: True
reportingArea: WebForms
---

# The `AccessibilityKeyMap` type of the HTML5 ASP.NET WebForms Report Viewer

Provides a class for the key mapping used when report viewer accessibility is enabled.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CONFIRM_KEY | `System.Byte` | Key code for executing report actions and applying report parameters |
| CONTENT_AREA_KEY | `System.Byte` | Key code for navigating to report contents area, when pressed together with CTRL + ALT |
| DOCUMENT_MAP_AREA_KEY | `System.Byte` | Key code for navigating to document map area, when pressed together with CTRL + ALT |
| Default | [`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/accessibilitykeymap%}) | Returns an instance, initialized with the default key mapping |
| Equals(System.Object) | `System.Boolean` | Internal use only |
| Equals(Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap) | `System.Boolean` | Internal use only |
| GetHashCode | `System.Int32` | Internal use only |
| MENU_AREA_KEY | `System.Byte` | Key code for navigating to menu area, when pressed together with CTRL + ALT |
| PARAMETERS_AREA_KEY | `System.Byte` | Key code for navigating to parameters area, when pressed together with CTRL + ALT |

## Example

````C#
<!--Example: Using AccessibilityKeyMap with the ReportViewer's EnableAccessibility property-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo - AccessibilityKeyMap Example</title>
</head>
<body>
    <form runat="server">
        <!-- use accessibility key map in ReportViewer -->
        <telerik:ReportViewer 
            ID="reportViewer1"
            ServiceUrl="/api/reports/"
            runat="server">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <AccessibilityKeyMap/>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

## See Also

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
