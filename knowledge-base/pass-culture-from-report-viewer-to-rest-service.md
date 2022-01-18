---
title: How to Pass Culture to the Telerik Reporting REST Service from the Report Viewer
description: How to request reports with specific culture from the Report Viewer using REST Service
type: how-to
page_title: Pass Culture from the Report Viewer to the REST Service
slug: pass-culture-from-report-viewer-to-rest-service
position: 
tags: 
ticketid: 1515697
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
			<td>Report Viewers</td>
			<td>HTML5-based, WPF, WinForms</td>
		</tr>
	</tbody>
</table>


## Description
The reports are rendered with the culture of the REST Service. If you need to request a report with specific culture from the Report Viewer, you may use the following approaches.

## Solution

### WPF and WinForms Report Viewers
You may pass the culture to the Telerik Reporting REST Service in the [RenderingBegin event of the WPF/Winforms Viewer](../e-telerik-reportviewer-wpf-reportviewer-renderingbegin). The argument [Telerik.ReportViewer.Common.RenderingBeginEventArgs](../t-telerik-reportviewer-common-renderingbegineventargs) _args_ has a [DeviceInfo](../p-telerik-reportviewer-common-renderingbegineventargs-deviceinfo) property, where you may set the new culture with a code like:
```CSharp
private void ReportViewer1_RenderingBegin(object sender, Telerik.ReportViewer.Common.RenderingBeginEventArgs args)
{
    string culture = "yourCulture";
    args.DeviceInfo["CurrentCulture"] = culture;
    args.DeviceInfo["CurrentUICulture"] = culture;
}
```

### HTML5-based Report Viewers
The HTML5-based report viewers also have a [renderingBegin(e, args) event](../t-telerik-reportviewer-common-renderingbegineventargs) with second argument(*args*) that has a **deviceInfo** propery that may be used to pass the culture to the report. For example:

```js
    renderingBegin(e, { deviceInfo }) {
        const culture = "yourCulture"
        deviceInfo["CurrentCulture"] = culture;
        deviceInfo["CurrentUICulture"] = culture;
    }
```
## Notes
You need to have the [Report localized](../advanced-localizing-reports) for the corresponding "yourCulture".  

Another approach you may use is through a [custom User Function](../expressions-user-functions) - see the article section [Centralizing the localization of reports](../advanced-localizing-reports#centralizing-the-localization-of-reports) for details.
