---
title: Rendering Markdown in Telerik Reporting Templates
description: Learn how to use and render markdown content in Telerik Reporting templates by converting it to HTML.
type: how-to
page_title: Using Markdown in Telerik Reporting via HTML Conversion
meta_title: Using Markdown in Telerik Reporting via HTML Conversion
slug: rendering-markdown-in-telerik-reporting-templates
tags: reporting, htmltextbox, markdown, html, azure-devops
res_type: kb
ticketid: 1703063
---

## Environment
<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 18.2.24.924 </td>
</tr>
</tbody>
</table>

## Description

I want to use markdown content from Azure DevOps wiki pages in Telerik Reporting templates. Markdown is not directly supported in Telerik Reporting, and I need to display the content within a report template.

This knowledge base article also answers the following questions:
- How to render markdown content in Telerik Reporting?
- Can Telerik Reporting display Azure DevOps wiki content?
- How to convert markdown to HTML for use in Telerik Reporting?

## Solution

Telerik Reporting does not have native support for rendering markdown syntax directly. However, you can use the [HtmlTextBox](https://docs.telerik.com/reporting/report-items/htmltextbox/overview) report item to display HTML content, which supports a limited set of HTML tags and CSS attributes. Follow these steps:

1. Use an external markdown-to-HTML converter to transform your markdown content from Azure DevOps wiki into HTML format.
2. Pass the converted HTML content to the HtmlTextBox report item in your Telerik Reporting template.
3. Ensure that the HTML content uses only the supported tags and CSS attributes. Unsupported tags will not be rendered.

Refer to [Styling and Formatting the HtmlTextBox Report Item](https://docs.telerik.com/reporting/report-items/htmltextbox/formatting) for a list of supported HTML tags and CSS attributes.

## See Also

- [HtmlTextBox Overview - Telerik Reporting](https://docs.telerik.com/reporting/report-items/htmltextbox/overview)
- [Styling and Formatting the HtmlTextBox Report Item](https://docs.telerik.com/reporting/report-items/htmltextbox/formatting)
- [Telerik Reporting Documentation](https://docs.telerik.com/reporting) 
