---
title: Send Telerik Report in an E-Mail
description: Export Telerik Report in an E-Mail.
type: how-to
page_title: Attach Telerik Report in an E-Mail
slug: send-telerik-report-in-an-e-mail
res_type: kb
---

> Since [R3 2018 (12.2.18.912)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2018-12-2-18-912) release this feature is supported out of the box. For more information, see the [Send Mail Message]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/send-mail-message%}) help article.

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5-based Report Viewers</td>
	</tr>
</table>

## Description

Telerik Reports can be exported in various formats including HTML. The HTML rendering is used by web viewers as well. Browsers handle correctly the HTML and the passed CSS, but to use it in an e-mail the result HTML and CSS have to be adjusted based on the selected mail client.

## Solution

The approach that we recommend is to export a report in a format like PDF. Then to attach the exported report to the e-mail, instead of placing the content as HTML. An example is available in the [Send Telerik Report as email attachment](https://www.telerik.com/support/code-library/send-telerik-report-as-email-attachment) code library post.

## Notes

In case using HTML is a requirement, you can [export a report programmatically]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) in [HTML5 or HTML5Interactive format]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}), and adjust the HTML/CSS to cover the requirements of the used e-mail client.

## See Also

* [How to design a cross-client / browser compatible email](http://stackoverflow.com/questions/1531630/how-to-design-a-cross-client-browser-compatible-email)
