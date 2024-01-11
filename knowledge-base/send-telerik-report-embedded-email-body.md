---
title: How to Send a Telerik Report Embedded in an Email Body
description: "Learn how to programmatically send a Telerik report, containing multiple graphs and tables, embedded in an email body."
type: how-to
page_title: Sending a Telerik Report Embedded in an Email Body
slug: send-telerik-report-embedded-email-body
tags: telerik, reporting, email, embedded, programmatically
res_type: kb
---

## Environment

| Property | Value |
| --- | --- |
| Product | Progress® Telerik® Reporting |
| Version | 16.0.22.119 |

## Description

I want to programmatically send a Telerik report, which includes multiple graphs and tables, embedded in an email body. I need an example or advice on how to accomplish this.

## Solution

To send a Telerik report embedded in an email body, follow these steps:

1. Render the report in the IMAGE format. You can use the [Exporting a report to a multi-document format](https://docs.telerik.com/reporting/t-telerik-reporting-processing-reportprocessor#overloads) example as a reference.
2. Specify the desired image format (e.g., JPG, PNG) using the `OutputFormat` setting in the [Image Device Information Settings](https://docs.telerik.com/reporting/t-telerik-reporting-processing-reportprocessor#renderreport) of Telerik Reporting.
3. Create a class that renders the report into images. Here's an example:

```csharp
public class ReportRender
{
    public List<Stream> streams = new List<Stream>();

    void CloseStreams()
    {
        foreach (Stream stream in this.streams)
        {
            stream.Close();
        }
        this.streams.Clear();
    }

    public Stream CreateStream(string name, string extension, Encoding encoding, string mimeType)
    {
        MemoryStream ms = new MemoryStream();
        this.streams.Add(ms);
        return ms;
    }

    public void Render()
    {
        var report = "PathToReport";
        string documentName = "";

        var deviceInfo = new Hashtable();
        deviceInfo.Add("OutputFormat", "PNG");

        ReportProcessor reportProcessor = new ReportProcessor();

        var reportSource = new UriReportSource() { Uri = report };

        bool result = reportProcessor.RenderReport("IMAGEPrintPreview", reportSource, deviceInfo, this.CreateStream, out documentName);

        foreach (MemoryStream ms in this.streams)
        {
            var str = Encoding.ASCII.GetString(ms.ToArray());
            Console.WriteLine(str);
        }

        this.CloseStreams();
    }
}
```

4. Convert the rendered images to Base64 strings using methods like [Convert an image to a Base64 string](https://stackoverflow.com/questions/37191883/convert-an-image-selected-by-path-to-base64-string) or [MemoryStream to String, and back to MemoryStream without adding any bytes](https://stackoverflow.com/questions/221925/convert-a-stream-to-a-string).
5. Embed the Base64 string images into the email's HTML using the `IMG` tag. For example:

```html
<img src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAAUA
    AAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO
    9TXL0Y4OHwAAAABJRU5ErkJggg==" alt="Red dot" />
```
