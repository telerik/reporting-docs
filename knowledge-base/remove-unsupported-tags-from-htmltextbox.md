---
title: Remove unsupported tags from HtmlTextBox value
description: Edit Html text to leave only tags that can be parsed by the HtmlTextBox
type: how-to
page_title: Modify Html to include only tags supported by HtmlTextBox
slug: remove-unsupported-tags-from-htmltextbox
position: 
tags: 
ticketid: 1176084
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
HtmlTextBox does not support all the Html tags, and an error is thrown when an unsupported tag is met, as the Reporting Engine cannot process it. 
Sometimes it is necessary to render the tags that can be recognized by the HtmlTextBox and just ignore the rest of the markup. Here is how to achieve this.

## Solution
Create a custom [User Function](../expressions-user-functions) that manipulates the markup and converts it to a text that can be parsed by the HtmlTextBox.
The [HtmlFormatProvider](https://docs.telerik.com/devtools/winforms/richtexteditor/import-export/html/htmlformatprovider#using-htmlformatprovider) from Telerik UI for WinForms can be used to perform the actual conversion. Here is a sample code for the user function:  
  
```CSharp
using Telerik.WinForms.Documents.FormatProviders.Html;

namespace HtmlParser
{
    public static class ParseHtml
    {
        public static string HtmlAdapt(string markup)
        {
            HtmlExportSettings exportSettings = new HtmlExportSettings();
            exportSettings.ImageExportMode = ImageExportMode.None;
            exportSettings.StylesExportMode = StylesExportMode.Inline;
            exportSettings.DocumentExportLevel = DocumentExportLevel.Fragment;
            exportSettings.StyleRepositoryExportMode = StyleRepositoryExportMode.DontExportStyles;

            HtmlFormatProvider provider = new HtmlFormatProvider();
            provider.ExportSettings = exportSettings;
            string outputHtml = provider.Export(provider.Import(markup));

            return outputHtml;
        }
    }
}
```
It is essential to use the _HtmlExportSettings_ from the above code to receive an output that can be parsed by the HtmlTextBox.

The above user function should take as an argument the markup to be manipulated, and the returned value should be used as a Value for the HtmlTextBox :
```Xml
= HtmlParser.ParseHtml.HtmlAdapt(Fields.MarkUp)
```
_Fields.MarkUp_ should contain the markup to be converted to a value that HtmlTextBox can parse.

## Notes
The User Function should be declared either in the current report's assembly or in _AssemblyReferences_ element nodes in _Telerik.Reporting_ section of the application configuration file.

For Standalone designer the configuration file is _Telerik.ReportDesigner.exe.config_ and is typically in (_Telerik Reporting installation folder_)\Report Designer (for example _C:\Program Files (x86)\Progress\Telerik Reporting R2 2018\Report Designer_). Check also [Extending Report Designer](../standalone-report-designer-extending-configuration) article. The user function assembly and all its dependencies (see below) should be copied to the Standalone designer folder.


**Required assemblies not included in Telerik Reporting :**

(from _UI.for.WinForms.Common_ NuGet package)
- TelerikCommon.dll
- Telerik.WinControls.dll
- Telerik.WinControls.UI.dll

(from _UI.for.WinForms.RichTextEditor_ NuGet package)
- Telerik.WinControls.RichTextEditor.dll
