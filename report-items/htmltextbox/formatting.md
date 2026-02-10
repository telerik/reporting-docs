---
title: Styling and Formatting
page_title: Styling and Formatting the HtmlTextBox Report Item
description: "Learn how to control the text-presentation style of the Telerik Reporting HtmlTextBox report item, and which HTML tags and CSS attributes are supported."
slug: htmltextbox_formatting_and_styling
tags: telerik, reporting, report, items, htmltextbox, styling, formatting, html, tags, css, attributes 
published: True
position: 4
reportingArea: General
---

# Styling and Formatting HtmlTextBox

The HtmlTextBox enables you to control the style of its text presentation by supporting a set of HTML tags and CSS attributes.

## Supported HTML Tags

The following `HtmlTextBoxVarious` formatting options are available and provide control over the HtmlTextBox text presentation:

* Font, color (`<font>`), and size (relative size against the font size of the item). The default size value is `3` out of the 1-7 range.
* Bold, Italic, Underline (`<strong>`,`<b>`, `<em>`, `<i>`, and `<u>`).
* Subscript, Superscript (`<sub>` and `<sup>`).
* HyperLink (`<a href target>`).
* Lists (`<ol>`, `<ul>`, and `<li>`).
* Text organization in paragraphs (`<div>`, `<span>`,`<p>`, `<br>`, and `<center>`).
* Images (`<img>`) - for embedding inline images within HTML content.

While the HtmlTextBox does not support the `table` tag, you can use the native Telerik Reporting [Table, Crosstab, and List]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) report items instead.

## Image Support

>tip The `<img>` tag support was introduced in the 2026 Q1 release.

The HtmlTextBox supports the `<img>` tag for embedding images inline within HTML content.

### Supported `<img>` Attributes

The following HTML attributes control the image source, dimensions, and accessibility:

* `src` - Image source (supports HTTP/HTTPS URLs, file paths, base64 data URIs).
* `width` - Image width in absolute units (`px`, `cm`, `mm`, `in`, `pt`, `pc`) or percentages (relative to parent container width). Default unit is pixels if not specified.
* `height` - Image height in absolute units (`px`, `cm`, `mm`, `in`, `pt`, `pc`) or percentages (relative to parent container height). Default unit is pixels if not specified.
* `alt` - Alternative text for accessibility.

>caution Em units are not supported for `width` and `height` attributes.

### Example Usage

Basic image with dimensions and styling:

````html
<img src="https://example.com/logo.png" width="200" height="100" alt="Company Logo" style="display: block; margin: auto;" />
````

Data-driven image with embedded expressions:

````html
<img src='{Fields.ProductImage}' width="150" alt='{Fields.ProductName}' style="margin: 10px;" />
````

## Supported CSS Attributes

When you import content that contains HTML markup, the data is always parsed by the HtmlTextBox first. Because only a subset of HTML tags is supported, the HTML that is shown in the rendered report may differ from your original HTML.

Also, according to the HTML specification and the general XML specification, the `&`, `<` and `>` characters are considered as markup delimiters and you have to encode them so that they are treated as regular text. For example, you can escape the `&` character as `&amp;` entity. For more information, refer to the [w3.org article](https://www.w3.org/TR/REC-xml/#syntax).

Any other HTML markup tags will be ignored during the processing of the report. If the HTML represented by the expression in the HtmlTextBox is badly formatted, the HtmlTextBox will throw an exception. Note that all HTML tags are case-insensitive.

### Text Elements

The HtmlTextBox supports the following CSS attributes for styling text elements:

* `background-color`
* `border`, `border-color`, `border-width`, `border-style`
* `text-align` (`center`, `left`, `right`, and `justify`), `text-decoration` (`none`, `underline`, and `line-through`)
* (Specify it on a block item.) `text-indent`
* `font-family`, `font-size`, `font-weight`
* `padding`, `padding-bottom`, `padding-top`, `padding-right`, `padding-left`
* `color`

### Images

The following CSS attributes are supported for `<img>` tags:

* `margin`, `margin-top`, `margin-right`, `margin-bottom`, `margin-left` (supports `auto` for centering)
* `padding`, `padding-top`, `padding-right`, `padding-bottom`, `padding-left`
* `display` (`block`, `inline`, `inline-block`)
* `float` (`left`, `right`)
* `clear` (`left`, `right`, `both`, `none`)

## See Also

* [HtmlTextBox Class API Reference](/api/telerik.reporting.htmltextbox)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Knowledge Base Section](/knowledge-base)
