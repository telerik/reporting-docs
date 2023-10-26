---
title: Localization
page_title: Localization of the HTML5 ReportViewer Explained
description: "Learn how to Localize the HTML5 ReportViewer for using with multiple languages in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization
tags: localization
published: True
position: 2
previous_url: /html5-report-viewer-localization
---

# Localization of the HTML5 ReportViewer

The article elaborates on how to localize the messages displayed by the HTML5 Report Viewer. This feature is available since version [R2 2018 SP1 (12.1.18.620)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620).

1. To localize the report viewer messages, create a new JavaScript file with the required string resources. You may use:

	* the resource file that gets deployed with the installation of the product in the subfolder `Html5\ReportViewer\js\telerikReportViewer.stringResources.js`, for example:

		`C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportViewer\js\telerikReportViewer.stringResources.js`

	* the following code snippet:

		{{source=CodeSnippets\js\telerikReportViewer.stringResources}}


1. Specify the name of the file using the following convention: `stringResources.[culture].js` where *[culture]* is the name of the culture for the specified localization resource. For example, to provide a localization resource for the French Belgian culture, the corresponding resource file could be named as follows: `stringResources.fr-BE.js`.
1. Translate the texts for the specified culture
1. `import` the localized `sr` object where the report viewer is displayed, and use the [extend]() jQuery function to update the `stringResources` reference of the report viewer object:

	````HTML
<script type="module">
	import { sr } from '../../Scripts/stringResources.fr-BE.js'
	
	$(document).ready(function () {
		var rv = $("#reportViewer1")
					.telerik_ReportViewer({
						serviceUrl: "api/reports/",
						reportSource: {
							report: "Report Catalog.trdp",
						},
					}).data("telerik_ReportViewer");
		
		rv.stringResources = $.extend(rv.stringResources, sr);
	});
</script>
````


> To modify the HTML5 Viewer's HTML template that contains the toolbar, Preview, Parameters and DocumentMap areas, you will have to set the viewer's templateUrl. For more details, check [Providing Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates%}).

## See Also

* [Localizing Reports]({%slug telerikreporting/designing-reports/localizing-reports%})
* [Localizing the Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/localization%})
