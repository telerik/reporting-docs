---
title: NullReferenceException 'Object reference not set to an instance of an object.' when you load and unload the WPF ReportViewer control from Visual Tree.
description: NullReferenceException "Object reference not set to an instance of an object." when you load and unload the WPF ReportViewer control from visual tree. 
type: how-to
page_title: NullReferenceException "Object reference not set to an instance of an object." when you load and unload the WPF ReportViewer control from visual tree
slug: nullreferenceexception-object-reference-not-set-to-an-instance-of-an-object.-when-you-load-and-unload-the-wpf-reportviewer-control-from-visual-tree
res_type: kb
---  

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
    	<tr>
			<td>Version</td>
			<td>R1 2017</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>WPF</td>
		</tr>
	</tbody>
</table>
  
## Description

The error is thrown when you load and unload the WPF ReportViewer control from visual tree e.g., on switching between tabs of a *TabControl* or docking and undocking panes of a Docking control.  
  
## Cause  

In **Telerik Reporting R1 2017** we changed the way the WPF ReportViewer control's model is handled. The model was released too early in some cases as when the viewer control is used in a control like TabControl or Docking control.  
  
## Error Message

```
Object reference not set to an instance of an object.
   at Telerik.ReportViewer.Wpf.ReportViewer.DetachModelEventHandlers()
   at Telerik.ReportViewer.Wpf.ReportViewer.OnUnloaded(Object sender, RoutedEventArgs e)
   at System.Windows.RoutedEventHandlerInfo.InvokeHandler(Object target, RoutedEventArgs routedEventArgs)
   at System.Windows.EventRoute.InvokeHandlersImpl(Object source, RoutedEventArgs args, Boolean reRaised)
   at System.Windows.UIElement.RaiseEventImpl(DependencyObject sender, RoutedEventArgs args)
   at System.Windows.UIElement.RaiseEvent(RoutedEventArgs e)
   at System.Windows.BroadcastEventHelper.BroadcastEvent(DependencyObject root, RoutedEvent routedEvent)
   at System.Windows.BroadcastEventHelper.BroadcastUnloadedEvent(Object root)
   at MS.Internal.LoadedOrUnloadedOperation.DoWork()
   at System.Windows.Media.MediaContext.FireLoadedPendingCallbacks()
   at System.Windows.Media.MediaContext.FireInvokeOnRenderCallbacks()
   at System.Windows.Media.MediaContext.RenderMessageHandlerCore(Object resizedCompositionTarget)
   at System.Windows.Media.MediaContext.RenderMessageHandler(Object resizedCompositionTarget)
   at System.Windows.Threading.ExceptionWrapper.InternalRealCall(Delegate callback, Object args, Int32 numArgs)
   at System.Windows.Threading.ExceptionWrapper.TryCatchWhen(Object source, Delegate callback, Object args, Int32 numArgs, Delegate catchHandler)
   at System.Windows.Threading.DispatcherOperation.InvokeImpl()
   at System.Windows.Threading.DispatcherOperation.InvokeInSecurityContext(Object state)
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state, Boolean preserveSyncCtx)
   at System.Threading.ExecutionContext.Run(ExecutionContext executionContext, ContextCallback callback, Object state, Boolean preserveSyncCtx)
   at System.Threading.ExecutionContext.Run(ExecutionContext executionContext, ContextCallback callback, Object state)
   at MS.Internal.CulturePreservingExecutionContext.Run(CulturePreservingExecutionContext executionContext, ContextCallback callback, Object state)
   at System.Windows.Threading.DispatcherOperation.Invoke()
   at System.Windows.Threading.Dispatcher.ProcessQueue()
   at System.Windows.Threading.Dispatcher.WndProcHook(IntPtr hwnd, Int32 msg, IntPtr wParam, IntPtr lParam, Boolean& handled)
   at MS.Win32.HwndWrapper.WndProc(IntPtr hwnd, Int32 msg, IntPtr wParam, IntPtr lParam, Boolean& handled)
   at MS.Win32.HwndSubclass.DispatcherCallbackOperation(Object o)
   at System.Windows.Threading.ExceptionWrapper.InternalRealCall(Delegate callback, Object args, Int32 numArgs)
   at System.Windows.Threading.ExceptionWrapper.TryCatchWhen(Object source, Delegate callback, Object args, Int32 numArgs, Delegate catchHandler)
   at System.Windows.Threading.Dispatcher.LegacyInvokeImpl(DispatcherPriority priority, TimeSpan timeout, Delegate method, Object args, Int32 numArgs)
   at MS.Win32.HwndSubclass.SubclassWndProc(IntPtr hwnd, Int32 msg, IntPtr wParam, IntPtr lParam)
   at MS.Win32.UnsafeNativeMethods.DispatchMessage(MSG& msg)
   at System.Windows.Threading.Dispatcher.PushFrameImpl(DispatcherFrame frame)
   at System.Windows.Threading.Dispatcher.PushFrame(DispatcherFrame frame)
   at System.Windows.Application.RunDispatcher(Object ignore)
   at System.Windows.Application.RunInternal(Window window)
   at System.Windows.Application.Run(Window window)
   at System.Windows.Application.Run()
```

## Solution

> A fix is provided in **Telerik Reporting R1 2017 SP2 version 11.0.17.406** and newer releases. 

If you need to upgrade, MSI files for installing Telerik Reporting can be found in[your Telerik account](/account/)- Downloads - Reporting - MSI.  
 
For more details, check [Installing Telerik Reporting](../installation-installing-from-msi) and the changes mentioned in the corresponding [Upgrade Path](../upgradepathoverview) article.
