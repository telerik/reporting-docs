---
title: How To Disable Logging the Tracing Information from Telerik Reporting
description: How to skip logging the tracing information from Telerik Reporting by your project Trace Listeners
type: how-to
page_title: Skip Tracing Information Logged by Telerik Reporting
slug: disable-logging-tracing-information-from-telerik-reporting
position: 
tags: 
ticketid: 1563855
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

The Telerik Reporting engine uses [System.Diagnostics.Trace.WriteLine(string)](https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.trace.writeline?view=net-6.0#system-diagnostics-trace-writeline(system-string)) method to log tracing information. Generally, this means that the information gets passed to all Trace Listeners and they should use it as required.
However, the __Trace.WriteLine__ commands cannot be filtered out and don't pass through the filter [ShouldTrace](https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.tracefilter.shouldtrace?view=net-6.0). This makes it impossible to filter out the information logged by the Reporting engine through a filter.

## Suggested Workarounds

You may use the approach from the Stackoverflow thread [Suppress Trace Messages From Specific DLL](https://stackoverflow.com/questions/19353458/suppress-trace-messages-from-specific-dll).
Here is a sample implementation for the custom Trace Listener class:

````CSharp
using System.Diagnostics;
using System.Reflection;

public class CustomTraceListener : TextWriterTraceListener
{
    Assembly assemblyToIgnore;

    public CustomTraceListener(Assembly assemblyToIgnoreTracesFrom, Stream stream)
        :base(stream)
    {
        this.assemblyToIgnore = assemblyToIgnoreTracesFrom;
        //this.Filter = new CustomTraceFilter(SourceLevels.All);
        this.Writer = new StreamWriter(stream);
    }

    public bool TraceIsFromAssemblyToIgnore()
    {
        var traceCallStack = new StackTrace();
        foreach (StackFrame traceStackFrame in traceCallStack.GetFrames())
        {
            MethodBase callStackMethod = traceStackFrame.GetMethod();

            bool methodIsFromAssemblyToIgnore = (callStackMethod.Module.Assembly == this.assemblyToIgnore);

            if (methodIsFromAssemblyToIgnore)
            {
                return true;
            }
        }

        // The assembly to ignore was not found in the call stack.
        return false;
    }


    public override void WriteLine(string message)
    {
        if (!this.TraceIsFromAssemblyToIgnore())
        {
            base.WriteLine(message);
        }
    }

    public override void Write(string message)
    {
        if (!this.TraceIsFromAssemblyToIgnore())
        {
            base.Write(message);
        }
    }
}
````

Note that you may add Filter if needed to filter out any unnecessary details. 

The custom Trace Listener may be used to log custom information and skip the logs from the Telerik.Reporting assembly. Here is sample code:

````CSharp
var reportingAssembly = Assembly.Load("Telerik.Reporting");
var listener = new CustomTraceListener(reportingAssembly, stream);
Trace.AutoFlush = true;
Trace.Listeners.Clear();
Trace.Listeners.Add(listener);
listener.WriteLine("This line should be persisted in the trace output!");

//Render the report here with the ReportProcessor and the logs from Telerik.Reporting would be skipped
````

