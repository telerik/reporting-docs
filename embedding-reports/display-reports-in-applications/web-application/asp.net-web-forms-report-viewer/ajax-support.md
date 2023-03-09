---
title: AJAX Support
page_title: AJAX Support in ASP.NET WebForms Report Viewer
description: "Learn how AJAX requests are supported by the ASP.NET WebForms Report Viewer and which scenarios one may want to use them."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/ajax-support
tags: ajax,support
published: True
position: 5
previous_url: /asp-net-report-viewer-ajax
---

# AJAX Support Overview

> This is a legacy report viewer and for new projects our recommendation is to use the latest WebForms Report Viewer - [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})

The main idea of Ajax requests is the elimination of full-page postbacks. In contrast, only the relevant parts of the page are updated, without a disturbing refresh. The markup that is transferred between the client machine and the server is reduced dramatically, which results in a significant performance improvement.

The Web ReportViewer can work both __Telerik RadAjax__ and the native __ASP.NET AJAX__ frameworks. Generally, you do not have to apply ajax for the Web ReportViewer itself as all its commands are issued through an http handler and update only the report/report parameters areas and not the entire page.

So when might you need to use ajax in conjunction with the web report viewer? A valid case is when you want to change the Report on another control action e.g. button click.

## Issue Ajax Request through Telerik RadAjaxManager

Add the instance of the ReportViewer to a [`RadAjaxManager`](https://docs.telerik.com/devtools/aspnet-ajax/controls/ajaxmanager/overview) control. You can optionally provide it with a loading panel, as shown below:

````XML
<asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
<telerik:ReportViewer ID="ReportViewer1" runat="server"></telerik:ReportViewer>
<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
	<AjaxSettings>
		<telerik:AjaxSetting AjaxControlID="Button1">
			<UpdatedControls>
				<telerik:AjaxUpdatedControl ControlID="ReportViewer1"/>
			</UpdatedControls>
		</telerik:AjaxSetting>
	</AjaxSettings>
</telerik:RadAjaxManager>
````

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.cs region=Webviewer_SetReportSourceOnByttonClick}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.vb region=Webviewer_SetReportSourceOnByttonClick}}

## Issue Ajax Request through ASP.NET AJAX UpdatePanel

Wrap the instance of the ReportViewer into an [`UpdatePanel`](https://learn.microsoft.com/en-us/dotnet/api/system.web.ui.updatepanel?view=netframework-4.8.1) [ContentTemplate](https://learn.microsoft.com/en-us/dotnet/api/system.web.ui.updatepanel.contenttemplate?view=netframework-4.8):

````XML
<asp:ScriptManager ID="ScriptManager1" runat="server" />
<asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<Triggers>
		<asp:AsyncPostBackTrigger ControlID="Button1" />
	</Triggers>
	<ContentTemplate>
		<telerik:ReportViewer ID="ReportViewer1" runat="server">
		</telerik:ReportViewer>
	</ContentTemplate>
</asp:UpdatePanel>
````

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.cs region=Webviewer_SetReportSourceOnByttonClick}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.vb region=Webviewer_SetReportSourceOnByttonClick}}

## See Also

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%})
* [How to Add report viewer to a web page]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page%})
* [Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/report-viewer-localization%})
* [Deploying Web ReportViewer in SharePoint]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/deploying-web-reportviewer-in-sharepoint%})
* [Medium Trust Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/medium-trust-support%})
