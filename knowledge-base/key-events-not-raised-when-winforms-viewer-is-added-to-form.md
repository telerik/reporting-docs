---
title: Key Events Not Raised When WinForms Report Viewer is Added to Form
description: "Learn how to propagate the key events from the WinForms Report Viewer to the Form or Telerik RadForm that hosts the viewer."
type: how-to
page_title: WinForms Report Viewer doesn't raise Key Events
slug: key-events-not-raised-when-winforms-viewer-is-added-to-form
position: 
tags: 
ticketid: 1608058
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
			<td>Operating System</td>
			<td>Windows</td>
		</tr>
		<tr>
			<td>.Net Framework</td>
			<td>Version 4+</td>
		</tr>
	</tbody>
</table>


## Description

I have a blank RadForm. In the `KeyDown` event I am able to detect `Ctrl-S`. As soon as I place a [WinForms ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) on the Form, I am not longer able to detect `Ctrl-S`. I have tried both the Form `KeyDown` event and the ReportViewer `KeyDown` event.

How do I detect when the user presses the `Ctrl-S` key combination after the ReportViewer is added to the Form?

## Solution

The `KeyDown` or other _Key_ and _Mouse_ events cannot be handled from the _WinForms ReportViewer_ as they are raised by the [Class `WinViewer`](/api/telerik.reportviewer.winforms.winviewer).

You may handle it from the RadForm or Form after setting the [`KeyPreview` property of the Form](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.form.keypreview?view=netframework-4.8) to `True`.

The other workaround that you may use even without changing the above property, is to override the [`ProcessCmdKey` method](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.form.processcmdkey?view=netframework-4.8) as shown below:

````CSharp
protected override bool ProcessCmdKey(ref Message msg, Keys keyData)
{
	if(keyData == (Keys.S | Keys.Control)) 
	{ 
		//do my job
	}

	return base.ProcessCmdKey(ref msg, keyData);
}
````
````VB.NET
Protected Overrides Function ProcessCmdKey(ByRef msg As Message, keyData As Keys) As Boolean
	If (keyData = (Keys.S Or Keys.Control)) Then
		'do my job
	End If

	Return MyBase.ProcessCmdKey(msg, keyData)
End Function
````

## See Also

* [Windows Forms Application Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})
* [Form.KeyPreview Property](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.form.keypreview?view=netframework-4.8)
* [Form.ProcessCmdKey(Message, Keys) Method](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.form.processcmdkey?view=netframework-4.8)
