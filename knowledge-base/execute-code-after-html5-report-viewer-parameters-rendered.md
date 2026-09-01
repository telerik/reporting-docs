---
title: Execute Code After HTML5 Report Viewer Parameters Are Rendered
description: "Learn how to run JavaScript once after the HTML5 Report Viewer has rendered its report parameter editors."
type: how-to
page_title: Run Code After HTML5 Report Viewer Parameters Are Rendered
slug: execute-code-after-html5-report-viewer-parameters-rendered
position:
tags: html5 report viewer, parameters, parametersLoaded, updateUi, ready, JavaScript
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 20.2.26.812 | HTML5 Report Viewer |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

The `ready` event indicates that the Report Viewer template is loaded. It does not indicate that the report parameters have been loaded or that the parameter editors are available in the DOM. The `updateUi` event reports viewer UI state changes and does not provide a parameter-editor rendering guarantee.

The `parametersLoaded` event is raised when the parameter data is returned. The parameter editors are inserted into the parameters area immediately afterward. If your code must access the rendered parameter controls, start a `MutationObserver` from `parametersLoaded` and run the code after the expected parameter containers have been added.

## Solution

Use the following pattern in the HTML5 Report Viewer initialization. Replace the code in `afterParametersRendered` with the code that should run once.

```JavaScript
function afterParametersRendered(parameters, viewer) {
    console.log("All visible report parameters are rendered.");
}

$("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Dashboard.trdp"
    },
    parametersLoaded: function (e, parameters) {
        var viewer = e.data.sender;
        var parametersArea = document.querySelector(
            "#reportViewer1 .trv-parameters-area-content"
        );

        if (!parametersArea || parametersArea.dataset.parametersHandled === "true") {
            return;
        }

        var visibleParameterCount = parameters.filter(function (parameter) {
            return parameter.isVisible;
        }).length;

        var runOnce = function () {
            var renderedParameterCount = parametersArea.querySelectorAll(
                ".trv-parameter-container"
            ).length;

            if (renderedParameterCount < visibleParameterCount) {
                return false;
            }

            parametersArea.dataset.parametersHandled = "true";
            afterParametersRendered(parameters, viewer);
            return true;
        };

        if (runOnce()) {
            return;
        }

        var observer = new MutationObserver(function () {
            if (runOnce()) {
                observer.disconnect();
            }
        });

        observer.observe(parametersArea, {
            childList: true,
            subtree: true
        });
    }
});
```

The `parametersLoaded` handler receives the loaded parameter collection as its second argument. The observer waits for the visible parameter containers in `.trv-parameters-area-content`, then disconnects after `afterParametersRendered` runs. The `data-parameters-handled` marker prevents the code from running again for the same viewer instance.

>note If the viewer can load a different report during the same page session and the code should run once for each report, remove or reset the `data-parameters-handled` marker when the report source changes.

## Event timing

- `ready` runs after the viewer template is loaded.
- `parametersLoaded` runs after parameter data is returned, before the parameter editors are inserted.
- `updateUi` runs when the viewer UI state changes, but it does not guarantee that the parameter editors are present.
- `renderingEnd` runs after report rendering and is not a parameter-editor lifecycle event.

## See Also

- [HTML5 Report Viewer Event Binding](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/event-binding)
- [The ready() Event of the HTML5 Report Viewer](slug:old-telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready())
- [The updateUi(e) Event of the HTML5 Report Viewer](slug:old-telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/updateui(e))
- [The renderingEnd(e, args) Event of the HTML5 Report Viewer](slug:old-telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args))
