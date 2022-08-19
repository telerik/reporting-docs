---
title: Styling and Formatting
page_title: Styling and Formatting the HtmlTextBox Report Item
description: "Learn how to ..."
slug: htmltextbox_formatting_and_styling
tags: telerik, reporting, report, items, htmltextbox, styling, formatting, html, tags, css, attributes 
published: True
position: ...
---

# Styling and Formatting

The HtmlTextBox enables you to control the style of its text presentation by supporting a set of HTML tags and CSS attributes.  

## Supported HTML Tags

The HtmlTextBoxVarious formatting options are available to control the text presentation:

* Font, size (relative size against the font size of the item, default is 3 (1-7)), color (`<font>`)

* Bold, Italic, Underline (`<strong>`,`<b>`, `<em>`, `<i>`, `<u>`)

* Subscript, Superscript (`<sub>`,`<sup>`)

* HyperLink (`<a href target>`)

* Lists (`<ol>`, `<ul>`, `<li>`)

* Organize the text in paragraphs (`<div>`, `<span>`,`<p>`, `<br>`, `<center>`)

> TABLE and IMG tags are not supported. Instead, you must use the native Reporting [Table/List/Crrostab]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) and [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) items. A custom approach like rendering HTML as an Image with a third-party tool and using the image via PictureBox item is also supported. 


## Supported CSS attributes

You can style the text with the following CSS attributes: 

* background-color

* border, border-color, border-width, border-style

* text-align (center, left, right, justify), text-decoration (none, underline, line-through)

* text-indent (note: should be specified on a block item)

* font-family, font-size, font-weight

* padding, padding-bottom, padding-top, padding-right, padding-left

* color

> When you import text that contains HTML markup, the data is always parsed by the HtmlTextBox first. Because only a subset of HTML tags is supported, the HTML that is shown in the rendered report may differ from your original HTML. Also according to the HTML specification (and the general XML specification as well) the "&", "<" and ">" characters are considered special (markup delimiters), so they need to be encoded in order to be treated as regular text. For example the "&" character can be escaped with the "& amp;" entity. You can find more information on the subject in [this w3.org article](http://www.w3.org/TR/REC-xml/#syntax). 

Any other HTML markup tags will be ignored during report processing. If the HTML represented by the expression in the HtmlTextBox is not well formed, the HtmlTextBox would throw an exception. All HTML tags are case-insensitive. 
