---
title: Textbox Content Disappears or Gets Cut Off Inside Of a Page-Header
description:  The page sections' height cannot vary. If a textbox expands it's size beyond the section area due to large content it will be either rendered cut off or will disappear completely
type: troubleshooting
page_title: Textbox element not showing or part of text hidden in a page section
slug: text-cut-or-hidden-in-page-header
position:
tags: textbox, hidden, pageheader, page, header, expand, big text, values
ticketid: 1495964
res_type: kb
---

## Environment
<table>
    <tbody>
        <tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting 14.2.20.1021</td>
		</tr>
		<tr>
	    	<td>Project Type</td>
	    	<td>Any report with page header section</td>
	    </tr>
    </tbody>
</table>

## Description
The page header in a report can not grow or shrink and therefore can not accommodate for content expanding outside it's section-area.  For example, if a textbox has a longer string than it can fit, and the CanGrow property is set to True, the textbox will increase in size to make room for the entire string. Then, if the textbox expands below the edges of the section, either the string will be cut off, or disappear entirely.

## Steps to Reproduce
* Create a textbox and place it at the bottom of the page header
* Set its value to something that will not fit inside the textbox and therefore cause the textbox to expand and the text to wrap into a new line
* If the line-break occurs so that the new line appears below the bottom of the section, in Preview the textbox will either disappear or be cut off

## Cause\Possible Cause(s
---When the section's KeepTogether Is True:
When an element is expanding below the bottom of a page-header, first, the element will be attempted to be moved to the next page-header.
If the element can fit within the calculated size of the next page-header, it will be moved there, regardless if there is any next page. Because every page-header is based on the same section design, the element will actually never show up in any page-header.
If the element can not fit within the calculated size of the next page-header, it will remain on the original page, but with it's content cut off.

---When The Section's KeepTogether Is False:
The text will be cut off if spilling beyond the page-header area

## Suggested Workarounds
### Move content to report-header
If you need to display the content only on the first page, it can be placed inside the report header section instead, which has expanding height. This will result in the report-header to expand if the content expands
### Ensure space for expanding
Make sure the element has enough space to grow. Attempt simulating the different possibilities of the element content and make sure the element can grow to accommodate this increase in space
### Create static report-group for page-header content
Create a static report-group and use that group's header for the content instead of page header. In the static report-group the grouping is set to a constant value, which will result in the data preserving it's structure while providing functionality for automatically height-adjusting headers. The Page Functions is not available in these group headers.
Read about [how to add a group to a report](../data-items-how-to-add-groups-to-report-item) to set this up, and ensure the [PrintOnEveryPage](../p-telerik-reporting-groupsection-printoneverypage) property is set to true
