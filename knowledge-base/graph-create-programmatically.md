---
title: Programmatically Create a Chart in the Graph
page_title: Programmatically Create a Chart in the Graph Report Item
description: "Learn how to programmatically create a Chart in the Telerik Reporting Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-create-chart-programmatically
previous_url: /report-items/graph/how-to/how-to-create-chart-programmatically, /graphhowtocreateprogrammaticallygraph
tags: telerik, reporting, graph, report, item, create, chart, programmatically
type: how-to
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting Graph Report Item</td>
		</tr>
	</tbody>
</table>


## Description

How can I programmatically create a chart in the Graph?

## Solution 

The suggested approach demonstrates how to programmatically create a minimal chart definition with the Graph item. The example is an alternative to using the Report Designer for creating a chart. If applicable for your scenario, create your chart in the designer either with the Graph Wizard or [manually]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-create-chart-step-by-step%}). 

{{source=CodeSnippets\CS\API\Telerik\Reporting\GraphSnippets.cs region=AddNewGraphColumnChartType}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\GraphSnippets.vb region=AddNewGraphColumnChartType}}

