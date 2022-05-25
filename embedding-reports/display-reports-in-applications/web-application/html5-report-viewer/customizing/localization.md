---
title: Localization
page_title: Localization 
description: Localization
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization
tags: localization
published: True
position: 2
---

# Localization

The article elaborates on how to localize the messages displayed by the HTML5 Report Viewer. This feature is available since version [R2 2018 SP1 (12.1.18.620)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620). 

1. To localize the report viewer messages, create a new JavaScript file using the following code snippet:
    
      ````js
(function (trv, $) {
    "use strict";
    var sr = {
        //warning and error string resources
        controllerNotInitialized: 'Controller is not initialized.',
        noReportInstance: 'No report instance.',
        missingTemplate: '!obsolete resource!',
        noReport: 'No report.',
        noReportDocument: 'No report document.',
        missingOrInvalidParameter: 'Missing or invalid parameter value. Please input valid data for all parameters.',
        invalidParameter: 'Please input a valid value.',
        invalidDateTimeValue: 'Please input a valid date.',
        parameterIsEmpty: 'Parameter value cannot be empty.',
        cannotValidateType: 'Cannot validate parameter of type {type}.',
        loadingFormats: 'Loading...',
        loadingReport: 'Loading report...',
        preparingDownload: 'Preparing document to download. Please wait...',
        preparingPrint: 'Preparing document to print. Please wait...',
        errorLoadingTemplates: "Error loading the report viewer\'s templates. (templateUrl = '{0}').",
        errorServiceUrl: "Cannot access the Reporting REST service. (serviceUrl = '{0}'). Make sure the service address is correct and enable CORS if needed. (https://enable-cors.org)",
        loadingReportPagesInProgress: '{0} pages loaded so far...',
        loadedReportPagesComplete: 'Done. Total {0} pages loaded.',
        noPageToDisplay: "No page to display.",
        errorDeletingReportInstance: "Error deleting report instance: '{0}'.",
        errorRegisteringViewer: 'Error registering the viewer with the service.',
        noServiceClient: 'No serviceClient has been specified for this controller.',
        errorRegisteringClientInstance: 'Error registering client instance.',
        errorCreatingReportInstance: "Error creating report instance (Report = '{0}').",
        errorCreatingReportDocument: "Error creating report document (Report = '{0}'; Format = '{1}').",
        unableToGetReportParameters: 'Unable to get report parameters.',
        errorObtainingAuthenticationToken: 'Error obtaining authentication token.',
        clientExpired: "Click 'Refresh' to restore client session.",
        promisesChainStopError: "Error shown. Throwing promises chain stop error.",
        renderingCanceled: "Report processing was canceled.",
        //viewer template string resources
        parameterEditorSelectNone: 'clear selection',
        parameterEditorSelectAll: 'select all',
        parametersAreaPreviewButton: 'Preview',
        menuNavigateBackwardText: 'Navigate Backward',
        menuNavigateBackwardTitle: 'Navigate Backward',
        menuNavigateForwardText: 'Navigate Forward',
        menuNavigateForwardTitle: 'Navigate Forward',
        menuStopRenderingText: 'Stop Rendering',
        menuStopRenderingTitle: 'Stop Rendering',
        menuRefreshText: 'Refresh',
        menuRefreshTitle: 'Refresh',
        menuFirstPageText: 'First Page',
        menuFirstPageTitle: 'First Page',
        menuLastPageText: 'Last Page',
        menuLastPageTitle: 'Last Page',
        menuPreviousPageTitle: 'Previous Page',
        menuNextPageTitle: 'Next Page',
        menuPageNumberTitle: 'Page Number Selector',
        menuDocumentMapTitle: 'Toggle Document Map',
        menuParametersAreaTitle: 'Toggle Parameters Area',
        menuZoomInTitle: 'Zoom In',
        menuZoomOutTitle: 'Zoom Out',
        menuPageStateTitle: 'Toggle FullPage/PageWidth',
        menuPrintText: 'Print...',
        menuContinuousScrollText: 'Toggle Continuous Scrolling',
        menuSendMailText: 'Send an email',
        menuPrintTitle: 'Print',
        menuContinuousScrollTitle: 'Toggle Continuous Scrolling',
        menuSendMailTitle: 'Send an email',
        menuExportText: 'Export',
        menuExportTitle: 'Export',
        menuPrintPreviewText: 'Toggle Print Preview',
        menuPrintPreviewTitle: 'Toggle Print Preview',
        menuSearchText: 'Search',
        menuSearchTitle: 'Toggle Search',
        menuSideMenuTitle: 'Toggle Side Menu',
        sendEmailFromLabel: "From:",
        sendEmailToLabel: "To:",
        sendEmailCCLabel: "CC:",
        sendEmailSubjectLabel: "Subject:",
        sendEmailFormatLabel: "Format:",
        sendEmailSendLabel: "Send",
        sendEmailCancelLabel: "Cancel",
        //accessibility string resources
        ariaLabelPageNumberSelector: "Page number selector. Showing page {0} of {1}.",
        ariaLabelPageNumberEditor: "Page number editor",
        ariaLabelExpandable: "Expandable",
        ariaLabelSelected: "Selected",
        ariaLabelParameter: "parameter",
        ariaLabelErrorMessage: "Error message",
        ariaLabelParameterInfo: "Contains {0} options",
        ariaLabelMultiSelect: "Multiselect",
        ariaLabelMultiValue: "Multivalue",
        ariaLabelSingleValue: "Single value",
        ariaLabelParameterDateTime: "DateTime",
        ariaLabelParameterString: "String",
        ariaLabelParameterNumerical: "Numerical",
        ariaLabelParameterBoolean: "Boolean",
        ariaLabelParametersAreaPreviewButton: 'Preview the report',
        ariaLabelMainMenu: 'Main menu',
        ariaLabelCompactMenu: 'Compact menu',
        ariaLabelSideMenu: 'Side menu',
        ariaLabelDocumentMap: 'Document map area',
        ariaLabelDocumentMapSplitter: 'Document map area splitbar.',
        ariaLabelParametersAreaSplitter: 'Parameters area splitbar.',
        ariaLabelPagesArea: 'Report contents area',
        ariaLabelSearchDialogArea: 'Search area',
        ariaLabelSendEmailDialogArea: "Send email area",
        ariaLabelSearchDialogStop: 'Stop search',
        ariaLabelSearchDialogOptions: 'Search options',
        ariaLabelSearchDialogNavigateUp: 'Navigate up',
        ariaLabelSearchDialogNavigateDown: 'Navigate down',
        ariaLabelSearchDialogMatchCase: 'Match case',
        ariaLabelSearchDialogMatchWholeWord: 'Match whole word',
        ariaLabelSearchDialogUseRegex: 'Use regex',
        ariaLabelMenuNavigateBackward: 'Navigate backward',
        ariaLabelMenuNavigateForward: 'Navigate forward',
        ariaLabelMenuStopRendering: 'Stop rendering',
        ariaLabelMenuRefresh: 'Refresh',
        ariaLabelMenuFirstPage: 'First page',
        ariaLabelMenuLastPage: 'Last page',
        ariaLabelMenuPreviousPage: 'Previous page',
        ariaLabelMenuNextPage: 'Next page',
        ariaLabelMenuPageNumber: 'Page number selector',
        ariaLabelMenuDocumentMap: 'Toggle document map',
        ariaLabelMenuParametersArea: 'Toggle parameters area',
        ariaLabelMenuZoomIn: 'Zoom in',
        ariaLabelMenuZoomOut: 'Zoom out',
        ariaLabelMenuPageState: 'Toggle FullPage/PageWidth',
        ariaLabelMenuPrint: 'Print',
        ariaLabelMenuContinuousScroll: 'Continuous scrolling',
        ariaLabelMenuSendMail: 'Send an email',
        ariaLabelMenuExport: 'Export',
        ariaLabelMenuPrintPreview: 'Toggle print preview',
        ariaLabelMenuSearch: 'Search in report contents',
        ariaLabelMenuSideMenu: 'Toggle side menu',
        ariaLabelSendEmailFrom: "From email address",
        ariaLabelSendEmailTo: "Recipient email address",
        ariaLabelSendEmailCC: "Carbon Copy email address",
        ariaLabelSendEmailSubject: "Email subject:",
        ariaLabelSendEmailFormat: "Report format:",
        ariaLabelSendEmailSend: "Send email",
        ariaLabelSendEmailCancel: "Cancel sending email",
        //search dialog resources
        searchDialogTitle: 'Search in report contents',
        searchDialogSearchInProgress: "searching...",
        searchDialogNoResultsLabel: "No results",
        searchDialogResultsFormatLabel: "Result {0} of {1}",
        searchDialogStopTitle: 'Stop Search',
        searchDialogNavigateUpTitle: 'Navigate Up',
        searchDialogNavigateDownTitle: 'Navigate Down',
        searchDialogMatchCaseTitle: 'Match Case',
        searchDialogMatchWholeWordTitle: 'Match Whole Word',
        searchDialogUseRegexTitle: 'Use Regex',
        searchDialogCaptionText: 'Find',
        searchDialogPageText: 'page',
        // Send Email dialog resources
        sendEmailDialogTitle: "Send Email",
        sendEmailValidationEmailRequired: "Email field is required",
        sendEmailValidationEmailFormat: "Email format is not valid",
        sendEmailValidationSingleEmail: "The field accepts a single email address only",
        sendEmailValidationFormatRequired: "Format field is required",
        errorSendingDocument: "Error sending report document (Report = '{0}')."
    };
    trv.sr = $.extend(trv.sr, sr);
}(window.telerikReportViewer = window.telerikReportViewer || {}, jQuery));
````

1. Specify the name of the file using the following convention:resources.__[culture]__.js where *[culture]* is the name of the culture for the specified localization resource. For example, to provide a localization resource for the French Belgian culture, the corresponding resource file could be named as follows: *resources.fr-BE.js* 

1. Add the newly created JavaScript file to the ```<head>``` element of the page between jQuery and telerikReportViewer.js files: 
    
      ````html
<script src="resources.fr-BE.js" /script>
````

   >The localization file must be loaded on the page before viewer's script (i.e. *telerikReportViewer.js*) and after jQuery script.

1. Translate the texts for the specified culture

> To modify the HTML5 Viewer's HTML template that contains the toolbar, Preview, Parameters and DocumentMap areas, you will have to set the viewer's templateUrl. For more details, check [Providing Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates%}). 


# See Also

* [Localizing Reports]({%slug telerikreporting/designing-reports/localizing-reports%})

* [Localizing the Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/customizing/localization%})
