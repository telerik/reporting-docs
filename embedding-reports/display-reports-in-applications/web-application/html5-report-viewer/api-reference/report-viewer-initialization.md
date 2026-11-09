---
title: Initialization
page_title: HTML5 Report Viewer Options Overview
description: "Learn how to initialize the Telerik HTML5 Report Viewer, configure its options, and access the viewer object in a web application."
slug: old-telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization
tags: report,viewer,initialization
published: false
reportingArea: HTML5
components: [html5, general]
position: 0
previous_url: /html5-report-viewer-jquery-fn-telerik-reportviewer, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/, /html5-report-viewer-api-reference
---

<style>
table th:first-of-type {
	width: 28%;
}
table th:nth-of-type(2) {
	width: 72%;
}
</style>

# Initialization

The Telerik HTML5 Report Viewer is a jQuery plugin initialized with `jQuery.fn.telerik_ReportViewer(options)`. The following table lists the options available during initialization:

## Options

| Parameter | Description |
| ------ | ------ |
| __id__ | *string*, *optional*; Sets the unique identifier of the ReportViewer instance. If not specified, the __id__ of the target HTML element will be used (if such is set). The id of the ReportViewer is used to identify the client session of the viewer when __persistSession__ is enabled (true);|
| __serviceUrl__ | *string*, *required when using the REST service*; Sets the address of the Report REST Service.|
| __reportServer__ | *JSON*, *required when using Report Server*; Sets the configuration details for Telerik Report Server. <br/>Available properties: <ul><li>__url__ (*string*, *required*) - The URL to the Telerik Report Server instance.</li><li>__getPersonalAccessToken__ (*callback function*, *optional*, *RS.NET specific*) - Specifies the callback function that returns the token for authentication against the Telerik Report Server for .NET instance, wrapped in a [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).</li><li>__username__ (*string*, *optional*) - A registered username in Report Server that is used to get access to reports. If omitted when connecting to Report Server for .NET Framework 4.6.2, the built-in __Guest__ account is used.</li><li>__password__ (*string*, *optional*) - The password for the provided username. You can omit it only when connecting with the __Guest__ account of Report Server for .NET Framework 4.6.2.</li></ul>|
| __templateUrl__ | *string*, *optional*; Sets the address of the HTML page that contains the viewer templates. If omitted, the default template is downloaded from the REST service.|
| __reportSource__ | *JSON*, *optional*; Sets the report and initial report parameter values for the viewer to be displayed. Available properties: <ul><li>*report* - a string that represents a report on the server. On the server side, this string will be converted to a [ReportSource](/api/Telerik.Reporting.ReportSource) through an [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver). That said this string may contain everything as far as the [Telerik Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview) knows how to convert to the source of a report that will be passed to the report engine for further processing. For example, this may be an assembly-qualified type name that can be converted to [TypeReportSource](/api/Telerik.Reporting.TypeReportSource), a path to a report definition file (.trdp/.trdx) as in the [UriReportSource](/api/Telerik.Reporting.UriReportSource), or even a report id that a dedicated IReportSourceResolver will use to read the report definition stored in a database in xml format and converted to a [XmlReportSource](/api/Telerik.Reporting.XmlReportSource).<br/>When using the viewer with **Report Server**, the *report* should be provided in the format: `report: "{Category}/{ReportName}"`, where `{Category}` and `{ReportName}` are the actual names of the category and report as explained in [Using the HTML5 Report Viewer with the Report Server](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server).</li> <li>*parameters* - a JSON object with properties name/value equal to the report parameters’ names and values used in the report definition;</li></ul>|
| __sendEmail__ | *object*, *required to show the Send Mail Message toolbar button*; Available properties: <ul><li>__enabled__ (*bool*, *required*) - Indicates whether to show the Send Mail Message toolbar button.<br/>Default value: false.</li> <li>__from__ (*string*, *optional*) - E-mail address used for the MailMessage FROM value.</li> <li>__to__ (*string*, *optional*) - E-mail address used for the MailMessage TO value.</li> <li>__cc__ (*string*, *optional*) - E-mail address used for the MailMessage Carbon Copy value.</li> <li>__subject__ (*string*, *optional*) - A string used for the MailMessage Subject value.</li> <li>__body__ (*string*, *optional*) - Sentences used for the MailMessage Content value.</li> <li>__format__ (*string*, *optional*) - The preselected report document format.</li></ul>|
| __scale__ | *number*, *optional*; Sets the scale factor for the report pages. The scale takes effect when __scaleMode__ is set to *“SPECIFIC”*.<br/>Default value is 1.0 (100%);|
| __scaleMode__ | *string*, *optional*; Sets how report pages are scaled. Available options are: <ul><li>*“FIT_PAGE_WIDTH”* - Pages are scaled proportionally to fit the entire width in the viewer's viewport.</li> <li>*“FIT_PAGE”* - Pages are scaled proportionally to fit the entire page in the viewport.</li> <li>*“SPECIFIC”* - Pages are scaled with the __scale__ value.<br/>Default value: *“FIT_PAGE”*.</li></ul>|
| __viewMode__ | *string*, *optional*; Sets whether the report is displayed in interactive mode or print preview. <br/>The available values are: <ul><li>*“INTERACTIVE”* - Enables drill-down interactivity and similar features.</li> <li>*“PRINT_PREVIEW”* - The report is paged according to the page settings. For more information, see [Interactive vs. Print Layout](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout). <br/>Default value: *'Interactive'*.</li></ul>|
| __pageMode__ | *string*, *optional*; Sets whether the report is displayed in single-page or continuous-scroll mode. <br/>The available values are: <ul><li>*“SINGLE_PAGE”* - Only one page is loaded in the viewport.</li> <li>*“CONTINUOUS_SCROLL”* - More than one page can be loaded in the viewport. <br/>Default value: *'CONTINUOUS_SCROLL'*.</li></ul>|
| __printMode__ | *string*, *optional*; Specifies whether the viewer will use the PDF plug-in of the browser for printing, or will directly export to a PDF file containing a special 'print' script. <br/>The available values are: <ul><li>*"AUTO_SELECT"* - the widget will try to automatically determine whether to export the report document or use the browser's PDF plug-in. First, the viewer widget tries to use the PDF plug-in of the browser for printing. When it is not available or not supported, the widget falls back to exporting to a PDF file containing a special 'print' script;</li> <li>*"FORCE_PDF_PLUGIN"* - the widget will always try to use the PDF plug-in of the browser. If the browser doesn't have a PDF plug-in or it does not support the 'print' script nothing will happen;</li> <li>*"FORCE_PDF_FILE"* - the widget will always export the report document to a PDF file with a special 'print' script;</li></ul>Default value is: *"AUTO_SELECT"*.|
| __parametersAreaPosition__ | *string*, *optional*. Specifies where the parameters area is displayed. <br/>The available values are: <ul><li>*“RIGHT”*</li> <li>*“TOP”*</li> <li>*“LEFT”*</li> <li>*“BOTTOM”*</li></ul>Default value: *RIGHT*.|
| __documentMapAreaPosition__ | *string*, *optional*. Specifies where the document map is displayed. <br/>The available values are: <ul><li>*“RIGHT”*</li> <li>*“LEFT”*</li></ul>Default value: *LEFT*.|
| __persistSession__ | *boolean*, *optional*. Sets whether the viewer's client session is persisted between page refreshes (for example, postbacks). The session is stored in the browser's [sessionStorage](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Storage) and is available for the duration of the page session. A page session lasts as long as the browser is open and survives page reloads and restores. Opening a page in a new tab or window starts a new session.<br/>The viewer's state is persisted in the global `sessionStorage` object under a key defined by the viewer's __id__. To load the correct session after a page reload, use the same __id__ as in the first load. Set the viewer's __id__ or the target element's id to a constant value that does not change during the page lifecycle.<br/>Default value: *false*.|
| __parameters__ | *object*, *optional*; Allows the user to define parameter options for the report parameters. <br/><table><thead><tr><th>Option</th><th>Description</th></tr></thead><tbody><tr><td><strong>editors</strong></td><td><em>object</em>, <em>optional</em>; Allows the user to define editor types for the report parameters. <br/>The available editors are: <ul><li>__singleSelect__ (*string*, *optional*) - Defines the editor type for single-select parameters. <br/>The available values are: <ul><li>*“COMBO_BOX”* - Uses [Kendo UI ComboBox](https://docs.telerik.com/kendo-ui/api/javascript/ui/combobox) as an editor.</li> <li>*“LIST_VIEW”* - Uses [Kendo UI ListView](https://docs.telerik.com/kendo-ui/api/javascript/ui/listview) as an editor.</li></ul>Default value: *'LIST_VIEW'*</li> <li>__multiSelect__ (*string*, *optional*) - Defines the editor type for multiselect parameters.<br/>The available values are: <ul><li>*“COMBO_BOX”* - Uses [Kendo UI MultiSelect](https://docs.telerik.com/kendo-ui/api/javascript/ui/multiselect) as an editor.</li> <li>*“LIST_VIEW”* - Uses [Kendo UI ListView](https://docs.telerik.com/kendo-ui/api/javascript/ui/listview) as an editor.</li></ul>Default value: *'LIST_VIEW'*</li></ul><pre><code>$("#reportViewer1").telerik_ReportViewer({...parameters: {editors: {multiSelect: telerikReportViewer.ParameterEditorTypes.COMBO_BOX,}}});</code></pre></td></tr></tbody></table>|
| __parameterEditors__ | *array*, *optional*; Allows the user to define custom editors for the report parameters.|
| __authenticationToken__ | *string*, *optional*; If provided, a *Bearer* token is set in the *Authorization* header for requests to the REST service. The token is not sent when requesting [document resources](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-resource) because resources such as images use relative URLs in the HTML of the report document. The browser makes these requests.|
| __enableAccessibility__ | *boolean*, *optional*. Determines whether the viewer should provide support for accessibility features. You can find more detailed information in the article [Accessibility Overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/accessibility). <br/>Default value: *false*;|
| __parametersAreaVisible__ | *boolean*, *optional*. Determines whether the viewer's parameters area is initially displayed if any parameter editor exists. The user can expand the parameters area even if it is hidden initially, either through the splitter control or the toolbar menu. This property determines only whether the element with the *visible* report parameters is visible on the page. Even when the setting is **false**, the parameters area is still rendered to the [Document Object Model (DOM)](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model). If a report parameter contains sensitive information that must not be accessible publicly, set its [Visible](/api/Telerik.Reporting.ReportParameter#Telerik_Reporting_ReportParameter_Visible) property to **false** instead. This prevents the report parameter from being rendered in the DOM regardless of the __parametersAreaVisible__ setting. <br/>Default value: *true*.|
| __documentMapVisible__ | *boolean*, *optional*. Determines whether the viewer's document map is displayed if any bookmark is defined. <br/>Default value: *true*;|
| __searchMetadataOnDemand__ | *boolean*, *optional*. Determines whether the search metadata will be delivered on demand __(true)__ or by default __(false)__. <br/>Default value: *false*;|
| __initialPageAreaImageUrl__ | *string*, *optional*. The image URL for the PageArea background image. Used only when the parameter values are missing or invalid. The image should be in __PNG__, __GIF__, or __JPG__ file format.|
| __keepClientAlive__ | *boolean*, *optional*. Determines whether the client is kept alive. When set to true, it prevents client expiration by continually sending a request to the server as determined by the Reporting REST service's __ClientSessionTimeout__. <br/>Default value: *true*.|
| __selector__ | *string*, *optional*. A selector used in conjunction with the data- attributes. Whenever a command is attached to an element outside of the report viewer via the data-attributes this selector must be provided.|
| __disabledButtonClass__ | *string*, *optional*. A class used in conjunction with the data- attributes. Whenever a command is in the disabled state, this class will be added to the respective button.|
| __checkedButtonClass__ | *string*, *optional*. A class used in conjunction with the data- attributes. Whenever a command is in the checked state, this class will be added to the respective button.|
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
| __interactiveActionExecuting__ | *function(e, args)*, *optional*; A callback function called before an interactive action is executed. You can use it to cancel the execution.|
| __interactiveActionEnter__ | *function(e, args)*, *optional*; A callback function called when the mouse cursor enters the area of an interactive action.|
| __interactiveActionLeave__ | *function(e, args)*, *optional*; A callback function called when the mouse cursor leaves the area of an interactive action.|

## Examples

To initialize the HTML5 Report Viewer with a REST service, set at least `serviceUrl` and `reportSource`:

```javascript
$("#reportViewer1").telerik_ReportViewer({
	serviceUrl: "api/reports",
	reportSource: { report: "Product Catalog.trdp" }
});
```

To get the `ReportViewer` object from the DOM, use the following code:

```javascript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
```

## See Also

* [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
* [Printing Reports](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports)
