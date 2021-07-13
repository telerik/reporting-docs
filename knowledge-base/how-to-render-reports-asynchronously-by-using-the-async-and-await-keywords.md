---
title: How to render reports asynchronously by using the async and await keywords
description: How to render reports asynchronously by using the async and await keywords.
type: how-to
page_title: How to render reports asynchronously by using the async and await keywords
slug: how-to-render-reports-asynchronously-by-using-the-async-and-await-keywords
res_type: kb
---
 
## Description

 With the new .NET Framework (4.5), a new way to handle parallel programming has been added - with the help of the **Task&lt;&gt;** class and the keywords **async** and **await**, parallel programming has become much easier. This raises the question, how can these features be used with Telerik Reporting?
 
## Solution  

First, we will have to start with the [*ReportProcessor*](../t-telerik-reporting-processing-reportprocessor) class and its [**RenderReport**](../m-telerik-reporting-processing-reportprocessor-renderreport) method, which provides all the needed functionality for programmatic generation of reports. Since RenderReport returns [RenderingResult](../t-telerik-reporting-processing-renderingresult), in order to use it asynchronously, you will have to create a method that returns this result. However, since we want to achieve the task in an *async* manner, we will take advantage of the *Task* class:   
   
````C#
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
````
````VB
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
````
    
 Besides declaring the return value to be Task&lt;RenderingResult&gt; we have marked the method as **async**. Also, we are invoking the *RenderReport* method using the **await** keyword. For the second part, we will use our method in an async manner: 

  
````C#
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
````
````VB
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
````  

Finally, we will invoke this method in a console application and check the results: 

````C#
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
````
````VB
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
````

## Additional Resources

[Download a sample console application](resources/AsyncAwaitDemo.zip).

## See Also

[Embedded Report Engine](../programmatic-exporting-report)
