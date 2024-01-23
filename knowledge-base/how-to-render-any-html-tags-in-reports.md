---
title: How to render any HTML tags and CSS attributes in reports
description: "Learn how to render any HTML/CSS content to an image and have it displayed inside the report via the PictureBox item."
type: how-to
page_title: Display HTML in the Report as an Image.
slug: how-to-render-any-html-tags-in-reports
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
			<td>Rendering Format</td>
			<td>All Rendering Formats</td>
		</tr>
	</tbody>
</table>


## Description

A frequently asked question is *how to render HTML tags and CSS attributes that are not supported by [HtmlTextBox item]({%slug telerikreporting/designing-reports/report-structure/htmltextbox/overview%})* in reports. The most requested tags that can, currently, be display only through this article's workaround are the [img](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img) and [table](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/table) HTML tags.

The workaround that this article will demonstrate is to render the HTML/CSS content as a [Bitmap](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.bitmap?view=dotnet-plat-ext-8.0) or [Image](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.image) in an [User Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) and then have that function invoked on the [Value](/api/telerik.reporting.picturebox#Telerik_Reporting_PictureBox_Value) property of a [PictureBox item]({%slug telerikreporting/designing-reports/report-structure/picturebox%}).


## Solution  

1. Create a `.NET Framework Class Library` project - [Create a .NET class library using Visual Studio](https://learn.microsoft.com/en-us/dotnet/core/tutorials/library-with-visual-studio).
1. Install the [HtmlRenderer.WinForms](https://www.nuget.org/packages/HtmlRenderer.WinForms/) NuGet package in the project.
1. In the class library, create a `static` method that accepts the HTML string as parameters and returns an image from it using the `HtmlRenderer.WinForms` library's APIs:


	````CSharp
namespace UserFunctions
{
	public class Functions
	{
		public static System.Drawing.Image HtmlToImage(string html)
		{
			return TheArtOfDev.HtmlRenderer.WinForms.HtmlRender.RenderToImage(html);
		}
	}
}
````


1.Build the project, then copy the project assembly as well as the `HtmlRenderer.WinForms.dll` assembly from the project's `bin` folder to the folder where the Report Designer exe is located, e.g. `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer`.
1.Open the `Telerik.ReportDesigner.exe.config` file and use the [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) to add references to the Class Library project's assembly and the `HtmlRenderer.WinForms.dll` assembly:

	````XML
<Telerik.Reporting>
	<AssemblyReferences>
		<add name="UserFunctions" />
		<add name="HtmlRenderer.WinForms" />
	</AssemblyReferences>
</Telerik.Reporting>
````


1. Start the Report Designer and open/create a report, then create a [PictureBox item]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) and set the following expression as its [Value](/api/telerik.reporting.picturebox#Telerik_Reporting_PictureBox_Value):

	`= UserFunctions.Functions.HtmlToImage(HTML)`
	In place of the HTML, you can use a field that returns the HTML string, a report parameter, or it can even be written inline with quotation marks.


## Notes

To display a report that uses this approach in a separate application, the assembly of the Class Library project and the `HtmlRenderer.WinForms.dll` assembly should be referenced in the project where Reporting will be used - [Configuration for the Report Viewer/Web Report Designer]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%}#configuration-for-the-report-viewerweb-report-designer)

## See Also

* [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%})
* [HTML-Renderer GitHub repo](https://github.com/ArthurHub/HTML-Renderer)
