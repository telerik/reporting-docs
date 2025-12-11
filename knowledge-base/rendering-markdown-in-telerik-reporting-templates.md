---
title: Use Markdown in Telerik Reporting
description: "Learn how to use and render markdown content in Telerik Reporting by converting it to HTML, which can be displayed via the HtmlTextBox item."
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
  </tbody>
</table>

## Description

I want to use [Markdown](https://en.wikipedia.org/wiki/Markdown) content from Azure DevOps wiki pages in Telerik reports. Markdown is not directly supported in Telerik Reporting, and I need a way to display the content within the report somehow.

## Solution

Telerik Reporting does not have native support for rendering markdown syntax directly. However, you can use the [HtmlTextBox]({%slug telerikreporting/designing-reports/report-structure/htmltextbox/overview%}) report item to display HTML content, which supports a limited set of HTML tags and CSS attributes. Follow these steps:

### Externally Convert to HTML 

1. Use an external MD -> HTML converter(e.g. [Convert Markdown to HTML](https://markdowntohtml.com/)) to transform the `MD` content into `HTML`.
1. Pass the converted HTML content to the [HtmlTextBox]({%slug telerikreporting/designing-reports/report-structure/htmltextbox/overview%}) report item in your Telerik report.
1. Ensure that the HTML content uses only the [supported HTML tags and CSS attributes]({%slug htmltextbox_formatting_and_styling%}).

### Convert to HTML via User Functions

If the `MD` content cannot be converted to `HTML` beforehand, create a [User Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) that accepts the Markdown input and returns the corresponding HTML output. You may refer to the sample code below as a guideline.

> To use the `Markdown.ToHtml` function, install the following NuGet package in the project with the user function - [Markdig](https://www.nuget.org/packages/Markdig/0.44.0?_src=template)

````C#
namespace UserFunc
{
    public class Class1
    {
        public static string ConvertMarkdownToHtml(string markdown)
        {
            if (string.IsNullOrEmpty(markdown))
                return string.Empty;

            return Markdown.ToHtml(markdown);
        }
  
````

- Input:

````
# Hello World

This is a **bold** statement and this is *italic*.

## Features

- Item 1
- Item 2
- Item 3

Visit [Google](https://google.com) for more info.

> This is a blockquote.

---

Done!
````

- Output:

<h1>Hello World</h1>
<p>This is a <strong>bold</strong> statement and this is <em>italic</em>.</p>
<h2>Features</h2>
<ul>
<li>Item 1</li>
<li>Item 2</li>
<li>Item 3</li>
</ul>
<p>Visit <a href="https://google.com">Google</a> for more info.</p>
<blockquote>
<p>This is a blockquote.</p>
</blockquote>
<hr />
<p>Done!</p>
````

## See Also

* [HtmlTextBox Overview]({%slug telerikreporting/designing-reports/report-structure/htmltextbox/overview%})
* [Styling and Formatting the HtmlTextBox Report Item]({%slug htmltextbox_formatting_and_styling%})
