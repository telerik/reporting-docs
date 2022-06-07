---
title: How to Use Async Methods in Report Event Handlers
description: How to use existing async methods in report event handlers
type: how-to
page_title: Async methods in events
slug: use-async-method-in-report-event-handler
position: 
tags: 
ticketid: 1520141
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
The report rendering is synchronous process as the items need to be rendered in order. __Async/Await__ have been introduced with C# 5.0 and .NET Framework 4.5. 
Reporting engine code targets .NET 4 and the report events are not marked as _async_. That is why it is not possible to use _await_ inside the report events.  
If you already have _async_ methods, for example, for fetching data and you want to use them as data providers for you reports, you may use the approach 
described in this article.

## Important Note
When using _async_ over a synchronous call, there is a chance for a deadlock, i.e. blocking of the UI thread. For that reason, we don't recommend this approach. 
It is preferable to re-create the _async_ methods as synchronous.

## Workaround
Use the following syntax to call your _async_ method, lets name it _MyMethodAsync_, in the report event handler or other synchronously executed code: 

```CSharp
MyMethodAsync().ConfigureAwait(false).GetAwaiter().GetResult();
```  

In the above code, _ConfigureAwait(false)_ configures the task so that continuation after the _await_ does not have to be run in the caller/UI context, therefore 
avoiding deadlocks.
When everyting runs fine and there are no exceptions, the _myTask.GetAwaiter().GetResult();_ is equivallent to _myTask.Result;_. However, with the latter apporach,
the potential exception will be wrapped in an [AggregateException](https://docs.microsoft.com/en-us/dotnet/api/system.aggregateexception?view=net-5.0), whereas 
the former approach throws the direct exception. This makes the syntax from the code snippet the most preferable with respect to deadlock prevention and error handling.
### See Also
[C#: Why you should use ConfigureAwait(false) in your library code](https://medium.com/bynder-tech/c-why-you-should-use-configureawait-false-in-your-library-code-d7837dce3d7f)  
[Task.Result Follow Task.GetAwaiter.GetResult Is () the same? How to choose?](https://developpaper.com/task-result-follow-task-getawaiter-getresult-is-the-same-how-to-choose/)
