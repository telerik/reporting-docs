---
title: How to Change Parameter Editors Type
page_title: How to Change Parameter Editors Type | for Telerik Reporting Documentation
description: How to Change Parameter Editors Type
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-change-parameter-editors-type
tags: how,to,change,parameter,editors,type
published: True
position: 3
---

# How to Change Parameter Editors Type



The article elaborates how to change the default parameters editors types for visible parameters in the HTML5 Viewer's Parameters Area.       

## 

The parameters editors types are defined through the Parameters element when creating the Telerik Report Viewer widget.           The available parameter editors on which the type could be changed are:         

The following example illustrates how to set the Parameters method to the Telerik Report Viewer widget.         

	
````xml
          <telerik:ReportViewer Width="" Height="" EnableAccessibility="false"
            ID="reportViewer1"
            runat="server">
            ...
            <Parameters>
                <Editors SingleSelect="ComboBox" MultiSelect="ComboBox"></Editors>
            </Parameters>
        </telerik:ReportViewer>
````



>tip The Telerik Report Viewer Parameters element is optional. If it is not used, the Telerik Report Viewer will fall back to the default values.         


# See Also


 * [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})

 * [How To: Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
