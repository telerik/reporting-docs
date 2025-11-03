---
title: AI-Powered Insights Overview
page_title: AI-Powered Insights in Report Preview
description: "Learn about the AI insights feature of Reporting, which allow users to execute predefined or custom prompts on the core data of the previewed report, receiving responses from an AI model."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights
tags: telerik, reporting, ai
published: True
position: 1
previous_url: /interactivity/ai-powered-insights
---

# AI-Powered Insights Overview

**AI Insights** is an AI-powered feature available during the report preview. It enables users to execute predefined or custom prompts on the core data of the previewed report, uncovering valuable insights, generating summaries, or answering specific questions through an AI model. The feature also supports fine-tuning of the embedded Retrieval-Augmented Generation (RAG) algorithms, optimizing them to deliver accurate responses while minimizing token consumption.

>tip For a working example of this functionality, check the [AI Insights Report Demo](https://demos.telerik.com/reporting/ai-insights).

![The UI of the AI system after configuration.](images/angular-report-viewer-with-ai-insights.png)

## How Does It Work?

To bring the power of Generative AI (GenAI) into reporting workflows, we are introducing an **AI Prompt** dialog that integrates seamlessly in the report viewers. The dialog provides a convenient UI for sending predefined or custom prompts to an external AI model (for example, GPT-5), configured in the Reporting REST Service. The prompts and responses returned from the AI model are displayed in the **Output** panel of the dialog, allowing for easier involvement in the conversation.

The AI conversation maintains context throughout user's interaction with a specific report. All previous questions and responses are preserved and sent to the AI model as context, enabling more coherent and contextually relevant conversations. However, this context is automatically cleared when report parameters are changed or when navigating to a different report, ensuring that each report session starts with a fresh conversation thread.

The feature is supported by all [web report viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and by the [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%}) connected to a remote Reporting REST Service.

### Key Features

- Retrieval-Augmented Generation (RAG)—When enabled, the AI insights feature uses an algorithm that filters out the irrelevant report data, producing more accurate responses with reduced token usage.
  
- Predefined Summary Prompts—Users can choose from a set of predefined prompts tailored for common tasks like summarization, explanation, and data insights—boosting efficiency with minimal effort.

- Custom AI Prompts—Besides the predefined prompts, users can create custom prompts to ask more specific queries.

	<img src="images/predefined-prompts.png" style="border: 1px solid lightgray; width: 500px" alt="Image of the Prompt UI" />

- End-User Consent for Data Sharing—To ensure transparency and compliance, the AI Prompt requests explicit consent from users before sending their prompts to the AI models.

	<img src="images/user-consent.png" style="border: 1px solid lightgray; width: 500px" alt="User Consent for AI Summaries" />

## Next Steps

To enable AI-Powered Insights in your application, choose one of these two implementation approaches:

- Use built-in AI client—For supported LLM providers (Azure OpenAI, OpenAI, Azure AI Foundry, or Ollama), follow the [Enable AI-Powered Insights with Built-in AI Client]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-builtin-client%}) guide.

- Create custom AI client—For unsupported LLM providers or when you need custom logic (like token usage tracking), refer to [Enable AI-Powered Insights with Custom AI Client]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-custom-client%}).

Once you have enabled the functionality, you can optionally:

- Customize the experience—Fine-tune settings like user consent, predefined prompts, and RAG optimization using the [Customizing AI-Powered Insights]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights%}) article.

## See Also

* [AI Insights Report Demo](https://demos.telerik.com/reporting/ai-insights)
* [Enable AI-Powered Insights with Built-in AI Client]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-builtin-client%})
* [Enable AI-Powered Insights with Custom AI Client]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-custom-client%})
* [Customizing AI-Powered Insights]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights%})
