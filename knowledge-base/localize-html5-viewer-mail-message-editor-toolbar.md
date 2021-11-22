---
title: How to Localize the Html5 Viewer's Mail Message Editor Toolbar
description: How to localize the toolbar of the Kendo Editor used in the Text Area of the Mail Message Template
type: how-to
page_title: Localize the Mail Message Text Area of the Html5 Viewer
slug: localize-html5-viewer-mail-message-editor-toolbar
position: 
tags: 
ticketid: 1542316
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
The TextArea of the email message template is a [Kendo Editor](../../kendo-ui/controls/editors/editor/overview), which toolbar cannot be localized with the general 
localization approach for the Html5 Viewer that is described in the [Localization](../html5-report-viewer-localization) article.

## Solution
The Kendo Editor can be localized as explained in the [Localization in jQuery Editor Widget](https://demos.telerik.com/kendo-ui/editor/localization) article. 
You need to add the following code in the head section of the page with the viewer just before adding the viewer's script:

```HTML
<script src="https://kendo.cdn.telerik.com/2021.3.1109/js/messages/kendo.messages.bg-BG.min.js"></script>
<meta charset="utf-8">
```
The localization script replaces the default messages in the widget prototype with their equivalent translations. The above script refers to 'bg-BG' culture, i.e. the 
Bulgarian language. For other languages, the file has to be named by following the __kendo.messages.\<language>.min.js__ convention. You may check the available translations in 
the [Kendo GitHub repository](https://github.com/telerik/kendo-ui-core/tree/master/src/messages).
The meta tag with the encoding is needed in order to display the toolbar messages' special symbols correctly in most languages.

## See Also
- [Localization of the Html5 Report Viewer](../html5-report-viewer-localization) 

- [Localization in jQuery Editor Widget](https://demos.telerik.com/kendo-ui/editor/localization) 
