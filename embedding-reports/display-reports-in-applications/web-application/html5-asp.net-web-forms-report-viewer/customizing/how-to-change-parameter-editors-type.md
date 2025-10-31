---
title: Parameter Editors
page_title: Changing Parameter Editors Type in HTML5 ASP.NET WebForms ReportViewer
description: "Learn How to Change Parameter Editors Type of the HTML5 ASP.NET WebForms ReportViewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-change-parameter-editors-type
tags: how,to,change,parameter,editors,type
published: True
reportingArea: WebFormsWrapper
position: 3
previous_url: /html5-webforms-report-viewer-change-parameters-editors-type
---

# Changing Parameter Editors Type of the HTML5 WebForms Report Viewer

The article elaborates how to change the default parameters editors types for visible parameters in the HTML5 ASP.NET WebForms Report Viewer's Parameters Area.

The parameters editors types are defined through the Parameters element when creating the Telerik Report Viewer widget.

The following example illustrates how to set the Parameters method to the Telerik Report Viewer widget.

````XML
<telerik:ReportViewer EnableAccessibility="false" ID="reportViewer1" runat="server">
	<Parameters>
		<Editors SingleSelect="ComboBox" MultiSelect="ComboBox"></Editors>
	</Parameters>
</telerik:ReportViewer>
````


> The Telerik Report Viewer `Parameters` element is optional. If not used, the Telerik Report Viewer will fall back to the default values.

## See Also

* [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})
* [How To: Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
