---
title: parameterEditorFactory
page_title: parameterEditorFactory of the HTML5 Report Viewer explained
description: "Learn what the parameterEditorFactory of the Telerik Reporting HTML5 Report Viewer does and how to use it."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/parametereditorfactory
tags: parametereditorfactory
published: True
reporting_area: HTML5
position: 5
previous_url: /html5-report-viewer-api-parametereditorfactory
---

<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 10%;
}
table th:nth-of-type(3) {
	width: 70%;
}
</style>

# The `parameterEditorFactory` of the HTML5 Report Viewer

| Parameter | Type | Description |
| ------ | ------ | ------ |
| __match(parameter)__ |boolean|determines whether the editor is suitable for the passed parameter<ul><li>__parameter__</li></ul>|
| __createEditor(placeholder, options)__ |parameterEditor|adds the root html element for the editor, and holds the logic for calling the paramerChanged callback. Returns a _parameterEditor_ object<ul><li>__placeholder__, this is the HTML element which the parameter editor UI is appended to</li><li>__options__:<ul><li>__parameterChanged__: function(parameter, value), a callback function which should be called when the parameter’s value has been changed<ul><li>__parameter__, the instance of the currently edited parameter</li><li>__value__, the new parameter value</li></ul></li></ul></li></ul>|

A sample implementation may be seen in the article [How to Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%}).

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
