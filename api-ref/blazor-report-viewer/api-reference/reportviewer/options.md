---
title: Options
page_title: Options of the Blazor Report Viewer
description: Complete list of options available in the Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options
tags: options
published: True
reportingArea: BlazorWrapper
position: 2
---

# Options of the Blazor Report Viewer

## AccessibilityKeyMap

Gets or sets the key shortcuts map, used when the report viewer is in accessible mode.

### Type

[`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap)

### Example

````C#
<ReportViewer AccessibilityKeyMap="@(new AccessibilityKeyMap())" />
````


## AuthenticationToken

Gets or sets the encoded authentication token used to authenticate the requests.

### Type

`System.String`

### Example

````C#
<ReportViewer AuthenticationToken="your-token-here" />
````


## CheckedButtonClass

Gets or sets the class to be used by buttons in the checked state.

### Type

`System.String`

### Example

````C#
<ReportViewer CheckedButtonClass="btn-checked" />
````


## ClientEvents

Gets or sets the viewer's event handler function names as strings. The function name should be fully qualified, e.g. "window.trvEventHandlers.exportBegin", or just "trvEventHandlers.exportBegin" ("window" qualifier is optional). The event handler functions should be implemented inside wwwroot/index.html (Blazor WebAssembly) or Pages/_Host.cshtml (Blazor Server). The JavaScript API of the event handlers is available in  https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-ready.

### Type

[`Telerik.ReportViewer.Blazor.ClientEventsOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#clienteventsoptions)

### Example

````C#
<ReportViewer ClientEvents="@(new ClientEventsOptions
              {
                  Ready = "onReady",
                  Error = "onError"
              })" />

<script>
    function onReady() {
        console.log("Ready");
    }
    function onError(e, args) {
        console.log("Error:", e);
        console.log(args);
    }
</script>
````


## Commands

Gets the available report viewer commands.

### Type

