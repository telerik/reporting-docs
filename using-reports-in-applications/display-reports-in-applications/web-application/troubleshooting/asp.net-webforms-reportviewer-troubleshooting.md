---
title: ASP.NET WebForms ReportViewer Troubleshooting
page_title: ASP.NET WebForms ReportViewer Troubleshooting | for Telerik Reporting Documentation
description: ASP.NET WebForms ReportViewer Troubleshooting
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/troubleshooting/asp.net-webforms-reportviewer-troubleshooting
tags: asp.net,webforms,reportviewer,troubleshooting
published: True
position: 1
---

# ASP.NET WebForms ReportViewer Troubleshooting



The old ASP.NET WebForms ReportViewer control is obsolete as of  [Telerik Reporting Q3 2015](http://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q3-2015-version-9-2-15-930) .         The main reasons for this decision: the viewer uses extensively IFRAME and TABLE elements in its structure,         the viewer uses the ASP.NET Session to preserve resources between requests, the viewer is suitable only for WebForms projects.       

The  article discusses how to troubleshoot comonly met issues result the above listed reasons.

The old ASP.NET WebForms ReportViewer displays content rendered through the [           Reporting HTML Rendering nmechanism         ]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/html-rendering-design-considerations%}).       

## Report is unavailable or session has expired error message

The old ASP.NEt WebForms ReportViewer depends on the ASP.NET Session.           If the session expires the page with the viewer will have to be refreshed.         

Other possible reasons for getting a session Expired message are discussed in the  [Report is unavailable or session has expired error message](http://www.telerik.com/support/kb/reporting/deliver-reports-to-any-application/details/report-is-unavailable-or-session-has-expired-error-message)  KB article.         

## Reports do not display data or changes applied in events.

The old ASP.NET WebForms ReportViewer depends on the ASP.NET Session.           Depending on the  [session state mode](https://msdn.microsoft.com/en-us/library/ms178586.aspx)  of the application reports may require           additional settings - [Design Considerations for Out-proc Session State ]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/using-out-proc-session-state/overview%}).         

## The old ASP.NET Webforms ReportViewer does not display reports after refresh.

The old ASP.NET WebForms ReportViewer displays content delivered by its Telerik.ReportViewer.axd handler.           Verify the handler is registered in both *system.Web*  and *system.webServer*  sections -           [How to: Add report viewer to a web page]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page%}),           and that the viewer is added in a valid [AJAX Scenario]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/ajax-support%}).         

In case of using Visual Studio 2013 or greater version,  [disable the BrowserLink feature.](http://www.asp.net/visual-studio/overview/2013/using-browser-link) .         

## The old ASP.NET Webforms ReportViewer does not display reports or the page area is messed on iPad or other mobile device.

The old ASP.NET WebForms ReportViewer displays content via IFRAME and TABLE elements in browser.           This may result in unexpected layout in modern HTML5-compliant browsers.           The solution is to use an older DOCTYPE declaration -  [Blank report in ASP.NET ReportViewer on iPad/iPhone](http://www.telerik.com/support/kb/reporting/details/blank-report-in-asp.net-reportviewer-on-ipad-iphone) .         

## The styles of the ASP.NET WebForms ReportViewer's toolbar and content are messed up.

The old ASP.NET WebForms ReportViewer displays content delivered by its Telerik.ReportViewer.axd handler.           Check if the handler is registered correctly and if the browser's proxy and security settings allow it to deliver content -  [The styles of the web report viewer's toolbar are messed up](http://www.telerik.com/support/kb/reporting/details/the-styles-of-the-web-report-viewer-s-toolbar-are-messed-up) .         

In case of using authorization, verify that the Telerik.ReportViewer.axd handler's path is allowed for the user -  [HOW TO: Control Authorization Permissions in an ASP.NET Application](https://support.microsoft.com/en-us/kb/316871) .         

## The ASP.NET WebForms ReportViewer does not display a report that uses Table/List/Crosstab item in Internet Explorer.

In case data visualized by the [Table/List/Crosstab item]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%})           results in a great number of HTML elements, Internet Explorer may fail to visualize the content. solutions are suggested in           [Design Considerations for HTML Rendering (Browsers Limitations)]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/html-rendering-design-considerations%}).         

## The ASP.NET WebForms ReportViewer malfunctions when its ClientIDMode is set to Static.

The old ASP.NET WebForms ReportViewer has a complex structure,           where partially the functionality depends on JavaScript delivered by its HTTP handlers.           Setting the control's ClientIDMode to Static may lead to improper execution of these JavaScript methods. For more details, check            [ClientIDMode in ASP.NET 4.0](https://weblog.west-wind.com/posts/2009/Nov/07/ClientIDMode-in-ASPNET-40)  by Rick Strahl for Web Log.         

## Error message on adding a viewer in Visual Studio: "The ReportViewer control failed to setup the http handler in the web.config file. You may experience troubles when viewing the report. Exception details: Unable to cast COM object of type 'System.__ComObject' to class type 'Telerik.Reporting.Vs.Common.AssemblyReference'. Instances of types that represent COM components cannot be cast to types that do not represent COM components; however they can be cast to interfaces as long as the underlying COM component supports QueryInterface calls for the IID of the interface."

Web Sites handle assembly references differently and Telerik Reporting Wizards and Designers are not designed to work with such settings.           You can manually add viewers or upgrade the Web Site. Reports should be designed in an external ClassLibrary project referenced by the Web Site project.         

# See Also

