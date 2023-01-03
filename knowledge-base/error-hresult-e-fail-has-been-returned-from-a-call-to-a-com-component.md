---
title: Error 'HRESULT E_FAIL has been returned from a call to a COM component'
description: Error 'HRESULT E_FAIL has been returned from a call to a COM component' after opening report containing subreport item
type: troubleshooting
page_title: Error 'HRESULT E_FAIL has been returned from a call to a COM component'
slug: error-hresult-e-fail-has-been-returned-from-a-call-to-a-com-component
position: 
tags: SubReport
ticketid: 1341357
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Designer</td>
		<td>Visual Studio Report Designer</td>
	</tr>
</table>

## Description
Reports that contain [subreport item]({%slug telerikreporting/designing-reports/report-structure/subreport%}) are failing to open in Visual Studio Report Designer.

## Steps to Reproduce

1. Create new report in Visual Studio through the item template
2. Add a SubReport item
3. Set ReportSource property of the sub report using the *Object Instance* option
4. Save the report and close the designer window
5. Re-open the report
6. The below error message is thrown

## Error Message

`Error 'HRESULT E_FAIL has been returned from a call to a COM component'`

Stack Trace:

````
Instances of this error (1)
 
at System.Runtime.InteropServices.Marshal.ThrowExceptionForHRInternal(Int32 errorCode, IntPtr errorInfo)
at Microsoft.VisualStudio.LanguageServices.Implementation.Utilities.Exceptions.ThrowEFail()
at Microsoft.VisualStudio.LanguageServices.Implementation.CodeModel.CodeTypeRef.LookupTypeSymbol()
at Microsoft.VisualStudio.LanguageServices.Implementation.CodeModel.CodeTypeRef.get_TypeKind()
at EnvDTE.CodeTypeRef.get_TypeKind()
at Microsoft.VisualStudio.Design.Serialization.CodeDom.VSCodeDomParser.GetUrtTypeFromVsType(CodeTypeRef vsType)
at Microsoft.VisualStudio.Design.Serialization.CodeDom.VSCodeDomParser.OnTypePopulateMembers(Object sender, EventArgs e)
at System.CodeDom.CodeTypeDeclaration.get_Members()
at Microsoft.VisualStudio.Design.Serialization.CodeDom.MergedCodeDomParser.CodeTypeDeclarationPopulator.OnPopulateMembers(Object sender, EventArgs e)
at System.CodeDom.CodeTypeDeclaration.get_Members()
at System.ComponentModel.Design.Serialization.TypeCodeDomSerializer.Deserialize(IDesignerSerializationManager manager, CodeTypeDeclaration declaration)
at System.ComponentModel.Design.Serialization.CodeDomDesignerLoader.PerformLoad(IDesignerSerializationManager manager)
at Microsoft.VisualStudio.Design.Serialization.CodeDom.VSCodeDomDesignerLoader.PerformLoad(IDesignerSerializationManager serializationManager)
at Microsoft.VisualStudio.Design.Serialization.CodeDom.VSCodeDomDesignerLoader.DeferredLoadHandler.Microsoft.VisualStudio.TextManager.Interop.IVsTextBufferDataEvents.OnLoadCompleted(Int32 fReload)
````

## Cause\Possible Cause(s)

Using **"Object instance"** when choosing a source for sub report, is a legacy approach. It would create an instance of each sub report in the main report's list of elements *(which is not best practice for multiple subreports approach)*.

## Solution

Our recommendation is to use the **"Type name"** option for .NET type report definitions (.CS or .VB files).

## See Also

* [Set ReportSource for SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%}#setting-the-report-source)
