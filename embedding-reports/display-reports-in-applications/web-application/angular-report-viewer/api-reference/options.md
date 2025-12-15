---
title: Options
page_title: Angular Report Viewer Options
description: "Learn about what are the initialization options exposed by the Angular Report Viewer and how to configure them."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options
tags: options
published: True
reportingArea: AngularWrapper
position: 0
previous_url: /angular-report-viewer-api-options, /using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-api-options, /embedding-reports/display-reports-in-applications/web-application/angular-report-viewer/api-reference/
---

<style>
table th:first-of-type {
	width: 30%;
}
table th:nth-of-type(2) {
	width: 70%;
}
</style>

# Options Overview

Below is a list of all options available during initialization.

## How to configure the options

The report viewer options can be set from the `.HTML`/`.TS` component file or both(combined):

````HTML
<tr-viewer #viewer1
	[containerStyle]="viewerContainerStyle"
	[serviceUrl]="'http://localhost:59657/api/reports/'"
	[reportSource]="{
		report: 'Report1.trdp',
		parameters: {}
	}"
	[viewMode]="'INTERACTIVE'" [scaleMode]="'SPECIFIC'" [scale]="1.0" [ready]="ready"
	[viewerToolTipOpening]="viewerToolTipOpening" [enableAccessibility]="false">
</tr-viewer>
````
````TypeScript
export class ReportViewerComponent implements AfterViewInit {
	@ViewChild('viewer1') viewer: TelerikReportViewerComponent;

	title = "Report Viewer";
	viewerContainerStyle = {
		position: 'absolute',
		left: '5px',
		right: '5px',
		top: '40px',
		bottom: '5px',
		overflow: 'hidden',
		clear: 'both',
		['font-family']: 'ms sans serif'
	};

	ready() {
		console.log('ready');
	}
	viewerToolTipOpening(e: any, args: any) {
		console.log('viewerToolTipOpening ' + args.toolTip.text);
	}
}
````

## Available Options

