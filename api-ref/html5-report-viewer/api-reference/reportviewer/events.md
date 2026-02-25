---
title: Events
page_title: Events of the HTML5 Report Viewer
description: Complete list of events available in the HTML5 Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events
tags: events
published: True
reportingArea: HTML5
position: 4
---

# Events of the HTML5 Report Viewer

> The report viewer exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods%}#bind) method.

## error

Called when an error occurs. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (a string containing the error message).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  error: function(e, args) {
    // This event handler will be called when an error occurs.
    // 'e.data.sender' is the report viewer instance.
    console.log("The error message is: " + args);
  }
});
````


## exportBegin

Called before exporting the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `format` (string), `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default export)).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  exportBegin: function(e, args) {
    // This event handler will be called before exporting the report.
    // 'e.data.sender' is the report viewer instance.
    // 'args.format' is the export format.
    console.log("Exporting report in format: " + args.format);
  }
});
````


## exportEnd

Called after exporting the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `url` (string, the exported report resource URL), `format` (string), `handled` (boolean, set to true to prevent the default export operation), and `windowOpenTarget` (string, target attribute for opening the exported document, default is "self")).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  exportEnd: function(e, args) {
    // This event handler will be called after exporting the report.
    // 'e.data.sender' is the report viewer instance.
    // 'args.url' is the exported report resource URL.
    args.windowOpenTarget = "_blank";
    console.log("The exported report can be found at " + args.url);
  }
});
````


## interactiveActionEnter

Called when entering an interactive action area.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#interactiveaction))).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  interactiveActionEnter: function(e, args) {
    // args.action is an InteractiveAction object
    if (args.action.Type === "sorting") {
      // Custom logic for sorting action
    }
  }
});
````


## interactiveActionExecuting

Called before an interactive action executes, allowing cancellation.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#interactiveaction)), and `cancel` (boolean, set to true to cancel the action)).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  interactiveActionExecuting: function(e, args) {
    // args.action is an InteractiveAction object
    if (args.action.Type === "navigateToUrl") {
      var url = args.action.Value.Url;
      var target = args.action.Value.Target;
    }
    if (args.action.Type === "navigateToReport") {
      var report = args.action.Value.report;
      var parameters = args.action.Value.parameters;
    }
  }
});
````


## interactiveActionLeave

Called when leaving an interactive action area.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#interactiveaction))).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  interactiveActionLeave: function(e, args) {
    // args.action is an InteractiveAction object
    if (args.action.Type === "toggleVisibility") {
      // Custom logic for toggleVisibility action
    }
  }
});
````


## pageReady

Called after a page of the report is ready. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with property: `pageContent` (string), the content of the rendered report page as a resource).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  pageReady: function(e, args) {
    // This event handler will be called after a page of the report is ready.
    // 'e.data.sender' is the report viewer instance.
    // 'args.pageContent' is the content of the rendered page.
    console.log("The content of the page is: " + args.pageContent);
  }
});
````


## printBegin

Called before printing the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default render and print operation)).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  printBegin: function(e, args) {
    // This event handler will be called before printing the report.
    // 'e.data.sender' is the report viewer instance.
    // 'args.deviceInfo' contains the print device info.
    console.log("About to print the report.");
  }
});
````


## printEnd

Called after printing the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `url` (string, the printed report resource URL), and `handled` (boolean, set to true to prevent the default print operation)).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  printEnd: function(e, args) {
    // This event handler will be called after printing the report.
    // 'e.data.sender' is the report viewer instance.
    // 'args.url' is the printed report resource URL.
    console.log("The printed report can be found at " + args.url);
  }
});
````


## ready

A callback function that is called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations. The function is executed in the context of the ReportViewer object (i.e., inside the callback, `this` refers to the ReportViewer instance).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  ready: function() {
    // 'this' refers to the ReportViewer instance
  }
});
````


## renderingBegin

Called before rendering the report (preview only, not for export or print). Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with property: `deviceInfo` (object), the device info used for rendering).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  renderingBegin: function(e, args) {
    // This event handler will be called before rendering the report (preview).
    // 'e.data.sender' is the report viewer instance.
    // 'args.deviceInfo' contains the render device info.
    // The deviceInfo property can be used to pass a specific culture to the REST Service so it renders the report with it.
    const culture = "yourCulture";
    args.deviceInfo["CurrentCulture"] = culture;
    args.deviceInfo["CurrentUICulture"] = culture;
    console.log("About to render the report.");
  }
});
````


## renderingEnd

Called after rendering the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `bookmarkNodes` (array), `documentMapAvailable` (boolean), `documentMapNodes` (array), `documentReady` (boolean), and `pageCount` (number)).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  renderingEnd: function(e, args) {
    // This event handler will be called after rendering the report.
    // 'e.data.sender' is the report viewer instance.
    // 'args.documentReady' is true if the report is ready.
    // 'args.pageCount' is the number of pages.
    // 'args.documentMapAvailable' is true if document map is available.
    // 'args.bookmarkNodes' is an array of bookmark nodes.
    console.log("The rendered report is " + (args.documentReady ? "" : "not ") + "ready.");
    console.log("The rendered report has " + args.pageCount + " pages.");
    console.log("The rendered report " + (args.documentMapAvailable ? "has" : "does not have") + " document map.");
    console.log("The rendered report has " + args.bookmarkNodes.length + " nodes");
  }
});
````


## sendEmailBegin

Called before the report is exported and the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `deviceInfo` (object), `handled` (boolean, set to true to prevent the default export and send email operations), and `format` (string, the document format of the sent report)).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  sendEmailBegin: function(e, args) {
    // This event handler will be called before exporting the report and sending the E-mail message.
    // 'e.data.sender' is the report viewer instance.
    // 'args.format' is the export format.
    console.log("About to export and send report in format: " + args.format);
  }
});
````


## sendEmailEnd

Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `handled` (boolean, set to true to prevent the default send email operation), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string, the exported report resource URL)).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  sendEmailEnd: function(e, args) {
    // This event handler will be called after exporting the report and before sending the E-mail message.
    // 'e.data.sender' is the report viewer instance.
    // 'args.url' is the exported report resource URL.
    args.format = "XLS";
    console.log("The exported report can be found at " + args.url);
  }
});
````


## updateUi

Called when the state of the viewer changes. Receives one parameter: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  updateUi: function(e) {
    // This event handler will be called when the state of the viewer changes.
    // 'e.data.sender' is the report viewer instance.
    console.log("Viewer UI state changed.");
  }
});

 /**
````


## viewerToolTipOpening

Called before a tooltip is opened, allowing cancellation. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `element` (DOM element), `toolTip` (object with `title` and `text`), and `cancel` (boolean, set to true to cancel the tooltip).

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  viewerToolTipOpening: function(e, args) {
    // This event handler will be called before a tooltip is opened.
    // 'e.data.sender' is the report viewer instance.
    // 'args.toolTip.title' is the tooltip title.
    // 'args.cancel' can be set to true to cancel the tooltip.
    // Example: disable tooltip if title contains '2004'
    args.cancel = (/2004/i.test(args.toolTip.title));
  }
});
````

