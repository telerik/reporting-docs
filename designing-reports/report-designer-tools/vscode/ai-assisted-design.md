---
title: Using AI-Assisted Report Design in VS Code
page_title: AI-Assisted Telerik Report Design in VS Code
description: Select a Visual Studio Code language model to generate report content, understand separate Reporting and provider entitlements, and review AI-generated changes.
slug: telerikreporting/designing-reports/report-designer-tools/vscode-ai
tags: ai, reporting, vscode, report, designer
published: True
position: 3
reportingArea: General
components: [general]
---

# Using AI-Assisted Report Design in VS Code

Use AI-assisted design when you want to add or revise report content from a prompt in the hosted Web Report Designer. The generator works with the same report definition as manual design; it does not create a separate report format or authoring environment.

AI-assisted report generation requires two independent forms of access:

* A valid Telerik Reporting Subscription or Trial license to use the AI Report Generator.
* A model that Visual Studio Code makes available through a provider, such as GitHub Copilot. The provider manages sign-in, usage limits, and billing.

Neither form of access replaces the other. You do not need to configure a separate model API key in Telerik Reporting. The AI Report Generator checks the Telerik Reporting license when you generate content, not when you select a model. For license setup, see [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-license).

## Understanding Model Access

The extension uses chat models that providers make available through Visual Studio Code. Generation also depends on whether a model supports the capabilities required by the AI Report Generator. Availability and compatibility can vary by model and provider.

For example, if you use GitHub Copilot, select a model available through your Copilot plan. Usage limits and request accounting depend on the model and the terms of your plan. Other providers can use their own accounts or subscriptions, so check their current authentication, quota, and billing terms.

## Selecting a Language Model

To choose the model that the designer uses:

1. Sign in to a provider, such as GitHub Copilot, or enable a VS Code extension that supplies chat models.
2. Open the **Command Palette**.
3. Run **Telerik Reporting: Select AI Language Model…**.
4. Select a model from the list that VS Code provides.
5. Open a report in the hosted Web Report Designer and use its AI Report Generator.

The extension stores the selection as `telerik-reporting.ai.model`. If no model is selected, the first AI request prompts you to choose one. If the list is empty, sign in to a model provider or install a VS Code extension that provides a chat model.

## Generating Content for a New Report

The generator works best when you describe both the report items and where they belong. A focused request also makes the result easier to compare with what you intended. For example:

```text
Create a report header with the title "Quarterly Sales" and a subtitle for the
selected date range. Below the header, add a table with Product, Region,
Quantity, and Revenue columns.
```

After the generator adds the requested items, check the report structure, expressions, bindings, and styles. Preview the result with representative data before you save it.

## Extending an Existing Report

When you extend an existing report, describe both the change and where it belongs in the current layout. For example:

```text
Add an overdue-payment section below the invoice totals. Include a heading,
explanatory text, and a warning style that appears only when the outstanding
amount is greater than zero.
```

Treat generated content as a starting point rather than a finished report. Check that expressions reference the expected fields, then preview the report with representative data. Also review any generated layout, styling, localization, and accessibility changes that matter to the report.

## Reviewing Data and Generated Changes

Model access also determines where request data goes: the selected provider receives your prompt and the report context included with the request. Before using customer or production reports, check that your organization permits the provider and review its data-handling terms.

Before you send a request, confirm that the supplied context does not expose credentials, personal data, or confidential business information. Always review the generated content before you save or commit it.

## Troubleshooting AI Availability

If the AI command or generator is unavailable, check these requirements in order:

1. Confirm that the Telerik Reporting license is configured as described in [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-license).
2. Confirm that VS Code exposes a chat model and that you are signed in to its provider.
3. Check that your provider plan or organization policy permits use of the selected model.
4. Run **Telerik Reporting: Show Logs** and review the reported error.

For report files and connections, see [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports). The complete command and setting tables are available in [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference).