---
title: Formatting with the Telerik AJAX Editor
page_title: Using HTML from the Telerik RadEditor
description: "Learn how to filter the unsupported HTML tags or CSS attributes and use HTML from the Telerik UI for ASP.NET AJAX Editor to format the Telerik Reporting HtmlTextbox report item."
slug: telerikreporting/designing-reports/report-structure/htmltextbox/using-html-from-telerik-radeditor
tags: telerik, reporting, report, items, htmltextbox, using, html, from, ajax, radeditor, editor
previous_url: /report-items-html-text-box-using-html-from-radeditor
published: True
position: 7
reportingArea: General
---

# Using HTML from the Telerik UI for ASP.NET AJAX Editor

The HtmlTextBox supports text formatting options, such as a subset of HTML tags and CSS attributes, which are available only for styling labels and headers. Therefore, to avoid exceptions, you have to filter the unsupported HTML tags or CSS attributes.

This article outlines how to accomplish this scenario when the HTML data entry tool is the [Telerik UI for ASP.NET AJAX Editor](https://www.telerik.com/products/aspnet-ajax/editor.aspx).

Before you start, note the following considerations:

* Limit the options in the toolbar of the Editor.
* The Editor can automatically strip all HTML tags and allow plain text only. Allowing plain text only is important because, even if you limit the toolbar to certain actions, pasting rich-text will still be available by default.

To format the HtmlTextBox with the Telerik UI for ASP.NET AJAX Editor:

1. Use the markup below for the `ToolsFile.xml` file.

	````XML
<?xml version="1.0" encoding="utf-8" ?>
	<root>
		<modules>
			<module name="RadEditorStatistics" dockingZone="Bottom"/>
			<module name="RadEditorDomInspector" visible="false" />
			<module name="RadEditorNodeInspector" visible="false" />
			<module name="RadEditorHtmlInspector"  visible="false" />
		</modules>
		<tools name="MainToolbar">
			<tool name="Print" shortcut="CTRL+P"/>
			<tool name="AjaxSpellCheck"/>
			<tool name="FindAndReplace" shortcut="CTRL+F"/>
			<tool name="Cut" />
			<tool name="Copy" shortcut="CTRL+C"/>
			<tool name="Paste" shortcut="CTRL+V"/>
			<tool separator="true"/>
			<tool name="Undo" shortcut="CTRL+Z"/>
			<tool name="Redo" shortcut="CTRL+Y"/>
		</tools>
		<tools name="InsertToolbar" >
			<tool name="DocumentManager" />
			<tool separator="true"/>
			<tool name="LinkManager" shortcut="CTRL+K"/>
			<tool name="Unlink" shortcut="CTRL+SHIFT+K"/>
		</tools>
		<tools>
			<tool name="ForeColor"/>
			<tool name="BackColor"/>
			<tool name="FormatStripper"/>
		</tools>
		<tools>
			<tool name="FontName" shortcut="CTRL+SHIFT+F"/>
			<tool name="FontSize" shortcut="CTRL+SHIFT+P"/>
			<tool separator="true"/>
			<tool name="Bold" shortcut="CTRL+B"/>
			<tool name="Italic" shortcut="CTRL+I"/>
			<tool name="Underline" shortcut="CTRL+U"/>
			<tool separator="true"/>
			<tool name="JustifyLeft" />
			<tool name="JustifyCenter" />
			<tool name="JustifyRight" />
			<tool separator="true"/>
			<tool name="InsertOrderedList" />
			<tool name="InsertUnorderedList" />
			<tool name="SelectAll" shortcut="CTRL+A"/>
		</tools>
	</root>
````


1. Disable the `FixUlBoldItalic` filter because the inline text-decoration CSS property is not supported.

	````C#
RadEditor1.DisableFilter(Telerik.Web.UI.EditorFilters.FixUlBoldItalic);
````
	````VB
RadEditor1.DisableFilter(Telerik.Web.UI.EditorFilters.FixUlBoldItalic)
````


1. Disable the `ConvertFontToSpan` filter, which converts the non-XHTML compliant `Font` tags with `Span` tags, because the HtmlTextBox works with font tags.

	````C#
RadEditor1.DisableFilter(Telerik.Web.UI.EditorFilters.ConvertFontToSpan);
````
	````VB
RadEditor1.DisableFilter(Telerik.Web.UI.EditorFilters.ConvertFontToSpan)
````


1. Strip the HTML formatting from the pasted content, because users may paste content that is badly formatted and thus break the HtmlTextBox and its PDF export feature. To achieve this behavior, set the `StripFormattingOptions` property to `All` or to `AllExceptNewLines`.
1. Use the following custom content filter, which will remove unsupported HTML tags.

	The supported tags are `FONT`, `STRONG`, `B`, `EM`, `I`, `U`, `A`, `OL`, `UL`, `SUB`, `SUP`, `LI`, `DIV`, `SPAN`, `P`, `BR`, `CENTER`.

	````XML
<telerik:RadEditor ID="RadEditor1" StripFormattingOptions="AllExceptNewLines" ToolsFile="~/HtmlTextBoxToolsFile.xml" OnClientLoad="editorLoaded" runat="server">
	</telerik:RadEditor>
````
	````JavaScript
<script type="text/javascript">
		ReportingFilter = function()
		{
			ReportingFilter.initializeBase(this);
			this.set_isDom(false);
			this.set_enabled(true);
			this.set_name("ReportingFilter");
			this.set_description("Telerik Reporting HTML filter for RadEditor");
		}
		ReportingFilter.prototype =
		{
			getHtmlContent: function (content) {
				return this._removeHtmlTags(content);
			},
			getDesignContent: function (content) {
				return this._removeHtmlTags(content);
			},
			_removeHtmlTags: function (initContent) {
				var cleanContent;
				//Perform the necessary REGEX replacement to remove unsupported HTML tags.
				//The supported Telerik Reporting HTML tags are FONT, STRONG, B, EM, I, U, A, OL, UL, LI, DIV, SPAN, P, BR, and CENTER.
				//The HTML must be valid XHTML too. However, the Editor already provides that filter.
				//The following REGEX will remove all HTML tags EXCEPT those explicitly listed.
				cleanContent = initContent.replace(new RegExp("<(?!\/?(font|strong|b|em|(i(?!mg))|u|a|ol|ul|li|div|span|p|br|center)(?=>|\s?.*>))\/?.*?>", "ig"), "");
				return cleanContent;
			}
		}
		ReportingFilter.registerClass('ReportingFilter', Telerik.Web.UI.Editor.Filter);
		function editorLoaded(editor, args)
		{
			editor.get_filtersManager().add(new ReportingFilter());
		}
	</script>
````


1. Set the `ConvertToXhtml` filter to its default state by enabling it.

## See Also

* [HtmlTextBox Class API Reference](/api/telerik.reporting.htmltextbox)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Knowledge Base Section](/knowledge-base)
