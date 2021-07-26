---
title: HtmlTextBox with Anchor tag vs Hyperlink Action
description: HtmlTextBox with Anchor tag vs Hyperlink Action.
type: how-to
page_title: HtmlTextBox with Anchor tag vs Hyperlink Action
slug: htmltextbox-with-anchor-tag-vs-hyperlink-action
res_type: kb
---

## Description

A frequently asked question is how to add links in documents produced by Telerik Reporting and which rendering formats will keep the link clickable.  

- The [HtmlTextBox](../report-items-html-text-box) can display text-formatting HTML and CSS, including *Anchor* tags.  

- The [Hyperlink Action (NavigateToUrlAction)](../designing-reports-interactivity-hyperlinks) is a Telerik Reporting mechanism for adding navigation to external resources via *URL*.  
  
## Solution

Telerik Reporting rendering mechanisms use native objects for the selected media.   
  
When a report is rendered in **HTML** for a web viewer, you can provide clickable links by using an *HtmlTextBox* item with **Anchor tag** in its value. The link will **not** remain clickable if you export in other format.  
  
Our recommendation is to use a **Hyperlink Action**, which will let the item be clickable in **HTML, PDF, DOCX, XLSX, PPTX formats**.  
  
## See Also

[Design Considerations for Report Rendering](../designing-reports-considerations-overview).  
