---
title: Getting Started
page_title: Getting Started with the HtmlTextBox Report Item
description: "Get up and running with Telerik Reporting, and learn how to create and use the HtmlTextBox report item in reports."
slug: htmltextbox_item_get_started
tags: telerik, reporting, report, items, htmltextbox, getting, started
published: True
position: 1
---

# Getting Started with the HtmlTextBox Report Item

This guide shows how to create and use the Telerik Reporting HtmlTextBox report item in reports with the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}). 

* First, you will add an HtmlTextBox item in you empty Report created with the Standalone Designer
* Then, you will fill the HtmlTextBox with some styled content

After the completion of this guide, you will also be able to configure the HtmlTextBox in the Standalone Designer and achieve the following result. 

![HtmlTextBox with link to Telerik Reporting online demos](images/HtmlTextBox-Preview.png)

## Add the HtmlTextBox item to the Report

1. Select the Report Section where you would like to add the HtmlTextBox. For our demo we will use the Detail section.

1. From the designer's menu choose the `Insert` tab. The availale items will be displayed in the toolbar below the main menu.

1. Click on the HtmlTextBox item and it will be added in the middle of the Report section you selected in the first step. 

The result shold be as shown in the image below:

![Add HtmlTextBox to the Detail section of an empty Report](images/HtmlTextBox-Add.png)

## Add Styled Content to the HtmlTextBox

The HtmlTextBox we just created contains the default text that is the item name. When this is the first HtmlTextBox you added to your report, its default value would be "htmlTextBox1". 

1. Change the HtmlTextBox content. For this purpose, you may:

	+ Go to the Value in the properties pane of the item and click on the ellipses. 
	
	+ Right-click over the item and select `Expression...` form the popped-up Context menu.

	The result of either of the above actions would be the opening of the HtmlTextBox Edit Expression dialog in Design view.

1. Type "Telerik Reporting" in the `Design view` of the editor. 

1. Select the text and use the background color button from the toolbox to set an Orange background. 

1. Use the last button from the toolbar of the editor to add a link to our online demos. It will open a `Hyperlink Editor`, where you may type as URL: `https://demos.telerik.com/reporting/` and select as Target: `_blank` to open the web page on a new browser tab like shown below:

![Add HtmlTextBox to the Detail section of an empty Report](images/HtmlTextBox-ContentWithLink.png)

1. Switch to the `Html view` of the editor to see the generated HTML code. It should look like:

	````HTML
<span style="background-color: #ff8000"><a href="https://demos.telerik.com/reporting/">Telerik Reporting</a></span>
````


1. Close the HtmlTextBox editor dialog with the button `OK` 

1. Preview the report and test the link by clicking on the `Telerik Reporting` orange text.

## Next Steps

* [HtmlTextBox Class API Reference](api/telerik.reporting.htmltextbox)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting) 
* [Knowledge Base Section](/knowledge-base)

## See Also

* [Editing]({%slug htmltextbox_editing%})
* [Styling and Formatting]({%slug htmltextbox_formatting_and_styling%})
* [Embedded Expressions]({%slug htmltextbox_embedded_expressions%})
* [Known Limitations]({%slug htmltextbox_known_limitations%})
