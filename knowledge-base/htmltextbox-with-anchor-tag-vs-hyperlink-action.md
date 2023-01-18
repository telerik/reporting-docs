---
title: HtmlTextBox with Anchor tag vs Hyperlink Action
description: HtmlTextBox with Anchor tag vs Hyperlink Action.
type: how-to
page_title: HtmlTextBox with Anchor tag vs Hyperlink Action
slug: htmltextbox-with-anchor-tag-vs-hyperlink-action
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

A frequently asked question is how to add links in documents produced by Telerik Reporting and which rendering formats will keep the link clickable.  

- The [HtmlTextBox]({%slug telerikreporting/designing-reports/report-structure/htmltextbox/overview%}) can display text-formatting HTML and CSS, including *Anchor* tags.  

- The [Hyperlink Action (NavigateToUrlAction)]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/hyperlink-action%}) is a Telerik Reporting mechanism for adding navigation to external resources via *URL*.  
  
## Solution

Telerik Reporting rendering mechanisms use native objects for the selected media.   
  
When a report is rendered in **HTML** for a web viewer, you can provide clickable links by using an *HtmlTextBox* item with **Anchor tag** in its value. The link will **not** remain clickable if you export the report in another rendering format.  
  
Our recommendation is to use a **Hyperlink Action**, which will let the item be clickable in **HTML, PDF, DOCX, XLSX, PPTX formats**.  
  
## See Also

[Design Considerations for Report Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/overview%}).  
