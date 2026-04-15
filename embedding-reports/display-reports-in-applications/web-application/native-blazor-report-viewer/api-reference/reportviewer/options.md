---
title: Options
page_title: Options of the Native Blazor Report Viewer
description: Complete list of options available in the Native Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options
tags: options
published: True
reportingArea: NativeBlazor
position: 2
---

# Options of the Native Blazor Report Viewer

## AuthenticationToken

Gets or sets the authentication (bearer) token that is passed in the Authorization header of the viewer's requests.

### Type

`System.String`

### Example

````C#
<ReportViewer 
    AuthenticationToken="your-auth-token">
</ReportViewer>
````


## DocumentMapVisible

Gets or sets  a value indicating whether the viewer's document map is initially visible.

### Type

`System.Boolean`

### Example

````C#
<ReportViewer 
    DocumentMapVisible="true">
</ReportViewer>
````


## EnableAccessibility

Enables or disables the accessibility features of the report viewer and its contents.

### Type

`System.Boolean`

### Example

````C#
<ReportViewer 
    EnableAccessibility="true">
</ReportViewer>
````


## EnableSendEmail

Determines whether the send Email functionality is enabled. If set to false, the send Email button will not be rendered in the toolbar.

### Type

`System.Boolean`

### Example

````C#
<ReportViewer 
    EnableSendEmail="true">
</ReportViewer>
````


## Height

The width of the component.

### Type

`System.String`

### Example

````C#
<ReportViewer 
    Height="500px">
</ReportViewer>
````


## KeepClientAlive

Gets or sets a value indicating whether the client will be kept alive.

When set to true a request will be sent to the server to stop the client from expiring, determined by the ClientSessionTimeout server configuration

When set to false, the client will be left to be expired

### Type

`System.Boolean`

### Example

````C#
<ReportViewer 
    KeepClientAlive="true">
</ReportViewer>
````


## PageMode

Sets if the report is displayed in Single page or Continuous scroll mode.

### Type

