---
title: Resize the HTML5 Report Viewer to accommodate its content
description: Resize the HTML5 Report Viewer to accommodate its content.
type: how-to
page_title: Resize the HTML5 Report Viewer to accommodate its content
slug: resize-the-html5-report-viewer-to-accommodate-its-content
res_type: kb
---

## Description 
  
When the report page displayed in the HTML5 Report Viewer is too long, a vertical scrollbar appears inside the viewer. This behavior aids in viewer-exclusive webpages, but may not look perfect in more complex user applications which might have their own containers with scrollbars, or even a scrollbar appearing in the browser. Multiple scrollbars inside a single webpage may deteriorate the overall user experience.  
  
## Solution   
  
The default behavior of the viewer can be changed so the viewer is resized automatically in order to accommodate the currently displayed report page. To achieve that follow these steps:  
  

1. **Remove** the default report viewer container styles if they are present in your application:  

```css
#reportViewer1 {
    position: absolute;
    left: 5px;
    right: 5px;
    top: 40px;
    bottom: 5px;
    overflow: hidden;
    clear: both;
}
```

2. Add the following styles to the page:  

```css
.trv-report-viewer div.trv-content-wrapper,
.trv-pages-area,
.trv-pages-area .trv-page-container {
    position: static !important;
}
 
.trv-pages-area .trv-error-pane {
    position: absolute !important;
    float: none;
    z-index: 1;
    top: 0;
}
 
.trv-page-wrapper {
    /* Uncomment to add initial minimum height to the viewer */
    /* min-height: 200px; */
}
 
.trv-side-menu {
    z-index: 1;
    left: -14em;
}
```

3. Subscribe to the viewer's **updateUi** event and set the pages area style dynamically:
    
```js
$(document).ready(function () {
    $("#reportViewer1")
        .telerik_ReportViewer({
            serviceUrl: "api/reports/",
            reportSource: {
                report: "Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary"
            },
            // Set the pages area margins to achieve responsive size when toggling the Document Map and Parameters Area on/off.
            updateUi: function (e) {
                var rv = e.data.sender;
                updatePagesAreaMargin(rv.commands.toggleDocumentMap.checked(), "margin-left");
                updatePagesAreaMargin(rv.commands.toggleParametersArea.checked(), "margin-right");
            }
        });
});
``` 
Where the **updatePagesAreaMargin** function definition is:
    
```js
function updatePagesAreaMargin(condition, marginType) {
    if (condition) {
        $(".trv-pages-area").css(marginType, "15em");
    }
    else {
        $(".trv-pages-area").css(marginType, "0em");
    }
}
```
  
> **Browser support**
> <br>
> Google Chrome 58+, Mozilla Firefox 47+, Microsoft Edge.
