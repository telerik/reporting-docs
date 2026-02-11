---
title: Known Limitations
page_title: Limitations of the HtmlTextBox Report Item
description: "Learn more about the considerations and familiarize with the known limitations of the Telerik Reporting HtmlTextBox report item."
slug: htmltextbox_known_limitations
tags: telerik, reporting, report, items, htmltextbox, considerations, known, limitations
published: True
position: 20
reportingArea: General
---

# Known Limitations of the HtmlTextBox

When working with the Telerik Reporting HtmlTextBox report item, note the following design considerations and known limitations.

* The HtmlTextBox respects only inline styles.
* The HtmlTextBox works with text-formatting options and images (using the `<img>` tag).
* The HtmlTextbox is rendered as plain text with no formatting in Excel. Images are not displayed in Excel exports.
* The HtmlTextBox doesn't support RTL (Right-to-Left) rendering.
* The HyperLink HTML tag (`<a>`) is interactive (acts as an actual hyperlink) only under an HTML rendering extension.

	To add links in PDF, XLSX, DOCX, and PPTX files, and HTML, XAML, and IMAGE renderings for the different Report Viewers, use a [hyperlink action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/hyperlink-action%}).

For more information about all limitations of the HtmlTextBox in specific export formats, refer to the articles in the section on [design considerations for report rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/overview%}).

## See Also

* [HtmlTextBox Class API Reference](/api/telerik.reporting.htmltextbox)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Knowledge Base Section](/knowledge-base)
