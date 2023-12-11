---
title: Localization
page_title: Blazor HTML5 Report Viewer Localization
description: "Learn how the Blazor HTML5 Report Viewer can be localized for multiple languages in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/localization
tags: localization, blazor, html5, report, viewer
published: True
position: 5
---

# Localization of the Blazor HTML5 Report Viewer

The Blazor HTML5 Report Viewer is based on the [pure HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and is using the same [Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization%}) mechanism.

To assign the _stringResources_ object with the localized texts on the report viewer object, we may use the [renderingBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingbegin(e,-args)%}) event which can be defined in the root file of the application, for example, `wwwroot/index.html`:

```HTML
<script type="module">
	import { sr } from '/stringResources.bg-BG.js'

	window.trvEventHandlers = {
		renderingBegin: function (e) {
			var rv = e.data.sender;
			rv.stringResources = $.extend(rv.stringResources, sr);
		}
	}
</script>
```

Then, in the component with the [Blazor HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%}), the event must be referenced in the initialization code:

```HTML
<ReportViewer @ref="reportViewer1"
		ViewerId="rv1"
		ServiceUrl="/api/reports"
		ReportSource="@(new ReportSourceOptions
						{
							Report = "Report Catalog.trdp",
						})"
		ClientEvents="@(new ClientEventsOptions() {
							RenderingBegin = "trvEventHandlers.renderingBegin"
						})" />
```

## See Also

* [Handling Blazor HTML5 Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/event-binding%})
