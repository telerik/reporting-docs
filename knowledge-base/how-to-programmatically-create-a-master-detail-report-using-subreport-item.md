---
title: How To Programmatically Create a Master-Detail Report Using SubReport Item
description: Create a Master-Detail Report using a SubReport Item using only code.
type: how-to
page_title: Create a Master-Detail Report Using SubReport Item Programmatically
slug: how-to-programmatically-create-a-master-detail-report-using-subreport-item
position: 
tags: SubReport, Master-Detail, InstanceReportSource
ticketid: 1440799
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>11.2.17.1004</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
Using the SubReport Item with Parameters in a Master-Detail Report is described in the [How to: Create a Master-Detail Report Using a SubReport Item](https://docs.telerik.com/reporting/designing-reports-master-detail) documentation. However, it is possible to do this when [Embedding the Engine](https://docs.telerik.com/reporting/programmatic-exporting-report) as well.

## Solution
In this case, the logic requires creating two InstanceReportSource objects and a Report Object from the Main Report.(cs|vb) class. Query the Main Report Object for the SubReport Item. Then set the Report Source of the SubReport Item to the SubReport Instance Report Source. See the below code snippets for more details.


### Visual Basic
```vb
Imports System.Reflection
Imports Telerik.Reporting
Imports Telerik.Reporting.Processing
Imports System.IO

Module Module1
    Sub Main()

        Console.WriteLine("Enter Number: 1, 2 or 3")
        Dim Input As Object = Console.ReadLine()

        Dim ReportProcessor As New ReportProcessor()
        Dim DeviceInfo As New Hashtable()

        '   Create MainReport InstanceReportSource
        Dim MainInstanceReportSource As New InstanceReportSource()

        '   Create SubReport InstanceReportSource
        Dim SubInstanceReportSource As New InstanceReportSource With {
            .ReportDocument = New SubReport() '   Set ReportDocument of SubInstanceReportSource
        }

        '   Set Parameters of SubReport InstanceReportSource
        SubInstanceReportSource.Parameters.Add("PersonId", Input)

        '   Create MainReport Object
        Dim MainReportObject As New MainReport()

        '   Find SubReport Report Item of Main Report
        Dim SubReportSource As Telerik.Reporting.SubReport = MainReportObject.Items.Find("SubReport1", True)(0)

        '   Set Report Source of SubReport in MainReport
        SubReportSource.ReportSource = SubInstanceReportSource

        '   Set the ReportDocument of the MainInstanceReportSource
        MainInstanceReportSource.ReportDocument = MainReportObject

        '   Set Parameters of MainInstanceReportSource
        MainInstanceReportSource.Parameters.Add("PersonId", Input)

        '   Continue with Embedding the Report Engine in Application
        Dim PdfRendering As RenderingResult = ReportProcessor.RenderReport("PDF", MainInstanceReportSource, DeviceInfo)

        Dim FileName As String = PdfRendering.DocumentName + "." + PdfRendering.Extension

        '   Saves the Report in Temp Folder C:\Users\[USER]\AppData\Local\Temp
        Dim Path As String = IO.Path.GetTempPath()
        Dim FilePath As String = IO.Path.Combine(Path, FileName)

        '   Writes File To Disk
        Using Stream As New FileStream(FilePath, FileMode.Create)
            Stream.Write(PdfRendering.DocumentBytes, 0, PdfRendering.DocumentBytes.Length)
        End Using

        Console.WriteLine($"File Created: {FilePath}")

        Console.WriteLine("Press Enter to Exit")

        Console.ReadKey()
    End Sub
End Module
```

### C-Sharp
``` csharp
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using Telerik.Reporting;
using Telerik.Reporting.Processing;

static class Program
{
    public static void Main()
    {
        Console.WriteLine("Enter Number: 1, 2 or 3");
        object Input = Console.ReadLine();

        ReportProcessor ReportProcessor = new ReportProcessor();
        Hashtable DeviceInfo = new Hashtable();

        // Create MainReport InstanceReportSource
        InstanceReportSource MainInstanceReportSource = new InstanceReportSource();

        // Create SubReport InstanceReportSource
        InstanceReportSource SubInstanceReportSource = new InstanceReportSource()
        {
            ReportDocument = new SubReport() // Set ReportDocument of SubInstanceReportSource
        };

        // Set Parameters of SubInstanceReportSource
        SubInstanceReportSource.Parameters.Add("PersonId", Input);

        // Create MainReport Object
        MainReport MainReportObject = new MainReport();

        // Find SubReport Report Item of Main Report
        Telerik.Reporting.SubReport SubReportSource = MainReportObject.Items.Find("SubReport1", true)(0);

        // Set Report Source of SubReport in MainReport
        SubReportSource.ReportSource = SubInstanceReportSource;

        // Set the ReportDocument of the MainInstanceReportSource
        MainInstanceReportSource.ReportDocument = MainReportObject;

        // Set Parameters of MainInstanceReportSource
        MainInstanceReportSource.Parameters.Add("PersonId", Input);

        // Continue with Embedding the Report Engine in Application
        RenderingResult PdfRendering = ReportProcessor.RenderReport("PDF", MainInstanceReportSource, DeviceInfo);

        string FileName = PdfRendering.DocumentName + "." + PdfRendering.Extension;

        // Saves the Report in Temp Folder C:\Users\[USER]\AppData\Local\Temp
        string Path = System.IO.Path.GetTempPath();
        string FilePath = System.IO.Path.Combine(Path, FileName);

        // Writes File To Disk
        using (FileStream Stream = new FileStream(FilePath, FileMode.Create))
        {
            Stream.Write(PdfRendering.DocumentBytes, 0, PdfRendering.DocumentBytes.Length);
        }

        Console.WriteLine($"File Created: {FilePath}");

        Console.WriteLine("Press Enter to Exit");

        Console.ReadKey();
    }
}
```
## See Also
*   [How to: Create a Master-Detail Report Using a SubReport Item](https://docs.telerik.com/reporting/designing-reports-master-detail)
*   [Embedding the Engine](https://docs.telerik.com/reporting/programmatic-exporting-report)