| Parameter | Description |
| ------ | ------ |
| __id__ | *string*, *optional*; Sets the unique identifier of the ReportViewer instance. If not specified, the __id__ of the target HTML element will be used (if such is set). The id of the ReportViewer is used to identify the client session of the viewer when __persistSession__ is enabled (true);|
| __serviceUrl__ | *string*, *required if*; Sets the address of the Report REST Service;|
| __reportServer__ | *JSON*, *required if*; Sets the configuration details for Telerik Report Server. <br/>Available properties: <ul><li>__url__ (*string*, *required*) - the URL to the Telerik Report Server instance.</li><li>__getPersonalAccessToken__ (*callback function*, *optional*, *RS.NET specific*) - specifies the callback function that should return the Token for authentication against the Telerik Report Server for .NET instance wrapped in a [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).</li><li>__username__ (*string*, *optional*) - a registered username in the Report Server that will be used to get access to the reports. If omitted when connecting to the Report Server for .NET Framework 4.6.2, the built-in __Guest__ account will be used;</li><li>__password__ (*string*, *optional*) - the password for the provided username. Can be omitted only when connecting with the __Guest__ account of the Report Server for .NET Framework 4.6.2.</li></ul>|
| __templateUrl__ | *string*, *optional*; Sets the address of the html page that contains the viewer templates; If omitted, the default template will be downloaded from the REST service.|
| __reportSource__ | *JSON*, *optional*; Sets the report and initial report parameter values for the viewer to be displayed. Available properties: <ul><li>*report* - a string that represents a report on the server. On the server side, this string will be converted to a [ReportSource](/api/Telerik.Reporting.ReportSource) through an [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver). That said this string may contain everything as far as the [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) knows how to convert to a report source that will be passed to the report engine for further processing. For example, this may be an assembly-qualified type name that can be converted to [TypeReportSource](/api/Telerik.Reporting.TypeReportSource), a path to a report definition file (.trdp/.trdx) as in the [UriReportSource](/api/Telerik.Reporting.UriReportSource), or even a report id that a dedicated IReportSourceResolver will use to read the report definition stored in a database in xml format and converted to a [XmlReportSource](/api/Telerik.Reporting.XmlReportSource).<br/>When using the viewer with **Report Server**, the *report* should be provided in the format: `report: "{Category}/{ReportName}"`, where `{Category}` and `{ReportName}` are the actual names of the category and report as explained in [Integrating the Angular Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/how-to-use-angular-report-viewer-with-report-server%}).</li><li>*parameters* - a JSON object with properties name/value equal to the report parameters’ names and values used in the report definition;</li></ul>|
| __sendEmail__ | *object*, *required to show the*; Available properties: <ul><li>__enabled__ (*bool*, *required*) - Indicates whether to show the Send Mail Message toolbar button.<br/>Default value: false;</li> <li>__from__ (*string*, *optional*) - E-mail address used for the MailMessage FROM value;</li> <li>__to__ (*string*, *optional*) - E-mail address used for the MailMessage TO value;</li> <li>__cc__ (*string*, *optional*) - E-mail address used for the MailMessage Carbon Copy value;</li> <li>__subject__ (*string*, *optional*) - A string used for the MailMessage Subject value;</li> <li>__body__ (*string*, *optional*) - Sentences used for the MailMessage Content value;</li> <li>__format__ (*string*, *optional*) - The preselected report document format.</li></ul>|
| __scale__ | *number*, *optional*; Sets the scale factor for the report pages. The scale takes effect when __scaleMode__ is set to *“SPECIFIC”*.<br/>Default value is 1.0 (100%);|
| __scaleMode__ | *string*, *optional*; Sets how the report pages to be scaled. Available options are: <ul><li>*“FIT_PAGE_WIDTH”* - the pages are scaled proportional to fit the entire width in the viewer’s view port;</li> <li>*“FIT_PAGE”* - the pages are scaled proportional to fit the entire page in the view port;</li> <li>*“SPECIFIC”* - the pages are scaled with the __scale value__;<br/>Default value is: *“FIT_PAGE”*.</li></ul>|
| __viewMode__ | *string*, *optional*; Sets if the report is displayed in interactive mode or in print preview. <br/>The available values are: <ul><li>*“INTERACTIVE”* - enables drill-down interactivity, etc;</li> <li>*“PRINT_PREVIEW”* - the report is paged according to the page settings;For more information please see [Interactive vs. Print Layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}). <br/>Default value is: *'Interactive'*.</li></ul>|
| __pageMode__ | *string*, *optional*; Sets if the report is displayed in Single page or Continuous scroll mode. <br/>The available values are: <ul><li>*“SINGLE_PAGE”* - only one page is loaded in the view port;</li> <li>*“CONTINUOUS_SCROLL”* - more than one page could be loaded in the view port; <br/>Default value is: *'CONTINUOUS_SCROLL'*.</li></ul>|
| __persistSession__ | *boolean*, *optional*. Sets whether the viewer’s client session to be persisted between the page’s refreshes(ex. postback). The session is stored in the browser’s [sessionStorage](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Storage) and is available for the duration of the page session. A page session lasts for as long as the browser is open and survives over page reloads and restores. Opening a page in a new tab or window will cause a new session to be initiated.<br/>The viewer’s state is persisted in the global sessionStorage object under a key defined by the viewer’s __id__. In order to enable the correct session to be loaded on the next page reload please use the same __id__ as in the first load. This means that if you need to persist the client session between page reloads you should set the viewer’s __id__ (or the id of the target element) to a constant value that should not be changed dynamically during the page lifecycle.<br/>Default Value is: *false*;|
| __parameters__ | *object*, *optional*; Allows the user to define parameter options for the report parameters. <br/><table><thead><tr><th>Option</th><th>Description</th></tr></thead><tbody><tr><td><strong>editors</strong></td><td><em>object</em>, <em>optional</em>; Allows the user to defined editors type for the report parameters. <br/>The available editors are: <ul><li>__singleSelect__ (*string*, *optional*) - defines the editor type for the single select parameters. <br/>The available values are: <ul><li>*“COMBO_BOX”* - uses [Kendo UI ComboBox](https://docs.telerik.com/kendo-ui/api/javascript/ui/combobox) widget as an editor;</li> <li>*“LIST_VIEW”* - uses [Kendo UI ListView](https://docs.telerik.com/kendo-ui/api/javascript/ui/listview) widget as an editor;</li></ul>Default value is: *'LIST_VIEW'*</li> <li>__multiSelect__ (*string*, *optional*) - defineds the editor type for the multi select parameters.<br/>The available values are: <ul><li>*“COMBO_BOX”* - uses [Kendo UI MultiSelect](https://docs.telerik.com/kendo-ui/api/javascript/ui/multiselect) widget as an editor;</li> <li>*“LIST_VIEW”* - uses [Kendo UI ListView](https://docs.telerik.com/kendo-ui/api/javascript/ui/listview) widget as an editor;</li></ul>Default value is: *'LIST_VIEW'*</li></ul></td></tr></tbody></table> |
| __parameterEditors__ | *array*, *optional*; Allows the user to define custom editors for the report parameters.|
| __authenticationToken__ | *string*, *optional*; If provided, a *Bearer* token will be set in the *Authorization* header for every request to the REST service.|
| __printMode__ | *string*, *optional*. Specifies how the viewer should [print reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%}). <br/>The available values are: <ul><li>*“AUTO_SELECT”* - specifies that the viewer should automatically decide which option for printing to use depending on browser's version and whether the PDF plug-in is available or not. This is the default value;</li> <li>*“FORCE_PDF_FILE”* - specifies that the document for printing will be downloaded as a file (in PDF format with a special 'print' script enabled);</li> <li>*“FORCE_PDF_PLUGIN”* - specifies that the viewer should always use the PDF plug-in;</li></ul>|
| __selector__ | *string*, *optional*. A selector used in conjunction with the data attributes. Whenever a command is attached to an element outside of the report viewer via the data-attributes this selector must be provided.|
| __disabledButtonClass__ | *string*, *optional*. A class used in conjunction with the data- attributes. Whenever a command is in the disabled state this class will be added to the respective button.|
| __checkedButtonClass__ | *string*, *optional*. A class used in conjunction with the data- attributes. Whenever a command is in the checked state this class will be added to the respective button.|
| __enableAccessibility__ | *boolean*, *optional*. Determines whether the viewer should provide support for accessibility features. You can find more detailed information [here]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/accessibility%}). <br/>Default value: *false*;|
| __parametersAreaVisible__ | *boolean*, *optional*. Determines whether the viewer's parameters area is initially displayed if any parameter editor exists. The user can expand the parameters area even if it is hidden initially, either through the splitter control or from the toolbar menu. Additionally, the property determines only whether the element, with the *visible* report parameters, will be visible on the page. Even when the setting is **False**, and the parameters area is not visible on the page, it would still be rendered to the [Document Object Model (DOM)](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model). For that reason, if you have a report parameter that contains sensitive information that must not be accessible publicly, set its [Visible](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Visible) property to **False** instead. This way, the report parameter will not be rendered in the DOM regardless of the __parametersAreaVisible__ setting. <br/>Default value: *true*;|
| __documentMapVisible__ | *boolean*, *optional*. Determines whether the viewer's document map is displayed if any bookmark is defined. <br/>Default value: *true*;|
| __parametersAreaPosition__ | *string*, *optional*. Specifies where the Parameters Area should be displayed <br/>The available values are: <ul><li>*“RIGHT”*</li> <li>*“TOP”*</li> <li>*“LEFT”*</li> <li>*“BOTTOM”*</li></ul>Default value: *RIGHT*;|
| __documentMapAreaPosition__ | *string*, *optional*. Specifies where the Document Map should be displayed <br/>The available values are: <ul><li>*“RIGHT”*</li> <li>*“LEFT”*</li></ul>Default value: *LEFT*;|
| __searchMetadataOnDemand__ | *boolean*, *optional*. Determines whether the search metadata will be delivered on demand __(true)__ or by default __(false)__. <br/>Default value: *false*;|
| __initialPageAreaImageUrl__ | *string*, *optional*. The image URL for the PageArea background image. Used only when the parameter values are missing or invalid. The image should be in __PNG__, __GIF__, or __JPG__ file format.|
| __keepClientAlive__ | *boolean* | *optional*. Determines whether the client will be kept alive. When set to true expiration of the client will be prevented by continually sending a request to the server, determined by the Reporting REST service's __ClientSessionTimeout__. <br/>Default Value is: *true*;|
