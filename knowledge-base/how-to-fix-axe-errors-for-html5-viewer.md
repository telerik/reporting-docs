---
title: How to fix Axe accessibility violations of HTML5 report viewer
description: How to fix errors reported by Axe on the page that contains HTML5 report viewer
type: how-to
page_title: Fix Axe Accessibility Violations of HTML5 Report Viewer
slug: how-to-fix-axe-errors-for-html5-viewer
position: 
tags: accessibility,html5reportviewer
ticketid: 1451834
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product Version</td>
	    	<td>11.2.17.913 or higher</td>
	    </tr>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
    </tbody>
</table>


## Description
[Axe web accessibility testing tool](https://www.deque.com/axe/) might report violations and warnings related to HTML5 Report Viewer and the content of the report.

When providing accessibility for the report viewer we were guided by [Section 508 of the Rehabilitation Act](http://www.section508.gov/), 
[Web Content Accessibility Guidelines (WCAG) 2.0](https://www.w3.org/TR/WCAG20/), and the standards set by [WAI-ARIA](https://www.w3.org/TR/wai-aria-practices/). 
The implemented approach was tested using [Microsoft Narrator](https://en.wikipedia.org/wiki/Microsoft_Narrator) and [JAWS](https://www.freedomscientific.com/products/software/jaws/)
screen readers.

As there is no specific stardard for implementing the accessibility for web applications some of the accessibility testing tools might 
have additional guidelines for implementing accessibility which are not respected by HTML5 Report Viewer.

## Error Messages

Most frequent error messages you might see when analyzing the report viewer with Axe are:

Elements should not have tabindex greater than zero

Certain ARIA roles must contain particular children

Elements must have sufficient color contrast


## Solution

In Telerik Reporting R3 2017 (version 11.2.17.913) we introduced HTML5 Report Viewer accessibility affecting both the viewer controls 
and the report content. The accessibility features are enabled or disabled using *enableAccessibility* option of the viewer
(its default value is false).

As a first step, make sure that accessibility is enabled for the viewer as this step will help to eliminate most of the reported
warnings and violations:

```JavaScript
$("#reportViewer1")
                .telerik_ReportViewer({
                        enableAccessibility: true,
```

Below are the solutions to eliminate the remaining violations reported by Axe.

*Elements should not have tabindex greater than zero*

The tabindex is used in the viewer's HTML template to keep the following order of the visible targets: Menu, DocumentMap, Parameters Area, Search dialog, Send Email dialog. Additionally, in the report content a tabindex is assigned to each report item where the tabindex corresponds to the order of the items in the report's design.

However, having a tabindex greater than zero is considered as a violation form Axe. The viewer can comply with this requirement by having all tabindex attributes set to 0. Changing the value of all tabindex attributes 
can be achieved using *pageReady()* event of the viewer:

```JavaScript
pageReady: function (e, args) {
                        $("[tabindex]").attr("tabindex", "0");
                    }
```

*Certain ARIA roles must contain particular children*

The viewer renders [Document Map element](../designing-reports-document-map) with data-role="treeview" attribute. When the Document Map 
has no items the parent element will still be rendered but without the treeitem nodes. This is treated as a violation by the Axe. 
The solution is to [add an item to the DocumentMap](../designing-reports-interactivity-how-to-add-document-map) so the treeitem node 
is appended to the treeview parent in the viewer.

The DocumentMap is visible by default on the initial rendering of the viewer. To hide it, you can set *documentMapVisible*
option of the viewer to *false*:

```JavaScript
$("#reportViewer1")
                .telerik_ReportViewer({
                          documentMapVisible: false
```

This erros can be also fixed by removing the ARIA role of the document map element (role="navigation") from the viewer's HTML template.


*Elements must have sufficient color contrast*

This warning can be fixed by applying High Contrast Kendo UI theme, for example:

```html
<link href="https://kendo.cdn.telerik.com/2020.1.114/styles/kendo.highcontrast.min.css" rel="stylesheet" id="skin-css" />
```

After applying the theme, there still might be warnings about insufficient color contrast related to the content of the report itself. 
They can be fixed by applying high contrast colors to the report elements in the report designer.

### See Also

[Accessibility](../html5-report-viewers-accessibility-support)

[HTML5 Report Viewer options](../html5-report-viewer-jquery-fn-telerik-reportviewer)



