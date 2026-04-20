---
title: Options
page_title: Options of the HTML5 ASP.NET WebForms Report Viewer
description: Complete list of options available in the HTML5 ASP.NET WebForms Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options
tags: options
published: True
reportingArea: WebForms
position: 2
---

# Options of the HTML5 ASP.NET WebForms Report Viewer

## AccessibilityKeyMap

Gets or sets the keyboard mappings used when accessibility mode is enabled in the HTML5 viewer. Defines custom key combinations for accessibility navigation including content area, document map, menu, and parameters area access when accessibility features are enabled.

### Type

[`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap)

### Example

````C#
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


## AuthenticationToken

Gets or sets the encoded authentication token used to secure and authenticate requests between the HTML5 viewer and the reporting service. Provides security for report access and ensures that only authorized users can view reports through the HTML5 viewer interface.

### Type

`System.String`

### Example

````C#
<!-- Example of setting the report viewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Report Viewer AuthenticationToken Example</title>
</head>
<body>
    <form runat="server">
       <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              AuthenticationToken="your_encoded_authentication_token_here">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## CheckedButtonClass

Gets or sets the CSS class applied to toolbar buttons when they are in the checked or active state. Enables custom styling of checked buttons in the HTML5 viewer toolbar for consistent visual design and user experience.

### Type

`System.String`

### Example

````C#
<!-- Example of setting the report viewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Report Viewer CheckedButtonClass Example</title>
</head>
<body>
    <form runat="server">
       <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              CheckedButtonClass="my-checked-btn-class">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## Deferred

Gets or sets a value indicating whether the HTML5 viewer's JavaScript initialization is deferred until a specific point in the page lifecycle. When enabled, allows for more controlled initialization timing of the HTML5 viewer, which can be useful for complex page scenarios or custom loading sequences.

### Type

`System.Boolean`

### Example

````C#
<!-- Example demonstrating the use of the Deferred property of the Telerik HTML5 WebForms ReportViewer.
This property controls whether the viewer's JavaScript initialization is deferred. -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Deferred Initialization Example</title>
</head>
<body>
    <form runat="server">
     <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              Deferred="false">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## DisabledButtonClass

Gets or sets the CSS class applied to toolbar buttons when they are in the disabled state. Enables custom styling of disabled buttons in the HTML5 viewer toolbar for consistent visual design and user experience.

### Type

`System.String`

### Example

````C#
<!-- Example: Set the DisabledButtonClass property to apply a custom CSS class for disabled toolbar buttons in the ReportViewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo - DisabledButtonClass Property</title>
    <style>
        /* Example custom class for disabled buttons */
        .my-disabled-class {
            opacity: 0.5;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <form runat="server">
        <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              DisabledButtonClass="my-disabled-class">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## DocumentMapAreaPosition

Gets or sets the positioning of the document map area within the HTML5 viewer interface. Controls the placement of the document map navigation panel relative to the report content area for optimal user experience and interface layout in HTML5 scenarios.

### Type

[`Telerik.ReportViewer.Html5.WebForms.DocumentMapAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#documentmapareaposition)

### Example

````C#
<!-- Example: Setting the DocumentMapAreaPosition property on the Telerik HTML5 ReportViewer -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DocumentMapAreaPosition Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set DocumentMapAreaPosition to Left -->
    <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              DocumentMapAreaPosition="Left">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## DocumentMapVisible

Gets or sets a value indicating whether the document map navigation panel is initially visible in the HTML5 viewer. Controls the initial visibility state of the document map that provides hierarchical navigation through report bookmarks and sections. The document map is shown only if the report contains bookmarks. The document map works both in the interactive and print preview view modes.

### Type

`System.Boolean`

### Example

````C#
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


## EnableAccessibility

Gets or sets a value indicating whether accessibility features are enabled for the HTML5 report viewer and its contents. When enabled, provides enhanced accessibility support including keyboard navigation, screen reader compatibility, and ARIA attributes for improved usability with assistive technologies.

### Type

`System.Boolean`

### Example

````C#
<!-- Example: Set EnableAccessibility property to true for the Report Viewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EnableAccessibility Example</title>
</head>
<body>
    <form runat="server">
        <!-- Sets EnableAccessibility to true -->
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              EnableAccessibility="true">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## Height

Gets or sets the height of the HTML5 ReportViewer control.

### Type

`System.Web.UI.WebControls.Unit`

### Example

````C#
<!-- Example: Set the Height property of the Telerik HTML5 ReportViewer control in a WebForms page -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set ReportViewer Height Property Example</title>
</head>
<body>
    <form runat="server">
    <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              Height="600px">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## InitialPageAreaImageUrl

Gets or sets the background image URL displayed in the page area when parameter values are missing or invalid. Provides visual feedback to users when the HTML5 viewer cannot display report content due to missing or invalid parameter values.

### Type

`System.String`

### Example

````C#
<!-- Example demonstrating the use of InitialPageAreaImageUrl property in Telerik ReportViewer -->


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
</head>
<body>
    <form runat="server">
        <!-- Set InitialPageAreaImageUrl to display a custom image when parameter values are missing or invalid -->
       <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
               InitialPageAreaImageUrl="~/images/no-params-image.png">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## KeepClientAlive

Gets or sets a value indicating whether the HTML5 viewer client session is kept alive through periodic server requests. When enabled, prevents client session expiration by sending keep-alive requests to the server based on the ClientSessionTimeout configuration. When disabled, the client session may expire naturally.

### Type

`System.Boolean`

### Example

````C#
<!-- Example demonstrating the use of the KeepClientAlive property for the Telerik HTML5 ReportViewer in WebForms -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KeepClientAlive Property Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set KeepClientAlive to true to keep HTML5 viewer client session alive -->
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              KeepClientAlive="true">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## PageMode

Gets or sets the viewer's page mode.

- SinglePage - Displays only one report page in PageArea container.
- ContinuousScroll - Displays large amount of report pages by appending additional pages on demand.
- ContinuousScroll mode enables seamless scrolling through multiple pages with on-demand loading, while SinglePage mode displays one page at a time for focused viewing.

### Type

[`Telerik.ReportViewer.Html5.WebForms.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#pagemode)

### Example

````C#
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


## PageNumber

Gets or sets the current page number of the report displayed in the HTML5 viewer. Determines which page is initially displayed when the report loads in the HTML5 viewer interface.

### Type

`System.Int32`

### Example

````C#
<!-- Example: Setting the PageNumber property of the Telerik HTML5 ReportViewer in Web Forms -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer PageNumber Property Example</title>
</head>
<body>
    <form runat="server">
        <%-- Set initial page number to 2 --%>
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              PageNumber="1">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ParameterEditors

Gets or sets the parameter editors configuration that defines JavaScript functions for handling different parameter types in the HTML5 viewer. Enables customization of parameter input controls by specifying JavaScript editor functions for different parameter scenarios including single-select, multi-select, and type-specific editors.

### Type

[`Telerik.ReportViewer.Html5.WebForms.ParameterEditors`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parametereditors)

### Example

````C#
<!-- Example: Setting the ParameterEditors property of the ReportViewer in WebForms -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report Viewer ParameterEditors Demo</title>
</head>
<body>
    <form runat="server">
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
            <ParameterEditors></ParameterEditors>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## Parameters

Gets or sets the parameters display configuration that defines the visual appearance and behavior of parameter input controls. Controls the parameter editor types and visual presentation styles for both single-select and multi-select parameter scenarios in the HTML5 viewer interface.

### Type

[`Telerik.ReportViewer.Html5.WebForms.Parameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parameters)

### Example

````C#
<!-- Example demonstrating usage of the ReportViewer.Parameters property -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer Parameters Property Example</title>
</head>
<body>
    <form runat="server">
        <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
            <Parameters />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ParametersAreaPosition

Gets or sets the positioning of the parameters area within the HTML5 viewer interface. Controls the placement of parameter input controls relative to the report content area for optimal user experience and interface layout in HTML5 scenarios.

### Type

[`Telerik.ReportViewer.Html5.WebForms.ParametersAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#parametersareaposition)

### Example

````C#
<!-- Example: Set the ParametersAreaPosition property of the ReportViewer in WebForms -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer - ParametersAreaPosition Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set ParametersAreaPosition to Top, positioning the parameters area above the report viewer -->
    <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              ParametersAreaPosition="Top">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ParametersAreaVisible

Gets or sets a value indicating whether the parameters area is initially visible in the HTML5 viewer. Controls the initial visibility state of the parameters input area for reports that contain parameters requiring user input.

### Type

`System.Boolean`

### Example

````C#
<!-- Example: Set the ParametersAreaVisible property of the ReportViewer in WebForms -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer - ParametersAreaVisible Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set ParametersAreaVisible to true, making the parameters area visible above the report viewer -->
     <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              ParametersAreaVisible="true">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## PersistSession

Gets or sets a value indicating whether the HTML5 viewer's client state is persisted between page refreshes and postbacks. When enabled, the viewer state is stored in the browser's sessionStorage and maintained for the duration of the page session, preserving user settings and navigation state.

### Type

`System.Boolean`

### Example

````C#
<!-- Example demonstrating the use of the PersistSession property on Telerik.ReportViewer.Html5.WebForms.ReportViewer. When set to true, the viewer's client state is persisted between page refreshes and postbacks. -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer - PersistSession Example</title>
</head>
<body>
    <form runat="server">
        <!-- The PersistSession property enables persistence of viewer's client state across postbacks -->
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              PersistSession="true">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## PrintMode

Gets or sets the print mode of the viewer.

- Three modes exist currently:
- AutoSelect - Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file.
- ForcePDFPlugin - Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings.
- ForcePDFFile - Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled.
- Controls the printing workflow to ensure optimal print experience across different browsers and PDF plugin configurations in HTML5 environments.
- Available modes include AutoSelect for intelligent method selection, ForcePDFPlugin for direct plugin usage, and ForcePDFFile for download-based printing.

### Type

[`Telerik.ReportViewer.Html5.WebForms.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#printmode)

### Example

````C#
<!-- Example: Setting the PrintMode property of the Telerik HTML5 ReportViewer to ForcePDFFile -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer PrintMode Example</title>
</head>
<body>
    <form runat="server">
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              PrintMode="ForcePDFFile">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ReportServer

Gets or sets the connection data of the report server that hosts the report. The report server can have its Guest account enabled and with configured permissions for accessing the report without permisions. Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property) The Report Server must have appropriate user accounts configured with necessary permissions for accessing and viewing reports in the HTML5 viewer environment. Connecting to Telerik Report Server for .NET is not supported. For more information see https://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html.

### Type

[`Telerik.ReportViewer.Html5.Common.ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#reportserver)

### Example

````C#
<%-- Example: Setting the ReportServer property for Telerik HTML5 Web Forms Report Viewer --%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer - ReportServer Property Example</title>
</head>
<body>
    <form runat="server">
        <telerik:ReportViewer ID="reportViewer1" runat="server" ServiceUrl="/api/reports">
            <ReportServer Password="" Url="" Username="" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ReportSource

Gets or sets the [`Telerik.ReportViewer.Html5.WebForms.ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#reportsource) for the report displayed in the HTML5 viewer. Specifies the report to be displayed including its identifier, parameters, and source type for proper report loading and processing in the HTML5 environment.

### Type

[`Telerik.ReportViewer.Html5.WebForms.ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#reportsource)

### Example

````C#
<!-- Example: Setting the ReportSource property of the Telerik ReportViewer to ForcePDFFile -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer ReportSource Example</title>
</head>
<body>
    <form runat="server">
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## Scale

Gets or sets the zoom level of the report where 1.0 equals 100% of the original report size. Provides precise control over report magnification in the HTML5 viewer when using specific scaling mode or custom zoom requirements.

### Type

`System.Double`

### Example

````C#
<!-- Example: Setting the Scale property of the Telerik ReportViewer to 1.0 -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer Scale Example</title>
</head>
<body>
    <form runat="server">
   <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              Scale="1.0">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ScaleMode

Gets or sets the scale mode of the viewer.

- Three modes exist currently:
- FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.
- FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.
- Specific - Uses the scale to zoom in and out the report.
- Controls automatic report scaling behavior including FitPage for complete page visibility, FitPageWidth for width-based scaling, and Specific for custom scale values.

### Type

[`Telerik.ReportViewer.Html5.WebForms.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#scalemode)

### Example

````C#
<!-- Example demonstrating how to set the ScaleMode property of Telerik.ReportViewer.Html5.WebForms.ReportViewer -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set ScaleMode Example</title>
    <script src="/api/reports/resources/js/telerikReportViewer-kendo"></script>
</head>
<body>
    <form runat="server">
        <!-- Set ScaleMode of the ReportViewer to FitPageWidth -->
      <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              ScaleMode="FitPageWidth">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## SearchMetadataOnDemand

Gets or sets a value indicating whether search metadata is delivered on-demand or preloaded with the report in the HTML5 viewer. When enabled, search metadata is loaded only when needed, reducing initial load time but potentially increasing search operation latency. When disabled, search metadata is preloaded for faster search operations.

### Type

`System.Boolean`

### Example

````C#
<!-- Example: Set the SearchMetadataOnDemand property to enable on-demand search metadata delivery in the HTML5 WebForms ReportViewer. -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SearchMetadataOnDemand Example</title>
</head>
<body>
    <form runat="server">
 <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              SearchMetadataOnDemand="true">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## SendEmail

Gets or sets the email functionality configuration including enabled state, format selection, and default recipients. Configures the send email feature within the HTML5 viewer toolbar, including preselected rendering formats and default email addresses for enhanced user experience.

### Type

[`Telerik.ReportViewer.Html5.WebForms.SendEmail`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#sendemail)

### Example

````C#
<!-- Example: Set the SendEmail property to enable the Send Email functionality in the HTML5 WebForms ReportViewer. -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SendEmail Example</title>
</head>
<body>
    <form runat="server">
 <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
             <SendEmail  />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ServiceUrl

Gets or sets the URL of the service which will provide the report viewer with reports. The service must be properly configured so that the report viewer can successfully communicate with the server. For more information on how to configure the service please check https://docs.telerik.com/reporting/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/overview.

### Type

`System.String`

### Example

````C#
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Set ServiceUrl Example</title>
</head>
<body>
    <form runat="server">
        <telerik:ReportViewer 
            ID="reportViewer1" 
            runat="server"
            ServiceUrl="/api/reports">
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## TemplateUrl

Gets or sets the URL for the report viewer template. The template can be edited - new functionalities can be added and not needed ones can be removed. For more information please check https://www.telerik.com/help/reporting/html5-report-viewer-templates.html. Enables customization of the HTML5 viewer interface by specifying a custom template URL. If left empty, the default template is used for standard viewer functionality.

### Type

`System.String`

### Example

````C#
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSharp.NetFramework.WebFormsIntegrationDemo.Default" %>

<%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>

<!-- Example: Set the TemplateUrl property to specify a custom template for the ReportViewer -->
<form runat="server">
    <telerik:ReportViewer
        ID="reportViewer1"
        runat="server"
        ServiceUrl="/api/reports/"
        TemplateUrl="/CustomTemplates/CustomReportViewerTemplate.html">
    </telerik:ReportViewer>
</form>
````


## ViewMode

Gets or sets the viewer's view mode.

- PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is not enabled.
- Interactive - Displays the report in its original width and height with no paging. Additionally interactivity is enabled.
- Interactive mode enables full report interactivity and navigation, while PrintPreview mode optimizes the display for print layout without interactive features.

### Type

[`Telerik.ReportViewer.Html5.WebForms.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#viewmode)

### Example

````C#
<!-- Example: Set the ViewMode property to PrintPreview to display the paginated report as if printed on paper -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportViewer ViewMode Example</title>
</head>
<body>
    <form runat="server">
     <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              ViewMode="PrintPreview">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## Width

Gets or sets the width of the HTML5 ReportViewer control.

### Type

`System.Web.UI.WebControls.Unit`

### Example

````C#
<!-- Example: Setting the Width property of the ReportViewer control -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo - Width Example</title>
</head>
<body>
    <form runat="server">
        <!-- Set the Width property to 800px -->
         <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports"
              Width="800px">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

