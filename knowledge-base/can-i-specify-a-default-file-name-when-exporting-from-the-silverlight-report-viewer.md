---
title: Can I specify a default file name when exporting from the Silverlight report viewer?
description: Can I specify a default file name when exporting from the Silverlight report viewer?. 
type: how-to
page_title: Can I specify a default file name when exporting from the Silverlight report viewer?
slug: can-i-specify-a-default-file-name-when-exporting-from-the-silverlight-report-viewer
res_type: kb
---


## Problem  
 One cannot use the report name or specify a default file name when exporting from the Silverlight report viewer.  
   
## Solution  
 By design the [Report.DocumentName](../p-telerik-reporting-report-documentname) property
is used as a default file name for all exported files from the Telerik report viewers. However in Silverlight the *SaveFileDialog.[DefaultFileName](http://msdn.microsoft.com/en-us/library/system.windows.controls.savefiledialog.defaultfilename%28v=vs.95%29.aspx)* setting is treated as security vulnerability. Thus the DefaultFileName is only applied for [trusted applications](http://msdn.microsoft.com/en-us/library/ee721083%28v=vs.95%29.aspx). For more information: [Microsoft Connect](http://connect.microsoft.com/VisualStudio/feedback/details/690502/savefiledialog-security-warning). 
