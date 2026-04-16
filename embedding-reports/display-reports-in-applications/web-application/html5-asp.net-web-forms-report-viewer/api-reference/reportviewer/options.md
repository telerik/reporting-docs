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

Gets or sets the keyboard mappings used when accessibility mode is enabled in the HTML5 viewer.

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

Gets or sets the encoded authentication token used to secure and authenticate requests between the HTML5 viewer and the reporting service.

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

Gets or sets the CSS class applied to toolbar buttons when they are in the checked or active state.

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

Gets or sets a value indicating whether the HTML5 viewer's JavaScript initialization is deferred until a specific point in the page lifecycle.

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

Gets or sets the CSS class applied to toolbar buttons when they are in the disabled state.

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

Gets or sets the positioning of the document map area within the HTML5 viewer interface.

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

Gets or sets a value indicating whether the document map navigation panel is initially visible in the HTML5 viewer.

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

Gets or sets a value indicating whether accessibility features are enabled for the HTML5 report viewer and its contents.

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

Gets or sets the background image URL displayed in the page area when parameter values are missing or invalid.

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

Gets or sets a value indicating whether the HTML5 viewer client session is kept alive through periodic server requests.

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

Gets or sets the current page number of the report displayed in the HTML5 viewer.

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

Gets or sets the parameter editors configuration that defines JavaScript functions for handling different parameter types in the HTML5 viewer.

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

Gets or sets the parameters display configuration that defines the visual appearance and behavior of parameter input controls.

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

Gets or sets the positioning of the parameters area within the HTML5 viewer interface.

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

Gets or sets a value indicating whether the parameters area is initially visible in the HTML5 viewer.

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

Gets or sets a value indicating whether the HTML5 viewer's client state is persisted between page refreshes and postbacks.

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

Gets or sets the connection data of the report server that hosts the report. The report server can have its Guest account enabled and with configured permissions for accessing the report without permisions.

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

Gets or sets the [`Telerik.ReportViewer.Html5.WebForms.ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#reportsource) for the report displayed in the HTML5 viewer.

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

Gets or sets the zoom level of the report where 1.0 equals 100% of the original report size.

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

Gets or sets a value indicating whether search metadata is delivered on-demand or preloaded with the report in the HTML5 viewer.

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

Gets or sets the email functionality configuration including enabled state, format selection, and default recipients.

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

Gets or sets the URL of the service which will provide the report viewer with reports.

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

Gets or sets the URL for the report viewer template. The template can be edited - new functionalities can be added and not needed ones can be removed. For more information please check https://www.telerik.com/help/reporting/html5-report-viewer-templates.html.

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

