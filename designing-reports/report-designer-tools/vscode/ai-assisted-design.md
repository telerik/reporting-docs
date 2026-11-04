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

Use a language model available in Visual Studio Code to generate report content in the hosted Web Report Designer. If a compatible model is available through GitHub Copilot or another provider, you do not need to configure a separate model API key in Telerik Reporting.

AI-assisted report generation has two separate requirements:

* Telerik Reporting requires a valid Subscription or Trial license for its AI Report Generator. A GitHub Copilot or other model subscription does not replace this Reporting license.
* The selected model provider controls model availability, authentication, usage limits, and billing. The Reporting license does not provide model access.

For Reporting license setup, see [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference#configuring-a-license). Selecting a model does not itself require a Telerik Reporting license; the AI Report Generator requires the license when you use it.

## Understanding Model Access

The extension requests chat models through the Visual Studio Code Language Model API. It offers the models returned by VS Code without filtering by vendor or family. The AI Report Generator sends tool definitions with its request, so model and provider support can affect whether report generation succeeds.

For example, if you use GitHub Copilot, select a model available through your Copilot plan. Usage limits and request accounting depend on the selected model and the terms of your provider plan. Other VS Code providers can use their own accounts or subscriptions. Check the current provider terms for authentication, quotas, and billing; do not assume all providers use the same credit system.

## Selecting a Language Model

To choose the model that the designer uses:

1. Sign in to a provider, such as GitHub Copilot, or enable a VS Code extension that supplies chat models.
2. Open the Command Palette.
3. Run **Telerik Reporting: Select AI Language Model…**.
4. Select a model from the list that VS Code provides.
5. Open a report in the hosted Web Report Designer and use its AI Report Generator.

The extension stores the selection as `telerik-reporting.ai.model`. If no model is selected, the first AI request prompts you to choose one. If the list is empty, sign in to a model provider or install a VS Code extension that provides a chat model.

## Generating Content for a New Report

Describe the report items and layout that you need. For example, ask the model to create a report header with a title and date range, followed by a table with Product, Region, Quantity, and Revenue columns.

Review the generated structure, expressions, bindings, and styles before you save the report. Verify the layout with representative data.

## Extending an Existing Report

State the change and where it belongs. For example, ask the model to add an overdue-payment section below an invoice's totals. Request a heading, explanatory text, and a warning style that appears only when the outstanding amount is greater than zero.

Treat the generated content as a starting point. Verify its expressions, field names, accessibility, localization, page layout, and rendered output before you save or commit it.

## Reviewing Data and Generated Changes

The model provider receives the prompt and report content that the AI agent sends with its request. Review the provider's terms before you use customer or production reports.

Before you send a request, confirm that your organization permits the selected provider and that the report context does not expose credentials, personal data, or confidential business information. Review the generated content before you save it.

## Troubleshooting AI Availability

If the AI command or generator is unavailable, check the following items:

1. Confirm that a valid Telerik Reporting Subscription or Trial license is available to the extension backend.
2. Confirm that VS Code exposes a chat model and that you are signed in to its provider.
3. Check that your provider plan or organization policy permits use of the selected model.
4. Run **Telerik Reporting: Show Logs** and review the reported error.

For report files and connections, see [Working with Existing Reports in VS Code](slug:telerikreporting/designing-reports/report-designer-tools/vscode-existing-reports). For all commands and settings, see [VS Code Configuration and Reference](slug:reporting-vs-code-configuration-and-reference).