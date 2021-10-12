---
title: Move to Next (Previous) Page on Scrollbar Down (Up)
description: How to switch report pages in the Html5 Report Viewer with the Scrollbar in SINGLE_PAGE mode
type: how-to
page_title: Change Report Pages in the Html5 Viewer with Scrollbar
slug: move-to-next-page-with-scroll-in-html5-viewer
position: 
tags: 
ticketid: 1518799
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
			<td>HTML5 Report Viewer and all its wrappers</td>
		</tr>
	</tbody>
</table>


## Description
The [Html5 Report Viewer](../html5-report-viewer) scrolls through the report and moves to the next pages when reaching the page end in CONTINUOUS_SCROLL page mode.
If you would like to switch to the next page with the Scrollbar also in SINGLE_PAGE mode, you may follow the next approach.

## Suggested Workarounds
You may use the dedicated commands of the viewer __goToPrevPage__ and __goToNextPage__ for switching between the pages - see the 
[viewer commands](../html5-report-viewer-reportviewer-properties-commands).  
> Note that the viewer's scroll is on the element with CSS class __trv-page-container__.  

You need to be sure that the [reportViewer](../html5-report-viewer-jquery-fn-telerik-reportviewer) has already been created and the report document rendered 
so that the element with CSS class __trv-page-container__ exists. For example, you may attach an event handler for the 'scroll' event to this element in the 
[renderingEnd event of the viewer](../html5-report-viewer-reportviewer-events-renderingend). Here is the sample implementation of the event handler:  

```JavaScript
function onRenderingEnd(e, args) {
   var changedPage = false;
    $('.trv-page-container').scroll(function (e) {
        var elem = $(e.currentTarget);
        if (elem[0].scrollHeight - elem.scrollTop() - elem.outerHeight() < 1) {
            var rv = $("#reportViewer1").data("telerik_ReportViewer");
            rv.commands.goToNextPage.exec();
            changedPage = true;
        } else {
            if (!changedPage && elem.scrollTop() === 0) {
                var rv = $("#reportViewer1").data("telerik_ReportViewer");
                if (rv.currentPage() > 1) {
                    rv.commands.goToPrevPage.exec();
                }
            }
            changedPage = false;
        }
    })
}
```

## See Also
The Stackoverflow thread 
[How to check if a DIV is scrolled all the way to the bottom with jQuery](https://stackoverflow.com/questions/5828275/how-to-check-if-a-div-is-scrolled-all-the-way-to-the-bottom-with-jquery) explains how to detect when the DIV is scrolled to the bottom. 
