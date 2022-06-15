---
title: Add the Same Export Extension Twice with Different Configuration
description: How to add the same extension twice for exporting with different configuration
type: how-to
page_title: How to add the same rendering extension twice
slug: add-same-rendering-extension-twice-with-different-configuration
ticketid: 1569011
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

In some scenarios, you may need to add the same extension twice. For example, for XLSX once with a native header and once without. 

## Suggested Workarounds

You may register the second extension with a different name, i.e. `XLSX1` as a custom extension, and set its `type` to the built-in type from our code that renders in the corresponding format, for example, XLSX. Here is a sample configuration that generates two XLSX rendering types, one with `UseNativePageHeader` set to _true_, and the other to _false_:

````XML
<Telerik.Reporting>
  <extensions>
    <render>
      <extension name="XLSX" description="abc">
        <parameters>
          <parameter name="UseNativePageHeader" value="true" />
        </parameters>
      </extension>
      <extension name="XLSX1" type="Telerik.Reporting.OpenXmlRendering.Spreadsheet.SpreadsheetReport, Telerik.Reporting.OpenXmlRendering" description="abc1">
        <parameters>
          <parameter name="UseNativePageHeader" value="false" />
        </parameters>
      </extension>
    </render>
  </extensions>
</Telerik.Reporting>
````


## See Also

[How to Create Custom Rendering Extension]({%slug custom-rendering-extension%})
