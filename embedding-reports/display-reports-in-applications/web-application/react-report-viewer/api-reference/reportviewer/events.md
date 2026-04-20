---
title: Events
page_title: Events of the React Report Viewer
description: Complete list of events available in the React Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events
tags: events
published: True
reportingArea: React
position: 4
---

# Events of the React Report Viewer

> The report viewer exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods%}#bind) method.

## error

Called when an error occurs. Receives two parameters: `e` (the event object) and `args` (a string containing the error message).

### Example

{% raw %}
```JavaScript
// Error handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  error={(e, args) => {
    console.log("The error message is: " + args);
  }}
/>
```
{% endraw %}


## exportBegin

Called before exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `format` (string), `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default export)).

### Example

{% raw %}
```JavaScript
// Export begin handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  exportBegin={(e, args) => {
    console.log("Exporting report in format: " + args.format);
  }}
/>
```
{% endraw %}


## exportEnd

Called after exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), `format` (string), `handled` (boolean), and `windowOpenTarget` (string)).

### Example

{% raw %}
```JavaScript
// Export end handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  exportEnd={(e, args) => {
    args.windowOpenTarget = "_blank";
    console.log("The exported report can be found at " + args.url);
  }}
/>
```
{% endraw %}


## interactiveActionEnter

Called when entering an interactive action area. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#interactiveaction))).

### Example

{% raw %}
```JavaScript
// Interactive action enter handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  interactiveActionEnter={(e, args) => {
    if (args.action.Type === "sorting") {
      // Custom logic for sorting action
    }
  }}
/>
```
{% endraw %}


## interactiveActionExecuting

Called before an interactive action executes, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#interactiveaction)), and `cancel` (boolean, set to true to cancel the action)).

### Example

{% raw %}
```JavaScript
// Interactive action executing handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  interactiveActionExecuting={(e, args) => {
    if (args.action.Type === "navigateToUrl") {
      const url = args.action.Value.Url;
      const target = args.action.Value.Target;
    }
  }}
/>
```
{% endraw %}


## interactiveActionLeave

Called when leaving an interactive action area. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#interactiveaction))).

### Example

{% raw %}
```JavaScript
// Interactive action leave handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  interactiveActionLeave={(e, args) => {
    if (args.action.Type === "toggleVisibility") {
      // Custom logic for toggleVisibility action
    }
  }}
/>
```
{% endraw %}


## pageReady

Called after a page of the report is ready. Receives two parameters: `e` (the event object) and `args` (an object with property: `pageContent` (string)).

### Example

{% raw %}
```JavaScript
// Page ready handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  pageReady={(e, args) => {
    console.log("The content of the page is: " + args.pageContent);
  }}
/>
```
{% endraw %}


## printBegin

Called before printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), and `handled` (boolean)).

### Example

{% raw %}
```JavaScript
// Print begin handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  printBegin={(e, args) => {
    console.log("About to print the report.");
  }}
/>
```
{% endraw %}


## printEnd

Called after printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), and `handled` (boolean)).

### Example

{% raw %}
```JavaScript
// Print end handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  printEnd={(e, args) => {
    console.log("The printed report can be found at " + args.url);
  }}
/>
```
{% endraw %}


## ready

A callback function that is called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations.

### Example

{% raw %}
```JavaScript
// Ready callback
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  ready={() => console.log("Report viewer is ready")}
/>
```
{% endraw %}


## renderingBegin

Called before rendering the report (preview only, not for export or print). Receives two parameters: `e` (the event object) and `args` (an object with property: `deviceInfo` (object)).

### Example

{% raw %}
```JavaScript
// Rendering begin handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  renderingBegin={(e, args) => {
    // Use deviceInfo to set a specific culture for rendering
    args.deviceInfo["CurrentCulture"] = "de-DE";
    args.deviceInfo["CurrentUICulture"] = "de-DE";
  }}
/>
```
{% endraw %}


## renderingEnd

Called after rendering the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `bookmarkNodes` (array), `documentMapAvailable` (boolean), `documentMapNodes` (array), `documentReady` (boolean), and `pageCount` (number)).

### Example

{% raw %}
```JavaScript
// Rendering end handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  renderingEnd={(e, args) => {
    console.log("The rendered report is " + (args.documentReady ? "" : "not ") + "ready.");
    console.log("The rendered report has " + args.pageCount + " pages.");
  }}
/>
```
{% endraw %}


## sendEmailBegin

Called before the report is exported and the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), `handled` (boolean), and `format` (string)).

### Example

{% raw %}
```JavaScript
// Send email begin handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  sendEmailBegin={(e, args) => {
    console.log("About to export and send report in format: " + args.format);
  }}
/>
```
{% endraw %}


## sendEmailEnd

Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `handled` (boolean), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string)).

### Example

{% raw %}
```JavaScript
// Send email end handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  sendEmailEnd={(e, args) => {
    args.format = "XLS";
    console.log("The exported report can be found at " + args.url);
  }}
/>
```
{% endraw %}


## updateUi

Called when the state of the viewer changes. Receives one parameter: `e` (the event object).

### Example

{% raw %}
```JavaScript
// Update UI handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  updateUi={(e) => {
    console.log("Viewer UI state changed.");
  }}
/>
```
{% endraw %}


## viewerToolTipOpening

Called before a tooltip is opened, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `toolTip` (object with `title` and `text`), and `cancel` (boolean, set to true to cancel the tooltip)).

### Example

{% raw %}
```JavaScript
// Viewer tooltip opening handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  viewerToolTipOpening={(e, args) => {
    // Example: disable tooltip if title contains '2004'
    args.cancel = (/2004/i.test(args.toolTip.title));
  }}
/>
```
{% endraw %}

