---
title: How to render reports asynchronously by using the async and await keywords
description: "Learn how to render Telerik Reporting reports asynchronously using the async and await keywords, and how to pass report parameters programmatically."
type: how-to
page_title: Render Reports Asynchronously with async and await
slug: how-to-render-reports-asynchronously-by-using-the-async-and-await-keywords
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Framework</td>
		<td>.NET Framework 4.5 and higher</td>
	</tr>
</table>
 
## Description

.NET Framework 4.5 introduced the `Task<T>` class and the `async` and `await` keywords, which simplify parallel programming. This article explains how to use these features with the Telerik Reporting [`ReportProcessor`](/api/telerik.reporting.processing.reportprocessor) class to render reports asynchronously, and how to pass report parameters to reports that require them.

## Solution  

The [`ReportProcessor`](/api/telerik.reporting.processing.reportprocessor) class and its [`RenderReport`](/api/telerik.reporting.processing.reportprocessor#collapsible-Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) method provide all the functionality needed for programmatic report generation. Because `RenderReport` returns a [`RenderingResult`](/api/telerik.reporting.processing.renderingresult), wrap the call in a method that returns `Task<RenderingResult>` to use it asynchronously:
   
```csharp
public class AsyncWrappers
{
    // Wrap the RenderingResult like this:
    public async Task<RenderingResult> RenderReportAsync(Type reportType) // Pass parameters here, like device info and report to render
    {
        ReportProcessor reportProcessor = new ReportProcessor();
 
        // Apply any deviceInfo settings if necessary
        Hashtable deviceInfo = new Hashtable();
 
        // Any other Report Source can be used instead
        // For example InstanceReportSource can be used if the instantiated report is passed as parameter of the method
        TypeReportSource typeReportSource = new TypeReportSource();
 
        typeReportSource.TypeName = reportType.AssemblyQualifiedName;
 
        return await Task.Run(() => reportProcessor.RenderReport("PDF", typeReportSource, deviceInfo));
    }
}
```
```VB.NET
Public Class AsyncWrappers
    ' Wrap the RenderingResult like this:
    Public Function RenderReportAsync(reportType As Type) As Task(Of RenderingResult)
    ' Pass parameters here, like device info and report to render
        Dim reportProcessor As New ReportProcessor()
  
        ' Apply any deviceInfo settings if necessary
        Dim deviceInfo As New Hashtable()
  
        ' Any other Report Source can be used instead
        ' For example InstanceReportSource can be used if the instantiated report is passed as parameter of the method
        Dim typeReportSource As New TypeReportSource()
  
        typeReportSource.TypeName = reportType.AssemblyQualifiedName
  
        Return Await Task.Run(Function() reportProcessor.RenderReport("PDF", typeReportSource, deviceInfo))
    End Function
End Class
```

The method returns `Task<RenderingResult>` and is marked `async`. The `RenderReport` call is wrapped in `Task.Run` and awaited, offloading the blocking render work to a thread-pool thread. Use the wrapper in your application code:

```csharp
//Use the wrapper in your code like this:
public async Task<string> RenderReportAsync()
{
    var asyncWrappers = new AsyncWrappers();
  
    Console.WriteLine("Rendering started on: {0}", Thread.CurrentThread.ManagedThreadId);
  
    var result = await asyncWrappers.RenderReportAsync( typeof(Telerik.Reporting.Report) );// pass the type of your report here
  
    string fileName = result.DocumentName + "." + result.Extension;
    string path = System.IO.Path.GetTempPath();
    string filePath = System.IO.Path.Combine(path, fileName);
  
    using (System.IO.FileStream fs = new System.IO.FileStream(filePath, System.IO.FileMode.Create))
    {
        fs.Write(result.DocumentBytes, 0, result.DocumentBytes.Length);
    }
  
    Console.WriteLine("Rendering finished on: {0}\n", Thread.CurrentThread.ManagedThreadId);
  
    // You can return void but that is not recommended
    return string.Format("Successfully rendered! File saved in {0}\n", filePath);
}
```
```VB.NET
'Use the wrapper in your code like this:
Public Function RenderReportAsync() As Task(Of String)
    Dim asyncWrappers = New AsyncWrappers()
 
    Console.WriteLine("Rendering started on: {0}", Thread.CurrentThread.ManagedThreadId)
 
    Dim result = Await asyncWrappers.RenderReportAsync(GetType(Telerik.Reporting.Report))
    ' pass the type of your report here
    Dim fileName As String = Convert.ToString(result.DocumentName) & "." & Convert.ToString(result.Extension)
    Dim path As String = System.IO.Path.GetTempPath()
    Dim filePath As String = System.IO.Path.Combine(path, fileName)
 
    Using fs As New System.IO.FileStream(filePath, System.IO.FileMode.Create)
        fs.Write(result.DocumentBytes, 0, result.DocumentBytes.Length)
    End Using
 
    Console.WriteLine("Rendering finished on: {0}" & vbLf, Thread.CurrentThread.ManagedThreadId)
 
    ' You can return void but that is not recommended
    Return String.Format("Successfully rendered! File saved in {0}" & vbLf, filePath)
End Function
```

### Full Console Application Example

The following example invokes the wrapper from a console application. While the report renders on a background thread, the main thread continues executing `Count()`:

```C#
class Program
{
    // A working example
    static void Main(string[] args)
    {
        // Use your class to render the report in an async manner
        var myClass = new MyClass();
  
        Console.WriteLine("Starting rendering...");
        var task = myClass.RenderReportAsync();
  
        // While the report is rendering do something else
        Count();
  
        Console.WriteLine("Main finished on: {0}", Thread.CurrentThread.ManagedThreadId);
        Console.WriteLine("Render Status: {0}\n", task.Result);
  
        Console.ReadLine();
    }
  
    static void Count()
    {
        for (int i = 0; i < 10; i++)
        {
            Console.WriteLine(i);
        }
    }
}
```
```VB.NET
Class Program
    ' A working example
    Private Shared Sub Main(args As String())
        ' Use your class to render the report in an async manner
        Dim [myClass] = New [MyClass]()
 
        Console.WriteLine("Starting rendering...")
        Dim task = [myClass].RenderReportAsync()
 
        ' While the report is rendering do something else
        Count()
 
        Console.WriteLine("Main finished on: {0}", Thread.CurrentThread.ManagedThreadId)
        Console.WriteLine("Render Status: {0}" & vbLf, task.Result)
 
        Console.ReadLine()
    End Sub
 
    Private Shared Sub Count()
        For i As Integer = 0 To 9
            Console.WriteLine(i)
        Next
    End Sub
End Class
```

### Passing Report Parameters

Some reports define parameters that must be supplied before rendering. The `TypeReportSource` class exposes a `Parameters` collection where you add [`Parameter`](/api/telerik.reporting.parameter) objects.

Extend the wrapper method to accept a parameter dictionary, then populate the collection before the `Task.Run` call:

```csharp
public class AsyncWrappers
{
    public async Task<RenderingResult> RenderReportAsync(
        Type reportType,
        IDictionary<string, object> parameters = null)
    {
        ReportProcessor reportProcessor = new ReportProcessor();
        Hashtable deviceInfo = new Hashtable();

        TypeReportSource typeReportSource = new TypeReportSource();
        typeReportSource.TypeName = reportType.AssemblyQualifiedName;

        if (parameters != null)
        {
            foreach (var param in parameters)
            {
                typeReportSource.Parameters.Add(new Parameter(param.Key, param.Value));
            }
        }

        return await Task.Run(() => reportProcessor.RenderReport("PDF", typeReportSource, deviceInfo));
    }
}
```
```vb
Public Class AsyncWrappers
    Public Function RenderReportAsync(
        reportType As Type,
        Optional parameters As IDictionary(Of String, Object) = Nothing) As Task(Of RenderingResult)

        Dim reportProcessor As New ReportProcessor()
        Dim deviceInfo As New Hashtable()

        Dim typeReportSource As New TypeReportSource()
        typeReportSource.TypeName = reportType.AssemblyQualifiedName

        If parameters IsNot Nothing Then
            For Each param In parameters
                typeReportSource.Parameters.Add(New Parameter(param.Key, param.Value))
            Next
        End If

        Return Await Task.Run(Function() reportProcessor.RenderReport("PDF", typeReportSource, deviceInfo))
    End Function
End Class
```

Call the extended wrapper with a parameter dictionary:

```csharp
var result = await asyncWrappers.RenderReportAsync(
    typeof(MyReport),
    new Dictionary<string, object>
    {
        { "StartDate", new DateTime(2024, 1, 1) },
        { "EndDate", new DateTime(2024, 12, 31) }
    });
```
```vb
Dim result = Await asyncWrappers.RenderReportAsync(
    GetType(MyReport),
    New Dictionary(Of String, Object) From {
        {"StartDate", New DateTime(2024, 1, 1)},
        {"EndDate", New DateTime(2024, 12, 31)}
    })
```

For reports that need direct access to the report instance — for example, to set properties in addition to parameters — use `InstanceReportSource` instead:

```csharp
var report = new MyReport(); // your report class
report.ReportParameters["StartDate"].Value = new DateTime(2024, 1, 1);
report.ReportParameters["EndDate"].Value = new DateTime(2024, 12, 31);

InstanceReportSource instanceReportSource = new InstanceReportSource();
instanceReportSource.ReportDocument = report;

return await Task.Run(() => reportProcessor.RenderReport("PDF", instanceReportSource, deviceInfo));
```
```vb
Dim report As New MyReport() ' your report class
report.ReportParameters("StartDate").Value = New DateTime(2024, 1, 1)
report.ReportParameters("EndDate").Value = New DateTime(2024, 12, 31)

Dim instanceReportSource As New InstanceReportSource()
instanceReportSource.ReportDocument = report

Return Await Task.Run(Function() reportProcessor.RenderReport("PDF", instanceReportSource, deviceInfo))
```

>note If a report has no parameters, the simplified wrapper from the first example works without modification.

## Notes

[Download a sample console application](resources/AsyncAwaitDemo.zip).

## See Also

[Embedded Report Engine](slug:telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine)
