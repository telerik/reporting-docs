---
title: parameter
page_title: The parameter of the HTML5 Report Viewer explained
description: "Learn what is the parameter of the Telerik Reporting HTML5 Report Viewer and what are its properties."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/parameter
tags: parameter
published: True
position: 4
previous_url: /html5-report-viewer-api-parameter
---

<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 35%;
}
table th:nth-of-type(3) {
	width: 45%;
}
</style>

# The `parameter` of the HTML5 Report Viewer

| Parameter | Type | Description |
| ------ | ------ | ------ |
| __availableValues__ |array of name-value pairs ({name: …, value: ….})|represents a list of predefined parameter values and their labels|
| __multivalue__ |boolean|specifies whether the parameter can hold more than one value|
| __allowBlank__ |boolean|specifies whether the parameter allows an empty string to be passed. Only for parameters of type string|
| __allowNull__ |boolean|specifies whether the parameter allows a <null> value to be passed from its editor|
| __autoRefresh__ |boolean|specifies whether the report viewer should auto update the report when its value has changed|
| __hasChildParameters__ |boolean|specifies whether the parameter is a cascading one (has dependencies)|
| __id__ |boolean|represents parameter’s unique identifier|
| __isVisible__ |boolean|determines whether the parameter editor is visible or not|
| __label__ |string|specifies the label for the parameter editor|
| __name__ |string|specifies the name of the parameter editor|
| __text__ |string|specifies the text for the parameter editor|
| __type__ | __telerikReportViewer.ParameterTypes__ |specifies the type of the parameter|
| __value__ |object|specifies the value of the parameter|
