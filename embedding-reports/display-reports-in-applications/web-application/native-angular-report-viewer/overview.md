---
title: Overview
page_title: Integrating the Native Angular Report Viewer
description: "Learn about the requirements of the Native Angular Report Viewer, what module loaders can be used, and what are the supported browsers."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview
tags: angular,native,report,viewer,overview
published: True
reporting_area: NativeAngular
position: 0
previous_url: /embedding-reports/display-reports-in-applications/web-application/native-angular-report-viewer/
---

<style>

table {
	color: var(--text-secondary) !important;
	margin: auto;
}

table svg {
	fill: var(--text-secondary) !important;
}

table th:first-of-type {
	width: 20%;
}

table td:first-of-type {
	text-align: center !important;
}

table th:nth-of-type(2) {
	width: 80%;
	text-align: left !important;
	padding-left: 10px;
}
</style>

# Native Angular Report Viewer Overview

> The current Native Angular Report Viewer version is `{{site.spaviewerversion}}` and should be used with `Reporting REST Service {{site.buildversion}}` or `Telerik Report Server {{site.reportserverversion}}`.
>
> The Native Angular Report Viewer is a native Angular component built with [Kendo UI for Angular](https://www.telerik.com/kendo-angular-ui) components. It was introduced with [Telerik Reporting R3 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2023-17-2-23-1010).

![The preview of the demo report 'Report Catalog' in the Native Angular Report Viewer in the Microsoft Edge browser](../images/NativeAngularReportViewer/angular-report-viewer-overview.png)

## Toolbar Actions

<table>
	<tr>
		<th>Icon</th>
		<th>Purpose</th>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M479.9 416c-57.7-56.6-136.7-96-223.9-96v128L32 256 256 64v128c122.2 0 221.5 102.4 223.9 224z"></path></svg></td>
		<td>Navigates Backward</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M256 192V64l224 192-224 192V320c-87.2 0-166.2 39.4-223.9 96C34.5 294.4 133.9 192 256 192z"></path></svg></td>
		<td>Navigates Forward</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M256 32C132.3 32 32 132.3 32 256s100.3 224 224 224 224-100.3 224-224S379.7 32 256 32zm128 306.7L338.7 384 256 301.3 173.3 384 128 338.7l82.7-82.7-82.7-82.7 45.3-45.3 82.7 82.7 82.7-82.7 45.3 45.3-82.7 82.7 82.7 82.7z"></path></svg></td>
		<td>Stops Report Rendering</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M480 288c0 123.7-100.3 224-224 224S32 411.7 32 288 132.3 64 256 64V0l160 96-160 96v-64c-88.2 0-160 71.8-160 160s71.8 160 160 160 160-71.8 160-160c0-29.1-7.8-56.4-21.5-80l55.5-32c19.1 32.9 30 71.2 30 112z"></path></svg></td>
		<td>Refreshes the Report Viewer</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M256 256 512 96v320L256 256zm0 160V96L0 256l256 160z"></path></svg></td>
		<td>Returns the Report to the first page</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M352 384 160 256l192-128v256zM128 128v256h32V128h-32z"></path></svg></td>
		<td>Goes to the previous page</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="m128 128 192 128-192 128V128zm224 256V128h-32v256h32z"></path></svg></td>
		<td>Goes to the next page</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M0 416V96l256 160L0 416zm512-160L256 96v320l256-160z"></path></svg></td>
		<td>Navigates to the last page of the report</td>
	</tr>
	<tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M352 32H96c-17.7 0-32 14.3-32 32v384c0 17.7 14.3 32 32 32h320c17.7 0 32-14.3 32-32V128l-96-96zm64 416H96V64h224v96h96v288zm-32-96v32H128v-32h256zM256 160v32H128v-32m256 64v32H128v-32h256zm-256 96v-32h224v32H128z"></path></svg></td>
		<td>Sets `interactive` viewmode</td>
	</tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M448 96H64V64h384v32zm-96 32H64v32h288v-32zm96 64H64v32h384v-32zm-96 64H64v32h288v-32zm96 64H64v32h384v-32zm-96 64H64v32h288v-32z"></path></svg></td>
		<td>Sets `printPreview` viewmode</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M448 160h-32V96l-64-64H128c-17.7 0-32 14.3-32 32v96H64c-17.6 0-32 14.4-32 32v160c0 17.6 14.4 32 32 32h32v64c0 17.6 14.4 32 32 32h256c17.6 0 32-14.4 32-32v-64h32c17.6 0 32-14.4 32-32V192c0-17.6-14.4-32-32-32zM128 64h192v64h64v64H128V64zm320 256h-64v127.9l-.1.1H128.1l-.1-.1V320H64v-32h384v32zm-288 0h192v32H160v-32zm0 64h160v32H160v-32z"></path></svg></td>
		<td>Opens the browser's Print Dialog</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M32 384v96h448v-96H32zM288 32h-64v128h-96l128 160 128-160h-96V32z"></path></svg></td>
		<td>Opens the Export Dropdown</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M288 224H96v-64h192v64zm192 210.7L434.7 480 320 365.3v-22.7l-26.7-26.7C265.7 338.5 230.4 352 192 352c-88.4 0-160-71.6-160-160S103.6 32 192 32s160 71.6 160 160c0 38.4-13.5 73.7-36.1 101.3l26.7 26.7h22.7L480 434.7zM192 320c70.7 0 128-57.3 128-128S262.7 64 192 64 64 121.3 64 192s57.3 128 128 128z"></path></svg></td>
		<td>Zooms in the Report</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M288 224h-64v64h-64v-64H96v-64h64V96h64v64h64v64zm192 210.7L434.7 480 320 365.3v-22.7l-26.7-26.7C265.7 338.5 230.4 352 192 352c-88.4 0-160-71.6-160-160S103.6 32 192 32s160 71.6 160 160c0 38.4-13.5 73.7-36.1 101.3l26.7 26.7h22.7L480 434.7zM192 320c70.7 0 128-57.3 128-128S262.7 64 192 64 64 121.3 64 192s57.3 128 128 128z"></path></svg></td>
		<td>Zooms out the Report</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M365.3 320h-22.7l-26.7-26.7C338.5 265.7 352 230.4 352 192c0-88.4-71.6-160-160-160S32 103.6 32 192s71.6 160 160 160c38.4 0 73.7-13.5 101.3-36.1l26.7 26.7v22.7L434.7 480l45.3-45.3L365.3 320zM64 192c0-70.7 57.3-128 128-128s128 57.3 128 128-57.3 128-128 128S64 262.7 64 192z"></path></svg></td>
		<td>Opens the Search Dialog</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="m320 32 54.3 137.7L512 224l-137.7 54.3L320 416l-54.3-137.7L128 224l137.7-54.3zM94 350 0 384l94 34 34 94 34-94 94-34-94-34-34-94zM70.6 70.6 0 96l70.5 25.5L96 192l25.5-70.5L192 96l-70.5-25.5L96 0 70.5 70.5Z"></path></svg></td>
		<td>Toggles the AI Prompt Dialog when the [AI-Powered Insights]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights%}) functionality has been enabled.</td>
	</tr>	
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M448 32H32v448h448V32h-32zm0 416H64V64h384v384zM96 96h96v320H96z"></path></svg></td>
		<td>Toggles the Document Map</td>
	</tr>
	<tr>
		<td><svg style="height: 35px; padding: 5px;" viewBox="0 0 512 512"><path d="M64 480h416V32H32v448h32zm0-416h384v384H64V64zm256 32h96v320h-96z"></path></svg></td>
		<td>Toggles the Parameters Area</td>
	</tr>
</table>

## Missing Features

The currently released version of the `Native Angular Report Viewer` component is missing the following functionalities:

- Accessiblity
- Localization
- Send Email Dialog
- Toolbar Reordering/Customization
- Tooltips Customization
- Parameter Editors Customization
- Parameters Area Repositioning

> The above functionalities will be implemented in future releases of the `Native Angular Report Viewer` and are already available in the [wrapper Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%}) component.

## Demo

A complete example with the native Angular Report Viewer can be found in the installation folder of Telerik Reporting: `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\Angular\native-angular-report-viewer-example`.

## See Also

- [How to Use the Native Angular Report Viewer with Reporting Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-reporting-service%})
- [How to Use the Native Angular Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/how-to-use-with-report-server%})
- [Native Angular Report Viewer Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/requirements%})
- [Native Angular Report Viewer Options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/options%})
- [Native Angular Report Viewer Commands]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/commands%})
- [Native Angular Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/events%})
