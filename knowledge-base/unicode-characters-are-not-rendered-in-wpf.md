---
title: Unicode characters are not rendered in WPF
description: Reports display an 'Operation was canceled' message when rendered in the WPF report viewer
type: troubleshooting
page_title: System.ArgumentException hexadecimal value, is an invalid character
slug: unicode-characters-are-not-rendered-in-wpf
position: 
tags: WPF, XAML
ticketid: 1560165
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
			<td>Report Viewer</td>
			<td>WPF</td>
		</tr>
	</tbody>
</table>


## Description

Using the WPF report viewer to display a report that uses odd unicode characters result in the report not rendering and instead, the _'Operation was canceled.'_ error message is displayed inside the report viewer.

## Error Message

- In the report viewer:

````
Operation was canceled.
````

- In the output:

````
ReportViewer Error: 0 : System.ArgumentException: 'character', hexadecimal value 0x10, is an invalid character.
   at System.Xml.XmlUtf8RawTextWriter.InvalidXmlChar(Int32 ch, Byte* pDst, Boolean entitize)
   at System.Xml.XmlUtf8RawTextWriter.WriteAttributeTextBlock(Char* pSrc, Char* pSrcEnd)
   at System.Xml.XmlUtf8RawTextWriter.WriteString(String text)
   at System.Xml.XmlRawWriter.WriteValue(String value)
   at System.Xml.XmlWellFormedWriter.WriteValue(String value)
   at Telerik.Reporting.XamlRendering.DocumentModel.XmlWriting.RenderElement.WriteContent(String text)
   at Telerik.Reporting.XamlRendering.DocumentModel.XmlWriting.RenderElement.WriteAttribute(String name, String text)
   at Telerik.Reporting.XamlRendering.DocumentModel.XmlWriting.TextElement.WriteText(String text)
   at Telerik.Reporting.XamlRendering.DocumentWriting.Primitives.TextBuilder.WriteTextSettings(ITextElement textElement)
   at Telerik.Reporting.XamlRendering.DocumentWriting.Primitives.TextBuilder.WriteText()
   at Telerik.Reporting.XamlRendering.DocumentWriting.TextItemWriter.WriteContent(LayoutElement element, ElementPageInfo pageInfo, Boolean isOverlapped)
   at Telerik.Reporting.XamlRendering.XamlWriter.WriteStartElement(LayoutElement element, ElementPageInfo pageInfo)
   at Telerik.Reporting.BaseRendering.PageHandler.Telerik.Reporting.Paging.IPageHandler.StartElement(LayoutElement element, ElementPageInfo info)
   at Telerik.Reporting.Paging.PageStartElement.OutputToPage(IPageHandler handler)
   at Telerik.Reporting.Paging.PageElementsLayer.OutputToPage(IPageHandler handler)
   at Telerik.Reporting.Paging.PageContent.Output(IPageHandler handler)
   at Telerik.Reporting.Paging.PageCompositionBase.OutputPageContent(Stopwatch stopwatchOutputContent, PageContent pageContent)
   at Telerik.Reporting.Paging.PageCompositionBase.<>c__DisplayClass124_0.<CreatePageContentOutputTask>b__0()
The thread 0x5cf0 has exited with code 0 (0x0).
An error has occurred while rendering the report: System.OperationCanceledException: The operation was canceled.
   at System.Threading.CancellationToken.ThrowOperationCanceledException()
   at System.Threading.ManualResetEventSlim.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.SpinThenBlockingWait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.InternalWaitCore(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.Wait(CancellationToken cancellationToken)
   at Telerik.Reporting.Paging.PageCompositionBase.SeparateThreadOutputBehavior.Finish()
   at Telerik.Reporting.Paging.PageCompositionBase.CreatePages()
   at Telerik.Reporting.Paging.PagerBase.Telerik.Reporting.Paging.IPager.CreatePages(IPageHandler handler, LayoutElement root)
   at Telerik.Reporting.BaseRendering.RenderingExtensionBase.Render(LayoutElement root, Hashtable renderingContext, Hashtable deviceInfo, CreateStream createStreamCallback, EvaluateHeaderFooterExpressions evalHeaderFooterCallback, PageSettings pageSettings)
````

## Cause\Possible Cause(s)

WPF applications use XAML, which is a declarative XML-based markup language. Hence, it is prone to all restrictions that the XML should obey.
The symbol that you are trying to render in the report is not allowed in XML, which causes the observed error.

## Solution

The solution is to modify the incoming data for the report items so that they do not contain invalid (in the context of XML) symbols.
This may be done through a [User Function]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions %}) that validates the data, for example:

````C#
public static string ReplaceHexadecimalSymbols(string txt)
{
    string r = "[\x00-\x08\x0B\x0C\x0E-\x1F\x26]";
    return Regex.Replace(txt, r,"",RegexOptions.Compiled);
}
````

## See Also

* [hexadecimal value 0x12, is an invalid character](https://stackoverflow.com/questions/21053138/c-sharp-hexadecimal-value-0x12-is-an-invalid-character)
