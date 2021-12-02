---
title: AJAX support
page_title: AJAX support | for Telerik Reporting Documentation
description: AJAX support
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/ajax-support
tags: ajax,support
published: True
position: 5
---

# AJAX support



>note This is a legacy report viewer and for new projects our recommendation is to use the latest web forms report viewer -           [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})


The main idea of Ajax requests is the elimination of full-page postbacks. In contrast, only the relevant parts of the       	page are updated, without a disturbing refresh. The markup that is transferred between the client machine and the server is reduced        	dramatically, which results in a significant performance improvement.

The Web ReportViewer can work both __Telerik RadAjax__  and the native __ASP.NET AJAX__  frameworks.      	Generally you do not have to apply ajax for the Web ReportViewer itself as all its commands are issued through an http handler      	and update only the report/report parameters areas and not the entire page.

So when might you need to use ajax in conjunction with the web report viewer? A valid case is when you want to change the     	Report on another control action e.g. button click.

## Issue Ajax Request through Telerik RadAjaxManager

Add the instance of the ReportViewer to a __RadAjaxManager__  control.  				You can optionally provide it with a loading panel, as shown below: 			

	
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
````C#
	        protected void Button1_Click(object sender, EventArgs e)
	        {
	            var typeReportSource = new Telerik.Reporting.TypeReportSource();
	            typeReportSource.TypeName = "Telerik.Reporting.Examples.CSharp.ListBoundReport, CSharp.ReportLibrary";
	            this.ReportViewer1.ReportSource = typeReportSource;
	        }
````
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.vb region=Webviewer_SetReportSourceOnByttonClick}}
````VB
	    Protected Sub Button1_Click(sender As Object, e As EventArgs)
	        Dim typeReportSource As New Telerik.Reporting.TypeReportSource()
	        typeReportSource.TypeName = "ListBoundReport, VB.ReportLibrary"
	        ReportViewer1.ReportSource = typeReportSource
	    End Sub
````



## Issue Ajax Request through ASP.NET AJAX UpdatePanel

Wrap the instance of the ReportViewer into UpdatePanel ContentTemplate:

	
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
````C#
	        protected void Button1_Click(object sender, EventArgs e)
	        {
	            var typeReportSource = new Telerik.Reporting.TypeReportSource();
	            typeReportSource.TypeName = "Telerik.Reporting.Examples.CSharp.ListBoundReport, CSharp.ReportLibrary";
	            this.ReportViewer1.ReportSource = typeReportSource;
	        }
````
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.vb region=Webviewer_SetReportSourceOnByttonClick}}
````VB
	    Protected Sub Button1_Click(sender As Object, e As EventArgs)
	        Dim typeReportSource As New Telerik.Reporting.TypeReportSource()
	        typeReportSource.TypeName = "ListBoundReport, VB.ReportLibrary"
	        ReportViewer1.ReportSource = typeReportSource
	    End Sub
````



# See Also


 * [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%})

 * [How to Add report viewer to a web page]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page%})

 * [Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/report-viewer-localization%})

 * [Deploying Web ReportViewer in SharePoint]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/deploying-web-reportviewer-in-sharepoint%})

 * [Medium Trust Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/medium-trust-support%})