[`Telerik.ReportViewer.Blazor.CommandOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#commandoptions)

### Example

````C#
<ReportViewer @ref="reportViewer"/>
<button @onclick="ExportToPdf">Export to PDF</button>
<button @onclick="GoToPageThree">Go to Page 3</button>
<button @onclick="ExecutePrint">Print</button>

@code {
    ReportViewer reportViewer;
    async void ExportToPdf()
    {
        await reportViewer.Commands.Export.ExecuteAsync("PDF");
    }
    async void GoToPageThree()
    {
        await reportViewer.Commands.GoToPage.ExecuteAsync(3);
    }
    async void ExecutePrint()
    {
        await reportViewer.Commands.Print.ExecuteAsync();
    }
}
````


## DisabledButtonClass

Gets or sets the class to be used by buttons in the disabled state.

### Type

`System.String`

### Example

````C#
<ReportViewer DisabledButtonClass="btn-disabled" />
````


## DocumentMapAreaPosition

Gets or sets the document map area position. Left (Default). Right.

### Type

[`Telerik.ReportViewer.Blazor.DocumentMapAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#documentmapareaposition)

### Example

````C#
<ReportViewer DocumentMapAreaPosition="DocumentMapAreaPosition.Right" />
````


## DocumentMapVisible

Gets or sets  a value indicating whether the viewer's document map is initially visible.

### Type

`System.Boolean`

### Example

````C#
<ReportViewer DocumentMapVisible="true" />
````


## EnableAccessibility

Gets or sets a value indicating whether the accessibility features of the report viewer and its contents are enabled.

### Type

`System.Boolean`

### Example

````C#
<ReportViewer EnableAccessibility="true" />
````


## InitialPageAreaImageUrl

Gets or sets the image URL for the PageArea background image. Used only when the parameter values are missing or invalid.

### Type

`System.String`

### Example

````C#
<ReportViewer InitialPageAreaImageUrl="/images/loading-background.png" />
````


## KeepClientAlive

Gets or sets a value indicating whether the client will be kept alive.

When set to true a request will be sent to the server to stop the client from expiring, determined by the ClientSessionTimeout server configuration

When set to false, the client will be left to be expired

### Type

`System.Boolean`

### Example

````C#
<ReportViewer KeepClientAlive="true" />
````


## PageMode

Gets or sets the page mode.

- SinglePage - Displays a single report page.
- ContinuousScroll - Displays multiple report pages. Pages are loaded on-demand while scrolling.

### Type

[`Telerik.ReportViewer.Blazor.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#pagemode)

### Example

````C#
<ReportViewer PageMode="PageMode.SinglePage" />
````


## ParameterEditors

Gets or sets the user-defined custom editors for the report parameters. Each custom editor requires a function name for its `Telerik.ReportViewer.Blazor.ParameterEditor.Match` and `Telerik.ReportViewer.Blazor.ParameterEditor.CreateEditor` properties. The function names should be fully qualified, e.g. "window.trvDateTimeCustomEditor.match", or just "trvDateTimeCustomEditor.match" ("window" qualifier is optional). The functions should be implemented inside the wwwroot/index.html (Blazor WebAssembly) or Pages/_Host.cshtml (Blazor Server).

### Type

[`Telerik.ReportViewer.Blazor.ParameterEditor`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#parametereditor)

### Example

````C#
<ReportViewer ParameterEditors="@(new ParameterEditor[]
              {
                  new ParameterEditor
                  {
                      Match = "singleSelectEditor.matchFunction",
                      CreateEditor = "singleSelectEditor.createEditorFunction"
                  }
              })" />

<script>
        window.singleSelectEditor = {
            matchFunction: function (parameter) {
             return Boolean(parameter.availableValues) && !parameter.multivalue;
            },
            createEditorFunction: function createEditorFunction(placeholder, options) {
                let dropDownListElement = $(placeholder).html('<input style="width: 50px;" />');
                let valueChangedCallback = options.parameterChanged;
                let parameter;

                function onChange(e) {
                    var years = $(dropDownListElement).data("kendoDropDownList");
                    var val = years.value();
                    valueChangedCallback(parameter, val);
                }

                return {
                    beginEdit: function (param) {
                    parameter = param;

                    $(dropDownListElement).kendoDropDownList({
                        dataSource: param.availableValues.map((el) => el.value),
                        change: onChange
                    });

                    dropDownList = $(dropDownListElement).data("kendoDropDownList");
                }
            };
        }
    }
</script>
````


## Parameters

Gets or sets the options of the built-in parameter editors.

### Type

[`Telerik.ReportViewer.Blazor.ParametersOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#parametersoptions)


## ParametersAreaPosition

Gets or sets the parameters area position. Right (Default). Left. Top. Bottom.

### Type

[`Telerik.ReportViewer.Blazor.ParametersAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#parametersareaposition)

### Example

````C#
<ReportViewer ParametersAreaPosition="ParametersAreaPosition.Top" />
````


## ParametersAreaVisible

Gets or sets a value indicating whether the viewer's parameters area is initially visible.

### Type

`System.Boolean`

### Example

````C#
<ReportViewer ParametersAreaVisible="true" />
````


## PersistSession

Gets or sets a value indicating whether the viewer's client state will be persisted between the page refreshes/postbacks. The state is stored in the browser's sessionStorage and is available for the duration of the page session.

### Type

`System.Boolean`

### Example

````C#
<ReportViewer PersistSession="true" />
````


## PrintMode

Gets or sets the print mode of the viewer.

- Three modes exist currently:
- AutoSelect - The viewer automatically determinse how to print: via the browser's PDF plug-in or exporting to a PDF file.
- ForcePDFPlugin - The viewer always uses the PDF plugin regardless of the browser's version and settings.
- ForcePDFFile - The viewer always exports the report document to PDF format with 'automatic print on open' script enabled.

### Type

[`Telerik.ReportViewer.Blazor.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#printmode)

### Example

````C#
<ReportViewer PrintMode="PrintMode.ForcePDFPlugin" />
````


## ReportServer

Gets or sets the connection data of the report server that hosts the reports. When a Report Server connection is used, the ServiceUrl property should not be set. For more information see http://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html.

### Type

[`Telerik.ReportViewer.Blazor.ReportServerOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportserveroptions)

### Example

````C#
@* Report Server for .NET - Token authentication (recommended) *@
<ReportViewer ReportServer="@(new ReportServerOptions
              {
                  Url = "https://yourReportServerUrl:port",
                  GetPersonalAccessToken = "trvCallbacks.getPersonalAccessToken"
              })" />

<script>
    window.trvCallbacks = {
        getPersonalAccessToken: function () {
            return Promise.resolve('<personal-access-token>');
        }
    }
</script>

@* Report Server Username/password authentication (both servers) *@
<ReportViewer ReportServer="@(new ReportServerOptions
              {
                  Url = "https://yourReportServerUrl:port",
                  Username = "myUsername",
                  Password = "myPassword"
              })" />

@* Report Server for .NET Framework 4.6.2 - Guest account (requires Guest enabled on server) *@
<ReportViewer ReportServer="@(new ReportServerOptions
              {
                  Url = "https://demos.telerik.com/report-server/"
              })" />
````


## ReportSource

Gets or sets the [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) for the report displayed in the viewer.

### Type

[`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions)

### Example

````C#
<ReportViewer ReportSource="@(new ReportSourceOptions("Invoice.trdp", new Dictionary<string, object>
              {
                  {"OrderNumber", "SO43659"},
                  {"ForYear", 2024}
              }))" />
````


## Scale

Gets or sets zoom ratio of the report. ScaleMode needs to be set to Specific for this property to take effect. 1.0 is equal to 100%, i.e. the original size of the report.

### Type

`System.Double`

### Example

````C#
<ReportViewer Scale="1.5" />
````


## ScaleMode

Gets or sets the scale mode of the viewer.

- Three modes exist currently:
- FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.
- FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.
- Specific - Uses the scale to zoom the report in and out.

### Type

[`Telerik.ReportViewer.Blazor.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#scalemode)

### Example

````C#
<ReportViewer ScaleMode="ScaleMode.FitPageWidth" />
````


## SearchMetadataOnDemand

Gets or sets a value indicating whether the search metadata will be delivered on demand or by default.

### Type

`System.Boolean`

### Example

````C#
<ReportViewer SearchMetadataOnDemand="true" />
````


## Selector

Gets or sets a selector that is used in conjunction with data attributes (https://docs.telerik.com/reporting/html5-report-viewer-data-attributes). Whenever a command is attached to an element outside of the report viewer via a data-attribute this selector must be provided.

### Type

`System.String`

### Example

````C#
<ReportViewer Selector="#myReportViewerSelector" />
````


## SendEmail

Gets or sets the default send e-mail message options.

### Type

[`Telerik.ReportViewer.Blazor.SendEmailOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#sendemailoptions)

### Example

````C#
<ReportViewer SendEmail="@(new SendEmailOptions
              {
                  Enabled = true,
                  From = "sender@company.com",
                  To = "recipient@company.com",
                  Subject = "Monthly Report",
                  Body = "Please find the attached report.",
                  Format = "PDF"
              })" />
````


## ServiceUrl

Gets or sets the URL of the service which will provide the report viewer with reports (relative or absolute). The service must be properly configured so that the report viewer can successfully communicate with the server. For more information on how to configure the service please check http://www.telerik.com/help/reporting/telerik-reporting-rest-conception.html.

### Type

`System.String`

### Example

````C#
<ReportViewer ServiceUrl="/api/reports" />
````


## TemplateUrl

Gets or sets the url for the report viewer template. A customized template can be provided as described in http://www.telerik.com/help/reporting/html5-report-viewer-templates.html.

### Type

`System.String`

### Example

````C#
<ReportViewer TemplateUrl="/custom-report-template.html" />
````


## ViewerId

Gets or sets the unique identifier of the ReportViewer instance.

### Type

`System.String`

### Example

````C#
<ReportViewer ViewerId="MyReportViewer1" />
````


## ViewMode

Gets or sets the view mode.

- PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is disabled.
- Interactive - Displays the report in its original width and height with no paging. Interactivity is enabled.

### Type

[`Telerik.ReportViewer.Blazor.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#viewmode)

### Example

````C#
<ReportViewer ViewMode="ViewMode.PrintPreview" />
````

