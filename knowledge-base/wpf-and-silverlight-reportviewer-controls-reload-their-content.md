---
title: WPF and Silverlight ReportViewer controls reload their content
description: WPF and Silverlight ReportViewer controls reload their content. 
type: how-to
page_title: WPF and Silverlight ReportViewer controls reload their content
slug: wpf-and-silverlight-reportviewer-controls-reload-their-content
res_type: kb
---

## Desctiption  

WPF and Silverlight ReportViewer controls reload their content.  
    
When you interact with the container of the WPF|Silverlight ReportViewer like changing its dock position, there are changes in the elements loaded in the visual tree. The consequence for the WPF|Silverlight ReportViewer control is that the displayed report is re-processed and re-rendered.  
  
## Solution
 Telerik UI for WPF and Telerik UI for Silverlight provide RadTabControl allowing you to preserve the content on interaction with tabs:   

- <a href="../../devtools/silverlight/controls/radtabcontrol/overview2" target="_blank">Telerik UI for Silverlight RadTabControl</a>
- <a href="../../devtools/wpf/controls/radtabcontrol/overview2" target="_blank">Telerik UI for WPF RadTabControl</a>

 More details about the required settings are available in <a href="../../devtools/wpf/controls/radtabcontrol/howto/how-to-keep-content" target="_blank">RadTabControl: How to Keep the Content State</a>.