[`Telerik.ReportViewer.BlazorNative.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#pagemode)

### Example

````C#
<ReportViewer 
    PageMode="@PageMode.SinglePage">
</ReportViewer>
````


## ParameterBooleanTemplate

Template used to render boolean report viewer parameter editors. Allows for declaring custom boolean report viewer parameter editors.

### Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

### Example

````C#
<ReportViewer>
    <ParameterBooleanTemplate>
        <TelerikCheckBox Value="@((bool)context.Value)"
                        ValueChanged="@((bool value) => context.Value = value)">
        </TelerikCheckBox>
    </ParameterBooleanTemplate>
</ReportViewer>
````


## ParameterDateTimeTemplate

Template used to render DateTime report viewer parameter editors. Allows for declaring custom DateTime report viewer parameter editors.

### Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

### Example

````C#
<ReportViewer>
    <ParameterDateTimeTemplate>
        <TelerikDatePicker Value="@((DateTime)context.Value)"
                        ValueChanged="@((DateTime value) => context.Value = value)">
        </TelerikDatePicker>
    </ParameterDateTimeTemplate>
</ReportViewer>
````


## ParameterDoubleTemplate

Template used to render double report viewer parameter editors. Allows for declaring custom double report viewer parameter editors.

### Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

### Example

````C#
<ReportViewer>
    <ParameterDoubleTemplate>
        <TelerikNumericTextBox Value="@((double)context.Value)"
                            ValueChanged="@((double value) => context.Value = value)">
        </TelerikNumericTextBox>
    </ParameterDoubleTemplate>
</ReportViewer>
````


## ParameterIntegerTemplate

Template used to render integer report viewer parameter editors. Allows for declaring custom integer report viewer parameter editors.

### Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

### Example

````C#
<ReportViewer>
    <ParameterIntegerTemplate>
        <TelerikNumericTextBox Value="@((long)context.Value)"
                            ValueChanged="@((long value) => context.Value = value)">
        </TelerikNumericTextBox>
    </ParameterIntegerTemplate>
</ReportViewer>
````


## ParameterMultiSelectTemplate

Template used to render multi-select report viewer parameter editors. Allows for declaring custom multi-select report viewer parameter editors.

### Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

### Example

````C#
<ReportViewer>
    <ParameterMultiSelectTemplate>
        @{ var selectedValue = ((IEnumerable<object>)context.Parameter.Value).Cast<object>().ToList(); }

        <TelerikMultiSelect Data="@context.Parameter.AvailableValues"
                            Value="@selectedValue"
                            Filterable="true"
                            FilterOperator="@StringFilterOperator.Contains"
                            TItem="ReportParameterValue"
                            TValue="object"
                            TextField="Name"
                            ValueField="Value"
                            ClearButton="false"
                            OnChange="@((object value) => context.Value = value)">
        </TelerikMultiSelect>
    </ParameterMultiSelectTemplate>
</ReportViewer>
````


## ParametersAreaVisible

Gets or sets a value indicating whether the viewer's parameters area is initially visible.

### Type

`System.Boolean`

### Example

````C#
<ReportViewer 
    ParametersAreaVisible="true">
</ReportViewer>
````


## ParameterSingleSelectTemplate

Template used to render single-select report viewer parameter editors. Allows for declaring custom single-select report viewer parameter editors.

### Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

### Example

````C#
<ReportViewer>
    <ParameterSingleSelectTemplate>
        <TelerikDropDownList Data="@context.Parameter.AvailableValues"
                            Value="@context.Value"
                            DefaultText=""
                            TItem="ReportParameterValue"
                            TValue="object"
                            TextField="Name"
                            ValueField="Value"
                            OnChange="@((object value) => context.Value = value)">
        </TelerikDropDownList>
    </ParameterSingleSelectTemplate>
</ReportViewer>
````


## ParameterStringTemplate

Template used to render string report viewer parameter editors. Allows for declaring custom string report viewer parameter editors.

### Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

### Example

````C#
<ReportViewer>
    <ParameterStringTemplate>
        <TelerikTextBox Value="@((string)context.Value)"
                        ValueChanged="@((string value) => context.Value = value)">
        </TelerikTextBox>
    </ParameterStringTemplate>
</ReportViewer>
````


## ParameterTemplate

Generic template used to render report viewer parameter editors. Allows for declaring custom report viewer parameter editors.

### Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

### Example

````C#
<ReportViewer>
    <ParameterTemplate>
        @if (context.Parameter.AvailableValues?.Count > 0)
        {
            if (context.Parameter.Multivalue)
            {
                var selectedValue = ((IEnumerable<object>)context.Parameter.Value).Cast<object>().ToList();

                <TelerikMultiSelect Data="@context.Parameter.AvailableValues" Value="@selectedValue" Filterable="true"
                    FilterOperator="@StringFilterOperator.Contains" TItem="ReportParameterValue" TValue="object"
                    TextField="Name" ValueField="Value" ShowClearButton="false"
                    OnChange="@((object value) => context.Value = value)">
                </TelerikMultiSelect>
            }
            else
            {
                <TelerikDropDownList Data="@context.Parameter.AvailableValues" Value="@context.Value" DefaultText=""
                    TItem="ReportParameterValue" TValue="object" TextField="Name" ValueField="Value"
                    OnChange="@((object value) => context.Value = value)">
                </TelerikDropDownList>
            }
        }
        else
        {
            if (context.Parameter.Type == "System.DateTime")
            {
                <TelerikDatePicker Value="@((DateTime)context.Value)"
                    ValueChanged="@((DateTime value) => context.Value = value)">
                </TelerikDatePicker>
            }
            else if (context.Parameter.Type == "System.Int64")
            {
                <TelerikNumericTextBox Value="@((long)context.Value)" ValueChanged="@((long value) => context.Value = value)">
                </TelerikNumericTextBox>
            }
            else if (context.Parameter.Type == "System.Double")
            {
                <TelerikNumericTextBox Value="@((double)context.Value)"
                    ValueChanged="@((double value) => context.Value = value)">
                </TelerikNumericTextBox>
            }
            else if (context.Parameter.Type == "System.Boolean")
            {
                <TelerikCheckBox Value="@((bool)context.Value)" ValueChanged="@((bool value) => context.Value = value)">
                </TelerikCheckBox>
            }
            else if (context.Parameter.Type == "System.String")
            {
                <TelerikTextBox Value="@((string)context.Value)" ValueChanged="@((string value) => context.Value = value)">
                </TelerikTextBox>
            }
        }
    </ParameterTemplate>
</ReportViewer>
````


## PrintMode

Gets or sets the print mode of the viewer.

- Three modes exist currently:
- AutoSelect - The viewer automatically determinse how to print: via the browser's PDF plug-in or exporting to a PDF file.
- ForcePDFPlugin - The viewer always uses the PDF plugin regardless of the browser's version and settings.
- ForcePDFFile - The viewer always exports the report document to PDF format with 'automatic print on open' script enabled.

### Type

[`Telerik.ReportViewer.BlazorNative.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#printmode)

### Example

````C#
<ReportViewer 
    PrintMode="@PrintMode.ForcePDFFile">
</ReportViewer>
````


## ReportSource

Gets or sets the [`Telerik.ReportViewer.BlazorNative.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) used to determine which report will be displayed by the viewer.

### Type

[`Telerik.ReportViewer.BlazorNative.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions)

### Example

````C#
<ReportViewer 
    @bind-ReportSource="@ReportSource">
</ReportViewer>

@code {
    public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Name.trdp",
        new Dictionary<string, object>
        {
            { "ParameterName1", "Value" },
            { "ParameterName2", 2 },
            { "ParameterName3", false },
        }
    );
}
````


