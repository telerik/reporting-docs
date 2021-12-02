---
title: Using HTML from Telerik RadEditor
page_title: Using HTML from Telerik RadEditor | for Telerik Reporting Documentation
description: Using HTML from Telerik RadEditor
slug: telerikreporting/designing-reports/report-structure/htmltextbox/using-html-from-telerik-radeditor
tags: using,html,from,telerik,radeditor
published: True
position: 2
---

# Using HTML from Telerik RadEditor



The __HtmlTextBox__  works with text formatting options only                 (a subset of HTML tags and CSS attributes), which are available for the sole purpose of styling                 labels and headers. The unsupported tags/css attributes have to be filtered in order to avoid exceptions.                 The purpose of this article is to outline how to accomplish this when the __HTML__                  data entry tool is  [RadEditor for ASP.NET AJAX.](http://www.telerik.com/products/aspnet-ajax/editor.aspx) 

## 

Two things should be considered:                 

* limit the options in the RadEditor's toolbar

* Allowing plain text only. RadEditor can automatically do this for you by                             stripping all HTML tags), because even if you limit the toolbar to certain actions only,                             pasting rich-text will still be available by default.                         

Here are the exact steps taken:

1. Use the markup below for your ToolsFile.xml file

	
      ````xml
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



1. Since the inline text-decoration css property is not supported, disable the                             __FixUlBoldItalic__  filter:                         

	
      ````C#
RadEditor1.DisableFilter(Telerik.Web.UI.EditorFilters.FixUlBoldItalic);````
````VB
RadEditor1.DisableFilter(Telerik.Web.UI.EditorFilters.FixUlBoldItalic)````




1. Since __HtmlTextBox__  works with font tags, disable the __ConvertFontToSpan__  filter,                             which converts the non __XHTML__  compliant Font tags with Span tags                         

	
      ````C#
RadEditor1.DisableFilter(Telerik.Web.UI.EditorFilters.ConvertFontToSpan);````
````VB
RadEditor1.DisableFilter(Telerik.Web.UI.EditorFilters.ConvertFontToSpan)````




1. Strip the HTML formatting from pasted content, because the user could paste non well formed content                             which could break the __HtmlTextBox__  and the export to PDF feature. To do that set the __StripFormattingOptions__                              property to __"All"__  or __"AllExceptNewLines"__ .                         

1. Use the following custom content filter, which will remove unsupported __HTML__  tags. Supported                             tags are: FONT, STRONG, B, EM, I, U, A, OL, UL, SUB, SUP, LI, DIV, SPAN, P, BR, CENTER.                         

	
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
        //Perform necessary REGEX replacement to remove unsupported HTML tags
        //Supported Reporting HTML tags: FONT, STRONG, B, EM, I, U, A, OL, UL, LI, DIV, SPAN, P, BR, CENTER
        //HTML must be XHTML valid, too, but Editor already provides that filter
        //Following REGEX will remove all HTML tags EXCEPT those expliclitly listed
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



1. The __ConvertToXhtml__  filter should be enabled (default state).                         

# See Also

