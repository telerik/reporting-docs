---
title: AI-Assisted JSON Report Editing
page_title: Samples for AI-Assisted JSON Report Editing | Telerik Reporting
description: "Explore a sample helper and AI skill for JSON report editing. Review and adapt the examples, validate report changes, and preview the results."
slug: validate-ai-generated-json-report-definitions
type: how-to
tags: reporting, ai, schema, validation, trdj
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
			<td>Version</td>
			<td>20.2.26.1007 or higher</td>
		</tr>
        <tr>
			<td>License requirement</td>
			<td>An active Telerik Reporting trial or subscription license</td>
		</tr>
	</tbody>
</table>

## Description

I want to explore AI-assisted edits to an existing JSON report with Telerik Reporting schemas and validation APIs. Which examples can I review and adapt?

## Solution

The `Telerik.Reporting.Schema` package provides schemas for Reporting model types and APIs to validate JSON definitions. See [JSON Schema for Telerik Reporting Types](slug:json-schema) and [Validating JSON Report Definitions](slug:json-validation-sdk) for the API contracts and requirements.

The [helper project and AI skill in the samples repository](https://github.com/telerik/reporting-samples/tree/master/AiAssistedJsonReportEditing) provide an example of how to combine these APIs with an AI-assisted workflow. Use them as starting points: review the code and instructions, adapt them to your environment and requirements, and test the results before use in your application.

### Sample Project and Skill

The [AI-Assisted JSON Report Editing sample](https://github.com/telerik/reporting-samples/tree/master/AiAssistedJsonReportEditing) contains the following assets:

* [Standalone helper project](https://github.com/telerik/reporting-samples/tree/master/AiAssistedJsonReportEditing/ReportingJsonTools)—A .NET console application for type discovery, schema retrieval, and JSON definition validation.
* [Example AI skill](https://github.com/telerik/reporting-samples/blob/master/AiAssistedJsonReportEditing/reporting-json-editor/SKILL.md)—Instructions for targeted edits to existing `.trdj` reports, including changes to text, style, layout, and report items.

The sample's README covers package and licensing prerequisites, helper commands, skill installation, and an example prompt. The skill does not create complete reports or report books from scratch.

### Reviewing and Adapting the Sample

The sample demonstrates one way to use schemas and validation APIs in an AI-assisted editing workflow. Start by reviewing the helper code and skill instructions, then adapt them to your assistant, permissions, and requirements. If you try the workflow, use a copy of a report that you are authorized to share. For data-bound changes, provide the exact field names and types for the relevant data source.

>caution The sample skill instructs the assistant to read the entire report definition. Depending on your AI tool, report content and validation diagnostics may be sent to its provider. Review the report before sharing it, and check your organization's data rules and the provider's and client's data-handling terms.

Keep credentials, connection strings, and license keys outside files accessible to the assistant. Named/shared connections keep connection strings outside the report, but do not remove queries, expressions, personal data, or other sensitive content from it.

## See Also

* [JSON Schema for Telerik Reporting Types](slug:json-schema)
* [Validating JSON Report Definitions](slug:json-validation-sdk)
* [Report Designer Tools](slug:telerikreporting/designing-reports/report-designer-tools/overview)
* [Security Best Practices](slug:security-best-practices)