## ReportViewerSettings

Defines a renderfragment that contains all settings for the Report Viewer.

### Type

`Microsoft.AspNetCore.Components.RenderFragment`

### Example

````C#
<ReportViewer>
    <ReportViewerSettings>
        <ReportServerSettings
            Url="https://report-server:83"
            Username="user"
            Password="pass">
        </ReportServerSettings>
        <SendEmailDialogSettings
            From="from@mail.com"
            To="to@mail.com"
            Cc="cc@mail.com"
            Subject="Report"
            Body="Please find the attached report."
            Format="PDF">
        </SendEmailDialogSettings>
    </ReportViewerSettings>
</ReportViewer>
````


## Scale

Gets or sets zoom ratio of the report. 1.0 is equal to 100%, i.e. the original size of the report.

### Type

`System.Double`

### Example

````C#
<ReportViewer 
    Scale="1.5">
</ReportViewer>
````


## ScaleMode

Gets or sets the scale mode of the viewer.

- Three modes exist currently:
- FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.
- FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.
- Specific - Uses the scale to zoom the report in and out.

### Type

[`Telerik.ReportViewer.BlazorNative.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#scalemode)

### Example

````C#
<ReportViewer 
    ScaleMode="@ScaleMode.FitPageWidth">
</ReportViewer>
````


## ServiceType

Specifies the type of service the ReportViewer is using.

### Type

[`Telerik.ReportViewer.BlazorNative.ReportViewerServiceType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#reportviewerservicetype)

### Example

````C#
<ReportViewer 
    ServiceType="@ReportViewerServiceType.REST">
</ReportViewer>
````


## ServiceUrl

Gets or sets the URL of the service which will provide the report viewer with reports (relative or absolute). The service must be properly configured so that the report viewer can successfully communicate with the server. For more information on how to configure the service please check http://www.telerik.com/help/reporting/telerik-reporting-rest-conception.html.

### Type

`System.String`

### Example

````C#
<ReportViewer 
    ServiceUrl="https://myserver/api/reports">
</ReportViewer>
````


## Tools

Represents the collection of tools available in the report viewer's toolbar. Allows for customizing which tools from the viewer's toolbar are visible and which ones are hidden.

### Type

`System.Collections.Generic.List{Telerik.ReportViewer.BlazorNative.Tools.IReportViewerTool}`

### Example

````C#
<ReportViewer
    Tools="@Tools">
</ReportViewer>

@code {
    public List<IReportViewerTool> Tools = new List<IReportViewerTool>
    {
        new Refresh(),
        new NavigateBackward(),
        new NavigateForward(),
        new StopRendering(),
        new FirstPage(),
        new PreviousPage(),
        new PageNumber(),
        new NextPage(),
        new LastPage(),
        new ToggleViewMode(),
        new Export(),
        new Print(),
        new ToggleDocumentMap(),
        new ToggleParametersArea()
    };
}
````


## TooltipTemplate

Gets or sets the template for rendering tooltips in the ReportViewer.

### Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.Blazor.Components.TooltipTemplateContext}`

### Example

````C#
<ReportViewer>
    <TooltipTemplate>
        <div class="trv-pages-area-kendo-tooltip">
            <div class="trv-pages-area-kendo-tooltip-title">@context.DataAttributes["tooltipTitle"]</div>
            <div class="trv-pages-area-kendo-tooltip-text">@context.DataAttributes["tooltipText"]</div>
        </div>
    </TooltipTemplate>
</ReportViewer>
````


## ViewMode

Gets or sets the view mode.

- PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is disabled.
- Interactive - Displays the report in its original width and height with no paging. Interactivity is enabled.

### Type

[`Telerik.ReportViewer.BlazorNative.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#viewmode)

### Example

````C#
<ReportViewer 
    ViewMode="@ViewMode.PrintPreview">
</ReportViewer>
````


## Width

The width of the component.

### Type

`System.String`

### Example

````C#
<ReportViewer 
    Width="800px">
</ReportViewer>
````

