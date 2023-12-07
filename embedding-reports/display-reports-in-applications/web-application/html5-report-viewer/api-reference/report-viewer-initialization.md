---
title: Initialization
page_title: HTML5 Report Viewer Options Overview
description: "Learn what are the options that may be set when initializing the HTML5 Report Viewer and what functionalities they control."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization
tags: report,viewer,initialization
published: True
position: 0
previous_url: /html5-report-viewer-jquery-fn-telerik-reportviewer, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/
---

<style>
table th:first-of-type {
	width: 28%;
}
table th:nth-of-type(2) {
	width: 72%;
}
</style>

# Initializing the HTML5 Report Viewer

The Telerik HTML5 Report Viewer is a jQuery plugin - `jQuery.fn.telerik_ReportViewer(options)`. Below is a list of all options available during initialization.

## Options

| Parameter | Description |
| ------ | ------ |
| __id__ | *string*, *optional*; Sets the unique identifier of the ReportViewer instance. If not specified, the __id__ of the target HTML element will be used (if such is set). The id of the ReportViewer is used to identify the client session of the viewer when __persistSession__ is enabled (true);|
| __serviceUrl__ | *string*, *required if*; Sets the address of the Report REST Service;|
| __reportServer__ | *JSON*, *required if*; Sets the configuration details for Telerik Report Server. <br/>Available properties: <ul><li>__url__ (*string*, *required*) - the URL to the Telerik Report Server instance.</li> <li>__username__ (*string*, *optional*) - a registered username in the Report Server that will be used to get access to the reports. If omitted, the Report Server built-in __Guest__ account will be used;</li> <li>__password__ (*string*, *optional*) - the password for the provided username. Can be omitted only when connecting with the __Guest__ account.</li></ul>|
| __templateUrl__ | *string*, *optional*; Sets the address of the html page that contains the viewer templates; If omitted, the default template will be downloaded from the REST service.|
| __reportSource__ | *JSON*, *optional*; Sets the report and initial report parameter values for the viewer to be displayed. Available properties: <ul><li>*report* - a string that represents a report on the server. On the server side this string will be converted to a [ReportSource](/api/Telerik.Reporting.ReportSource) through an [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver). That said this string may contain everything as far as the [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) knows how to convert to a reports source that will be passed to the report engine for further processing. For example, this may be an assembly-qualified type name that can be converted to [TypeReportSource](/api/Telerik.Reporting.TypeReportSource), a path to a report definition file (.trdp/.trdx) as in the [UriReportSource](/api/Telerik.Reporting.UriReportSource), or even a report id that a dedicated IReportSourceResolver will use to read the report definition stored in a database in xml format and converted to a [XmlReportSource](/api/Telerik.Reporting.XmlReportSource).</li> <li>*parameters* - a JSON object with properties name/value equal to the report parameters’ names and values used in the report definition;</li></ul>|
| __sendEmail__ | *object*, *required to show the*; Available properties: <ul><li>__enabled__ (*bool*, *required*) - Indicates whether to show the Send Mail Message toolbar button.<br/>Default value: false;</li> <li>__from__ (*string*, *optional*) - E-mail address used for the MailMessage FROM value;</li> <li>__to__ (*string*, *optional*) - E-mail address used for the MailMessage TO value;</li> <li>__cc__ (*string*, *optional*) - E-mail address used for the MailMessage Carbon Copy value;</li> <li>__subject__ (*string*, *optional*) - A string used for the MailMessage Subject value;</li> <li>__body__ (*string*, *optional*) - Sentences used for the MailMessage Content value;</li> <li>__format__ (*string*, *optional*) - The preselected report document format.</li></ul>|
| __scale__ | *number*, *optional*; Sets the scale factor for the report pages. The scale takes effect when __scaleMode__ is set to *“SPECIFIC”*.<br/>Default value is 1.0 (100%);|
| __scaleMode__ | *string*, *optional*; Sets how the report pages to be scaled. Available options are: <ul><li>*“FIT_PAGE_WIDTH”* - the pages are scaled proportional to fit the entire width in the viewer’s view port;</li> <li>*“FIT_PAGE”* - the pages are scaled proportional to fit the entire page in the view port;</li> <li>*“SPECIFIC”* - the pages are scaled with the __scale value__;<br/>Default value is: *“FIT_PAGE”*.</li></ul>|
| __viewMode__ | *string*, *optional*; Sets if the report is displayed in interactive mode or in print preview. <br/>The available values are: <ul><li>*“INTERACTIVE”* - enables drill-down interactivity, etc;</li> <li>*“PRINT_PREVIEW”* - the report is paged according to the page settings;For more information please see [Interactive vs. Print Layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}). <br/>Default value is: *'Interactive'*.</li></ul>|
| __pageMode__ | *string*, *optional*; Sets if the report is displayed in Single page or Continuous scroll mode. <br/>The available values are: <ul><li>*“SINGLE_PAGE”* - only one page is loaded in the view port;</li> <li>*“CONTINUOUS_SCROLL”* - more than one page could be loaded in the view port; <br/>Default value is: *'CONTINUOUS_SCROLL'*.</li></ul>|
| __printMode__ | *string*, *optional*; Specifies whether the viewer will use the PDF plug-in of the browser for printing, or will directly export to a PDF file containing a special 'print' script. <br/>The available values are: <ul><li>*"AUTO_SELECT"* - the widget will try to automatically determine whether to export the report document or use the browser's PDF plug-in. First, the viewer widget tries to use the PDF plug-in of the browser for printing. When it is not available or not supported, the widget falls back to exporting to a PDF file containing a special 'print' script;</li> <li>*"FORCE_PDF_PLUGIN"* - the widget will always try to use the PDF plug-in of the browser. If the browser doesn't have a PDF plug-in or it does not support the 'print' script nothing will happen;</li> <li>*"FORCE_PDF_FILE"* - the widget will always export the report document to a PDF file with a special 'print' script;</li></ul>Default value is: *"AUTO_SELECT"*.|
| __parametersAreaPosition__ | *string*, *optional*. Specifies where the Parameters Area should be displayed.  <br/>The available values are: <ul><li>*“RIGHT”* </li> <li>*“TOP”* </li> <li>*“LEFT”* </li> <li>*“BOTTOM”*</li></ul>Default value: *RIGHT*;|
| __documentMapAreaPosition__ | *string*, *optional*. Specifies where the Document Map should be displayed. <br/>The available values are: <ul><li>*“RIGHT”* </li> <li>*“LEFT”*</li></ul>Default value: *LEFT*;|
| __persistSession__ | *boolean*, *optional*. Sets whether the viewer’s client session to be persisted between the page’s refreshes(ex. postback). The session is stored in the browser’s [sessionStorage](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Storage) and is available for the duration of the page session. A page session lasts for as long as the browser is open and survives over page reloads and restores. Opening a page in a new tab or window will cause a new session to be initiated.<br/>The viewer’s state is persisted in the global sessionStorage object under a key defined by the viewer’s __id__. In order to enable the correct session to be loaded on the next page reload please use the same __id__ as in the first load. This means that if you need to persist the client session between page reloads you should set the viewer’s __id__ (or the id of the target element) to a constant value that should not be changed dynamically during the page lifecycle.<br/>Default Value is: *false*;|
| __parameters__ | *object*, *optional*; Allows the user to define parameter options for the report parameters. <br/><table><thead><tr><th>Option</th><th>Description</th></tr></thead><tbody><tr><td><strong>editors</strong></td><td><em>object</em>, <em>optional</em>; Allows the user to define editors type for the report parameters. <br/>The available editors are: <ul><li>__singleSelect__ (*string*, *optional*) - defines the editor type for the single select parameters. <br/>The available values are: <ul><li>*“COMBO_BOX”* - uses [Kendo UI ComboBox](https://docs.telerik.com/kendo-ui/api/javascript/ui/combobox) widget as an editor;</li> <li>*“LIST_VIEW”* - uses [Kendo UI ListView](https://docs.telerik.com/kendo-ui/api/javascript/ui/listview) widget as an editor;</li></ul>Default value is: *'LIST_VIEW'*</li> <li>__multiSelect__ (*string*, *optional*) - defineds the editor type for the multi select parameters.<br/>The available values are: <ul><li>*“COMBO_BOX”* - uses [Kendo UI MultiSelect](https://docs.telerik.com/kendo-ui/api/javascript/ui/multiselect) widget as an editor;</li> <li>*“LIST_VIEW”* - uses [Kendo UI ListView](https://docs.telerik.com/kendo-ui/api/javascript/ui/listview) widget as an editor;</li></ul>Default value is: *'LIST_VIEW'*</li></ul><pre><code>$("#reportViewer1").telerik_ReportViewer({...parameters: {editors: {multiSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX,}}});</code></pre></td></tr></tbody></table>|
| __parameterEditors__ | *array*, *optional*; Allows user to define custom editors for the report parameters.|
| __authenticationToken__ | *string*, *optional*; If provided, a *Bearer* token will be set in the *Authorization* header for requests to the REST service. The token is not sent only when requesting [document resources]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-resource%}). The reason is that the resources like images are referenced with relative URLs in the HTML of the report document, hence the requests for them are made by the browser.|
| __enableAccessibility__ | *boolean*, *optional*. Determines whether the viewer should provide support for accessibility features. You can find more detailed information in the article [Accessibility Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/accessibility%}). <br/>Default value: *false*;|
| __parametersAreaVisible__ | *boolean*, *optional*. Determines whether the viewer's parameters area is displayed if any parameter editor exists. <br/>Default value: *true*;|
| __documentMapVisible__ | *boolean*, *optional*. Determines whether the viewer's document map is displayed if any bookmark is defined. <br/>Default value: *true*;|
| __searchMetadataOnDemand__ | *boolean*, *optional*. Determines whether the search metadata will be delivered on demand __(true)__ or by default __(false)__. <br/>Default value: *false*;|
| __initialPageAreaImageUrl__ | *string*, *optional*. The image URL for the PageArea background image. Used only when the parameter values are missing or invalid. The image should be in __PNG__, __GIF__, or __JPG__ file format.|
| __keepClientAlive__ | *boolean*, *optional*. Determines whether the client will be kept alive. When set to true expiration of the client will be prevented by continually sending a request to the server, determined by the Reporting REST service's __ClientSessionTimeout__. <br/>Default Value is: *true*;|
| __selector__ | *string*, *optional*. A selector used in conjunction with the data- attributes. Whenever a command is attached to an element outside of the report viewer via the data-attributes this selector must be provided.|
| __disabledButtonClass__ | *string*, *optional*. A class used in conjunction with the data- attributes. Whenever a command is in the disabled state this class will be added to the respective button.|
| __checkedButtonClass__ | *string*, *optional*. A class used in conjunction with the data- attributes. Whenever a command is in the checked state this class will be added to the respective button.|
| __ready__ | *function();* *optional;* A callback function that will be called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations on it. The function is executed in the context of the ReportViewer object that is available through the __this__ object.|
| __exportBegin__ | *function(e, args);optional;* A callback function that will be called before starting the report export command.|
| __exportEnd__ | *function(e, args);optional;* A callback function that will be called when the exported document is ready for download, but before the actual downloading.|
| __printBegin__ | *function(e, args);optional;* A callback function that will be called before starting the print report command.|
| __printEnd__ | *function(e, args);optional;* A callback function that will be called when the print document (Adobe PDF) is ready for download, but before being sent to the printer.|
| __sendEmailBegin__ | *function(e, args);optional;* A callback function that will be called before the report is exported and the E-mail message is sent.|
| __sendEmailEnd__ | *function(e, args);optional;* A callback function that will be called after the report is exported and before the E-mail message is sent.|
| __renderingBegin__ | *function(e, args);optional;* A callback function that will be called when the rendering of the report begins.|
| __renderingEnd__ | *function(e, args);optional;* A callback function that will be called when the rendering of the report ends.|
| __updateUi__ | *function(e);optional;* A callback function that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with the reports.|
| __pageReady__ | *function(e, args);optional;* A callback function that will be called every time a page from the report is rendered and ready for display.|
| __error__ | *function(e, args);optional;* A callback function that will be called when an error occurs.|
| __viewerToolTipOpening__ | *function(e, args);optional;* A callback function that will be called when a tooltip is being opened.|
| __interactiveActionExecuting__ | *function(e, args);optional;* A callback function that will be called before an interactive action is executed, providing the ability to cancel the execution..|
| __interactiveActionEnter__ | *function(e, args);optional;* A callback function that will be called when the mouse cursor enters the area of an interactive action.|
| __interactiveActionLeave__ | *function(e, args);optional;* A callback function that will be called when the mouse cursor leaves the area of an interactive action.|

## Examples

To create a ReportViewer:

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
	serviceUrl: "api/reports",
	templateUrl: 'src/templates/telerikReportViewerTemplate-{{buildversion}}.html',
	reportSource: { report: "Product Catalog.trdp" }
});
````

To get the __ReportViewer__ object from the HTML element:

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
````

## See Also

* [Printing Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%})
