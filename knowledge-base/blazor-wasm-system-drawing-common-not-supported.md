---
title: Blazor WASM Project Throws System.Drawing.Common Is Not Supported
description: "Learn why Blazor WebAssembly(WASM) projects may fail with the error 'System.Drawing.Common is not supported on this platform' when hosting Telerik Reporting engine."
type: troubleshooting
page_title: System.Drawing.Common is not supported on this platform in Blazor WASM
slug: blazor-wasm-system-drawing-common-not-supported
tags: webassembly,wasm,blazor,system,drawing,common,report,error,supported
ticketid: 1590379
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

When trying to render Telerik reports programmatically with the [ReportProcessor](/api/telerik.reporting.processing.reportprocessor) in a [Blazor WebAssembly (WASM)](https://learn.microsoft.com/en-us/aspnet/core/blazor/hosting-models?view=aspnetcore-7.0#blazor-webassembly) project the following error gets thrown.

## Error Message

````
Unhandled exception rendering component: System.Drawing.Common is not supported on this platform.
System.PlatformNotSupportedException: System.Drawing.Common is not supported on this platform.
	at System.Drawing.Image..ctor()
	at System.Drawing.Bitmap..ctor(Int32 width, Int32 height)
	at BlazorApp_empty1.Pages.Index.OnButtonClick2() in D:\Program Files\Progress\Telerik Reporting R3 2022\Examples\CSharp\.NET 7\BlazorApp-empty1\Pages\Index.razor:line 32
	at Microsoft.AspNetCore.Components.EventCallbackWorkItem.InvokeAsync[Object](MulticastDelegate delegate, Object arg)
	at Microsoft.AspNetCore.Components.EventCallbackWorkItem.InvokeAsync(Object arg)
	at Microsoft.AspNetCore.Components.ComponentBase.Microsoft.AspNetCore.Components.IHandleEvent.HandleEventAsync(EventCallbackWorkItem callback, Object arg)
	at Microsoft.AspNetCore.Components.EventCallback.InvokeAsync(Object arg)
	at Microsoft.AspNetCore.Components.RenderTree.Renderer.DispatchEventAsync(UInt64 eventHandlerId, EventFieldInfo fieldInfo, EventArgs eventArgs)
````

## Cause\Possible Cause(s)

The problem relates to the fact that Blazor WASM is built on the [Mono project](https://www.mono-project.com/):

* [Will Blazor WebAssembly use Mono or .Net Core 3.1?](https://stackoverflow.com/questions/58651518/will-blazor-webassembly-use-mono-or-net-core-3-1)
* [.NET ecosystem](https://learn.microsoft.com/en-us/dotnet/core/introduction#net-ecosystem)

For that reason Blazor WASM projects don't support the System.Drawing.Common functionality as discussed in the following threads:

* [Adding system.drawing.common to a Blazor app causes the linker to fail](https://github.com/mono/mono/issues/15806)
* [blazor - captcha issue System.Drawing.Common is not supported](https://stackoverflow.com/questions/65679594/blazor-captcha-issue-system-drawing-common-is-not-supported)

## Suggested Workarounds

The ReportProcessor or the [Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) should be hosted in a different project type, for example, [Blazor Server](https://learn.microsoft.com/en-us/aspnet/core/blazor/hosting-models?view=aspnetcore-7.0#blazor-server), which supports System.Drawing.Common.

The generated reports may be displayed in the [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%}) or [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) hosted in a Blazor WebAssembly project.

## Notes

The problem will be solved when we implement the feature request described in [Future of Linux support for reporting](https://feedback.telerik.com/reporting/1537361-future-of-linux-support-for-reporting).

## See Also

* [Will Blazor WebAssembly use Mono or .Net Core 3.1?](https://stackoverflow.com/questions/58651518/will-blazor-webassembly-use-mono-or-net-core-3-1)
* [.NET ecosystem](https://learn.microsoft.com/en-us/dotnet/core/introduction#net-ecosystem)
* [Adding system.drawing.common to a Blazor app causes the linker to fail](https://github.com/mono/mono/issues/15806)
* [blazor - captcha issue System.Drawing.Common is not supported](https://stackoverflow.com/questions/65679594/blazor-captcha-issue-system-drawing-common-is-not-supported)
