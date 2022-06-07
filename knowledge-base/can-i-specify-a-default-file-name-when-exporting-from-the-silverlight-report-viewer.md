---
title: Can I specify a default file name when exporting from the Silverlight report viewer?
description: Can I bind a default file name when exporting from the Silverlight report viewer?. 
type: how-to
page_title: Can I set a default file name when exporting from the Silverlight report viewer?
slug: can-i-specify-a-default-file-name-when-exporting-from-the-silverlight-report-viewer
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>Silverlight</td>
		</tr>
	</tbody>
</table>


## Description 

 One cannot use the report name or specify a default file name when exporting from the Silverlight report viewer.  
   
## Solution

By design, the [Report.DocumentName](../p-telerik-reporting-report-documentname) property is used as a default file name for all exported files from the Telerik report viewers. 

However, in Silverlight the *SaveFileDialog.[DefaultFileName](http://msdn.microsoft.com/en-us/library/system.windows.controls.savefiledialog.defaultfilename%28v=vs.95%29.aspx)* setting is treated as security vulnerability. Thus, the **DefaultFileName** is only applied for [trusted applications](http://msdn.microsoft.com/en-us/library/ee721083%28v=vs.95%29.aspx).

### See Also

[Microsoft Connect](http://connect.microsoft.com/VisualStudio/feedback/details/690502/savefiledialog-security-warning). 
