---
title: Styling Tooltips in HTML5-based Report Viewers 
description: How to show Tooltops in HTML5 Report Viewer in different ways.
type: how-to
page_title: Create Custom Tooltips for the HTML5-based Report Viewers 
slug: styling-tooltips-in-html5-based-report-viewers
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Web Application</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5 Report Viewer</td>
	</tr>
</table>

## Description

Showing tooltips in a webpage is a very common task and there are lots of solutions for any magnitude of complexity. In our HTML5 report viewer, we decided to use another widget from the [KendoUI](https://www.telerik.com/kendo-ui) library – [KendoUI Tooltip](http://demos.telerik.com/kendo-ui/tooltip/index). In this article, we will demonstrate some ways to control its properties and style its appearance.

## Solution

### Styling the tooltips using the report viewer template    

  - The HTML5 report viewer markup is provided using [a template file](../html5-report-viewer-template), which is obtained through a [Telerik Reporting REST service instance](../telerik-reporting-rest-conception). If you want to modify the template file, you need to copy it from *{Telerik Reporting installation directory}\Html5\ReportViewer\templates* folder to your project and reference it in your report viewer initialization script as shown below:

```html
<script type="text/javascript">

$(document).ready(function () {
 $("#reportViewer1")
.telerik_ReportViewer({
…,
templateUrl: 'ReportViewer/templates/telerikReportViewerTemplate.html',…,
   });
});

</script>
```    
   
   - KendoUI Tooltip’s content can accept valid HTML and we provide this content using the template. The template ID is “*trv-pages-area-kendo-tooltip*” and it consists of three **div** elements – the first one is a *container* for the other two that are used for the*title* and the *text* respectively: 
 

```html
<template id="trv-pages-area-kendo-tooltip">
    <div class="trv-pages-area-kendo-tooltip">
        <div class="trv-pages-area-kendo-tooltip-title"></div>
        <div class="trv-pages-area-kendo-tooltip-text"></div>
    </div>
</template>
```
    
   - The styling of each of the div elements can be controlled by its CSS class. The **.css** file that contains the styling is named **telerikReportViewer.css** and, similar to the report viewer template file, can be found at *{Telerik Reporting installation directory}\Html5\ReportViewer\styles* folder.  It provides some very basic styling for the tooltip:

```css
.trv-pages-area-kendo-tooltip {
  font-size: 0.7em;
}

.trv-pages-area-kendo-tooltip-title {
  font-weight: bold;
}

.trv-pages-area-kendo-tooltip-text {
  font-weight: normal;
}
```
    
You can apply your preferred CSS-styling here and it will affect all the tooltips displayed in the report viewer.
    
 - If you modify the CSS, you should update the template CSS link to point to the modified CSS file:
 
```html
<link href="styles/my-telerikReportViewer.css" rel="stylesheet" />
``` 
Otherwise you should specify the tooltips styles as shown below:

### Styling the tooltips at runtime using the template CSS-classes   

You can provide styling for the tooltips in the **html**/**cshtml** page of your application – usually where you declare the report viewer definition. In the &lt;style&gt; section of your page you can address any of the CSS classes we mentioned before:
   
```html
<style>
…

.trv-pages-area-kendo-tooltip {
    background: DarkSeaGreen!important;
}
 
.trv-pages-area-kendo-tooltip-text {
    font-style: italic;
}
</style>
```   

### Create your own tooltips    

In case you need a custom solution for your tooltips, you can create your own ones, using the information provided in the **data-tooltip** attributes of the report viewer content. In the following example we will show you how to create tooltips using [jQueryUI Tooltip](https://jqueryui.com/tooltip/) widget:
    
 - First, declare the __jQuery UI__ library and the corresponding __CSS Styles__ in your **html** page. Here is a link to a CDN source:

```html
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
```

If the above links become non-functional, consider replacing them with working ones. Here is a link to the [jQuery UI – Releases](https://releases.jquery.com/ui/).

 - Then you need to subscribe to an appropriate event that will be raised from the report viewer. In this case the [pageReady()](../html5-report-viewer-reportviewer-events-pageready) event is suitable, because all the content will be ready and we can select the report items by their data-tooltip attributes. We’ll also add a handler to the [viewerToolTipOpening()](../html5-report-viewer-reportviewer-events-viewertooltipopening) event and explain its usage later:
    
```html
<script type="text/javascript">
$(document).ready(function () {

 $("#reportViewer1").telerik_ReportViewer({
…,

viewerToolTipOpening: onToolTipOpening,
pageReady: onPageReady,
   });
});
</script>
```

- In the **onPageReady()** event we’ll select all the elements that have either set tooltip title or text and create a new instance of jQuery Tooltip for each one of them:
    
```js
function onPageReady(e, args) { 
         var selector = "[data-tooltip-title],[data-tooltip-text]";
         $(selector).each(function (i) {
 
                 var $this = $(this);
                 var title = $this.attr("data-tooltip-title");
                 var text = $this.attr("data-tooltip-text");
 
                 $this.tooltip({
                         items: selector,
                          content: title + "<br />" + text,
                          position: {
                                   my: "left top",
                                   at: "center bottom"
                          }
                 });
         });
}
```

- Additionally, we need to cancel the appearance of the default KendoUI tooltips when hovering over an item. We’ll use the viewerToolTipOpening() handler we declared earlier, because it provides a **cancel** flag:
    
```js
function onToolTipOpening(e, args) {
         if (args) {
                 args.cancel = true;
         }
}
```

- Depending on the position of your report viewer, you may have to set the tooltips position to **absolute** in the &lt;style&gt; section of your **html** page:
    
```css
.ui-tooltip {
         position: absolute;
}
```

When you run your application you should see that the default tooltips are replaced by the ones provided by the jQuery library.
