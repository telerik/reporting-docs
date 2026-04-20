---
title: Commands
page_title: Commands of the Blazor Report Viewer
description: Complete list of commands available in the Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/commands
tags: commands
published: True
reportingArea: BlazorWrapper
position: 5
---

# Commands of the Blazor Report Viewer

## Export

Gets the Export command. Execute to export the report in the specified format.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ExportToPdf">Export to PDF</button>

@code {
    ReportViewer reportViewer;
    async void ExportToPdf()
    {
        await reportViewer.Commands.Export.ExecuteAsync("PDF");
    }
}
```


## GoToFirstPage

Gets the GoToFirstPage command. Execute to navigate to the first page of the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="GoToFirstPage">Go to First Page</button>

@code {
    ReportViewer reportViewer;
    async void GoToFirstPage()
    {
        await reportViewer.Commands.GoToFirstPage.ExecuteAsync();
    }
}
```


## GoToLastPage

Gets the GoToLastPage command. Execute to navigate to the last page of the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="GoToLastPage">Go to Last Page</button>

@code {
    ReportViewer reportViewer;
    async void GoToLastPage()
    {
        await reportViewer.Commands.GoToLastPage.ExecuteAsync();
    }
}
```


## GoToNextPage

Gets the GoToNextPage command. Execute to navigate to the next page of the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="GoToNextPage">Go to Next Page</button>

@code {
    ReportViewer reportViewer;
    async void GoToNextPage()
    {
        await reportViewer.Commands.GoToNextPage.ExecuteAsync();
    }
}
```


## GoToPage

Gets the GoToPage command. Execute to navigate to a specific page of the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="GoToPageThree">Go to Page 3</button>

@code {
    ReportViewer reportViewer;
    async void GoToPageThree()
    {
        await reportViewer.Commands.GoToPage.ExecuteAsync(3);
    }
}
```


## GoToPrevPage

Gets the GoToPrevPage command. Execute to navigate to the previous page of the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="GoToPrevPage">Go to Previous Page</button>

@code {
    ReportViewer reportViewer;
    async void GoToPrevPage()
    {
        await reportViewer.Commands.GoToPrevPage.ExecuteAsync();
    }
}
```


## HistoryBack

Gets the HistoryBack command. Execute to navigate back to the previously rendered report from history.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="NavigateBack">Navigate Back in History</button>

@code {
    ReportViewer reportViewer;
    async void NavigateBack()
    {
        await reportViewer.Commands.HistoryBack.ExecuteAsync();
    }
}
```


## HistoryForward

Gets the HistoryForward command. Execute to navigate forward to the next report from history.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="NavigateForward">Navigate Forward in History</button>

@code {
    ReportViewer reportViewer;
    async void NavigateForward()
    {
        await reportViewer.Commands.HistoryForward.ExecuteAsync();
    }
}
```


## Print

Gets the Print command. Execute to print the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="PrintReport">Print Report</button>

@code {
    ReportViewer reportViewer;
    async void PrintReport()
    {
        await reportViewer.Commands.Print.ExecuteAsync();
    }
}
```


## Refresh

Gets the Refresh command. Execute to refresh the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="RefreshReport">Refresh Report</button>

@code {
    ReportViewer reportViewer;
    async void RefreshReport()
    {
        await reportViewer.Commands.Refresh.ExecuteAsync();
    }
}
```


## ToggleAiPromptDialog

Gets the ToggleAiPromptDialog command. Execute to show or hide the AI prompt dialog.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ToggleAiPromptDialog">Toggle AI Prompt Dialog</button>

@code {
    ReportViewer reportViewer;
    async void ToggleAiPromptDialog()
    {
        await reportViewer.Commands.ToggleAiPromptDialog.ExecuteAsync();
    }
}
```


## ToggleDocumentMap

Gets the ToggleDocumentMap command. Execute to show or hide the document map.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ToggleDocumentMap">Toggle Document Map</button>

@code {
    ReportViewer reportViewer;
    async void ToggleDocumentMap()
    {
        await reportViewer.Commands.ToggleDocumentMap.ExecuteAsync();
    }
}
```


## ToggleParametersArea

Gets the ToggleParametersArea command. Execute to show or hide the parameters area.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ToggleParametersArea">Toggle Parameters Area</button>

@code {
    ReportViewer reportViewer;
    async void ToggleParametersArea()
    {
        await reportViewer.Commands.ToggleParametersArea.ExecuteAsync();
    }
}
```


## TogglePrintPreview

Gets the TogglePrintPreview command. Execute to toggle between Print Preview and Interactive view modes.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="TogglePrintPreview">Toggle Print Preview</button>

@code {
    ReportViewer reportViewer;
    async void TogglePrintPreview()
    {
        await reportViewer.Commands.TogglePrintPreview.ExecuteAsync();
    }
}
```


## ToggleSearchDialog

Gets the ToggleSearchDialog command. Execute to show or hide the search dialog.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ToggleSearchDialog">Toggle Search Dialog</button>

@code {
    ReportViewer reportViewer;
    async void ToggleSearchDialog()
    {
        await reportViewer.Commands.ToggleSearchDialog.ExecuteAsync();
    }
}
```


## ToggleSendEmailDialog

Gets the ToggleSendEmailDialog command. Execute to show or hide the send email dialog.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ToggleSendEmailDialog">Toggle Send Email Dialog</button>

@code {
    ReportViewer reportViewer;
    async void ToggleSendEmailDialog()
    {
        await reportViewer.Commands.ToggleSendEmailDialog.ExecuteAsync();
    }
}
```


## ToggleZoomMode

Gets the ToggleZoomMode command. Execute to change the zoom mode of the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ToggleZoomMode">Toggle Zoom Mode</button>

@code {
    ReportViewer reportViewer;
    async void ToggleZoomMode()
    {
        await reportViewer.Commands.ToggleZoomMode.ExecuteAsync();
    }
}
```


## Zoom

Gets the Zoom command. Execute to zoom the report to a specified ratio.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ZoomToFiftyPercent">Zoom to 50%</button>

@code {
    ReportViewer reportViewer;
    async void ZoomToFiftyPercent()
    {
        await reportViewer.Commands.Zoom.ExecuteAsync(0.5);
    }
}
```


## ZoomIn

Gets the ZoomIn command. Execute to zoom in the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ZoomIn">Zoom In</button>

@code {
    ReportViewer reportViewer;
    async void ZoomIn()
    {
        await reportViewer.Commands.ZoomIn.ExecuteAsync();
    }
}
```


## ZoomOut

Gets the ZoomOut command. Execute to zoom out the report.

### Example

```C#
<ReportViewer @ref="reportViewer"
              ServiceUrl="/api/reports"
              ReportSource="@(new ReportSourceOptions("Invoice.trdp"))" />
<button @onclick="ZoomOut">Zoom Out</button>

@code {
    ReportViewer reportViewer;
    async void ZoomOut()
    {
        await reportViewer.Commands.ZoomOut.ExecuteAsync();
    }
}
```

