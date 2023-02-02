---
title: Open reports created with a newer version of the Standalone Report Designer
description: "Open a TRDP or a TRDX report definition that says 'Cannot read a document with the specified schema ... You might be using an older version of the product.' when you try to open it with the Standalone Report Designer."
type: how-to
page_title: Open reports that use an XML schema version that is newer than the one currently supported by your Standalone Report Designer installation
slug: open-reports-that-use-newer-xml-schema
position: 
tags: 
ticketid: 
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
			<td>Report Designer</td>
			<td>Standalone Report Designer</td>
		</tr>
	</tbody>
</table>


## Description
Sometimes you might encounter a TRDP or a TRDX report definition that you are unable to open, and the designer displays the following message `Cannot read a document with the specified schema <...> You might be using an older version of the product.`. This happens because the report was created with a newer version of the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) that uses a more recent XML schema. While the **best solution** is to update your Telerik Reporting installation to the latest version, in some cases, that might not be a desired option. As an alternative, you can use the following approach to be able to open the report.

>info Depending on how old your Standalone Report Designer version is and the features used in the report you are trying to open, you still might not be able to open it correctly. This is why the following approach is not a good long-term solution and should be used only as a "quick fix" for non-crucial reports.

## Solution

1. Find the latest XML schema that is compatible with your version of the Standalone Report Designer. To do that, create a new blank `TRDX` report with the Standalone Report Designer, save it, and open the `.trdx` file with a text editor of your choice. The `xmlns` attribute of the root element contains the schema version in the following format: `http://schemas.telerik.com/reporting/<version>`. As an alternative, you can find your version in the **Upgrade** section of the Telerik Reporting documentation and search for the XML schema there. For example, this is the article for [R1 2023]({%slug telerikreporting/upgrade/2023/r1-2023%}#standalone-report-designer-targeting-net-framework-40) 

1. Once you know which XML schema version your Standalone Report Designer is using, all you have to do is apply your schema version to the report that you cannot open. By now, you have a pretty good idea of how to open and modify `TRDX` report definitions. `TRDP` definitions are not much different, other than the fact that they are a `ZIP` file containing the XML definition and other resources that have been embedded in the report. To modify the `TRDP` definition, open it with an archive utility of your choice *(for example, 7Zip)*, and edit the `definition.xml` file accordingly *(do not unzip and zip the `.trdp` file, but edit it directly and save it)*.

## See Also
* [Report Definition Types]({%slug telerikreporting/designing-reports/overview%}#report-definition-types)
