---
title: Welcome to Telerik Reporting
page_title: Telerik Reporting - Overview, Designers, Viewers, and Platforms
description: "Learn how Telerik Reporting works, which designers and viewers to choose for your framework, and how to get started with .NET reporting."
slug: telerikreporting/welcome-to-telerik-reporting
tags: telerik, reporting, introduction, welcome
published: True
position: 0
previous_url: /overview, /quick-start-overview
---

# Welcome to Telerik Reporting

Progress Telerik Reporting is a [.NET reporting solution](https://www.telerik.com/products/reporting.aspx) for designing, processing, exporting, and embedding reports in web, desktop, and cloud-based applications. It gives development teams the tools to build pixel-perfect reports and the viewers and services required to deliver those reports inside business applications.

Use Telerik Reporting when you need to create operational reports, invoices, statements, dashboards, or printable business documents that pull data from multiple sources and render consistently across technologies.

Telerik Reporting includes report designers, report viewers, report processing services, and export formats. Desktop components and services run on .NET or .NET Framework, while the HTML5-based integration options let you embed reporting in modern web applications.

With Telerik Reporting, you can retrieve and process data from relational, multidimensional, ORM-based, and custom data sources. End users can view reports in dedicated viewers or export them to formats such as PDF, Microsoft Word, Microsoft Excel, and Microsoft PowerPoint.

{% if site.has_cta_panels == true %}
{% include cta-panel-introduction.html %}
{% endif %}

## Key Features

Telerik Reporting helps you build a complete reporting workflow:

* Design reports visually in desktop or web-based designers.
* Connect reports to business data from common enterprise data sources.
* Preview, print, and export reports in multiple document formats.
* Embed report viewers in ASP.NET Core, Angular, React, Blazor, WPF, WinForms, WinUI, and other applications.
* Host report processing in services that support web and desktop reporting scenarios.

## Supported Platforms

Telerik Reporting supports report design, processing, or viewing across the following operating systems, depending on the component you use:

| Operating System | Typical Telerik Reporting Scenarios |
| :--------------- | :---------------------------------- |
| Windows          | Full support for all components: the Standalone Report Designer, desktop report viewers, report service hosting, and web application integration. |
| Linux            | Hosting report processing services and embedding HTML5-based viewers and designers in web applications. |
| macOS            | Hosting report processing services and embedding HTML5-based viewers and designers in web applications. |

## Supported Frameworks

You can integrate Telerik Reporting into multiple web and desktop frameworks:

| Supported Framework | App Type | Typical Use |
| :------------------ | :------- | :---------- |
| ASP.NET Core        | Web      | Host reporting services and embed HTML5-based viewers and designers in your application. |
| ASP.NET MVC         | Web      | Add server-side MVC wrappers around the HTML5 Report Viewer. |
| ASP.NET WebForms    | Web      | Integrate the HTML5 Report Viewer in existing WebForms applications. |
| Angular             | Web      | Embed the native Angular Report Viewer or the HTML5 Report Viewer Angular wrapper. |
| React               | Web      | Integrate the React Report Viewer component in React applications. |
| Blazor              | Web      | Use the Native Blazor Report Viewer or the Blazor wrapper around the HTML5 Report Viewer. |
| WinForms            | Desktop  | Display reports in WinForms applications using the WinForms Report Viewer. |
| WPF                 | Desktop  | Display reports in WPF applications using the WPF Report Viewer. |
| WinUI               | Desktop  | Display reports in WinUI 3 applications using the WinUI Report Viewer. |

The web integration story centers on HTML5-based viewers and designers, while the desktop integration story centers on native viewers and design tools for Windows development environments.

## Key Components

The lifecycle of a Telerik report usually has three stages: designing the report, processing and rendering the report with data, and exporting or displaying the final output.

The main Telerik Reporting components map directly to those stages.

### Report Designers

Use a report designer when you create report layout, configure data sources, define grouping and aggregation, and style the final output.

Choose the designer based on where report authors work and whether they need a desktop tool, a web-based tool, or Visual Studio integration.

<article-card-container>
  <article-card
        href="slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview"
        src="./images/standalone-report-designer.png"
        darkSrc="./images/standalone-report-designer.png"
        title="Standalone desktop designer"
        subTitle="Report Designer"
        description="Windows desktop authoring tool packaged as a single .exe file. Suitable for report authors who need a dedicated report design environment outside Visual Studio.">
  </article-card>

  <article-card
        href="slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview"
        src="./images/web-report-designer.png"
        darkSrc="./images/web-report-designer.png"
        title="Web report designer"
        subTitle="Report Designer"
        description="Browser-based designer that you can embed in web applications. Suitable when report authors work in a web portal and need in-browser preview with the HTML5 Report Viewer.">
  </article-card>

  <article-card
        href="slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview"
        src="./images/visual-studio-report-designer.png"
        darkSrc="./images/visual-studio-report-designer.png"
        title="Designer for Visual Studio"
        subTitle="Report Designer"
        description="Visual Studio integration for editing CLR report definitions in C# or VB. Available for .NET Framework projects.">
  </article-card>
</article-card-container>




| Report Designer                                                                                                                                          | Specifics                                                                                                                                                                                                                                                      |
| :------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Standalone desktop designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview)   | Windows desktop authoring tool packaged as a single `.exe` file. Suitable for report authors who need a dedicated report design environment outside Visual Studio. |
| [Web report designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview)                                    | Browser-based designer that you can embed in web applications. Suitable when report authors work in a web portal and need in-browser preview with the HTML5 Report Viewer. |
| [Designer for Visual Studio](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview) | Visual Studio integration for editing CLR report definitions in C# or VB. Available for .NET Framework projects. |

### Report Viewers

Use a report viewer to display, print, search, navigate, and export reports inside an application.

Choose the viewer that matches the technology stack of the application where end users consume reports.

| Report Viewer                                                                                                                                                                          | App Type | Essentials                                                                                               |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------- | :------------------------------------------------------------------------------------------------------- |
| [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)                            | Web      | An HTML, CSS, JavaScript, and jQuery client-side viewer targeting all web applications. |
| [HTML5 MVC Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview)            | Web      | A server-side wrapper allowing you to configure the HTML5 Report Viewer in MVC applications.             |
| [HTML5 WebForms Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview) | Web      | A server-side wrapper allowing you to configure the HTML5 Report Viewer in WebForms applications.        |
| [Native Angular Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview)          | Web      | A fully native Angular widget built with Telerik UI for Angular components.                              |
| [Angular Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview)  | Web      | An Angular component wrapping the HTML5 Report Viewer.                                                   |
| [ReactJS Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview)      | Web      | A React component wrapping the HTML5 Report Viewer.                                                      |
| [Blazor Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview)                          | Web      | A Blazor component wrapping the HTML5 Report Viewer.                                                     |
| [Native Blazor Report Viewer](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview)                        | Web      | A fully native Blazor widget built with Telerik UI for Blazor components.                                |
| [WinForms Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview)                                   | Desktop  | A composite of standard Windows Forms controls targeting WinForms and WPF projects.                      |
| [WPF Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview)                                                  | Desktop  | A composite of Telerik UI for WPF controls targeting WPF and WinForms projects.                          |
| [WinUI Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview)                                    | Desktop  | A composite of Telerik UI for WinUI controls targeting WinUI3 projects.                                  |

### Export Formats

Web viewers and web designers typically work with a reporting service that processes report definitions and returns document output. You host this service in an ASP.NET Core application. The service receives a report definition, processes it with data, and returns the rendered result to the viewer or the export pipeline.

Export formats let users save the resulting report in the format that fits their workflow. Common output formats include:

* PDF — for print-ready and archivable documents.
* Microsoft Word and Microsoft Excel — for editable output that downstream processes or end users can modify.
* Microsoft PowerPoint — for presentation-ready reports.
* Image formats such as PNG and TIFF — for embedding report output in other applications.
* CSV — for raw data export from tabular reports.

## How to Choose the Right Starting Point

Start with the workflow that matches your role:

| Your Role | Recommended Starting Point |
| :-------- | :------------------------- |
| Evaluating Telerik Reporting | Review the [online demos](https://demos.telerik.com/reporting) and the supported framework table on this page to confirm product fit before installation. |
| Developer embedding reports | Start with [installation](slug:telerikreporting/installation) and licensing, then pick the viewer or designer that matches your framework. |
| Report author | Start with the [Standalone Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview) or the [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview) based on your preferred authoring environment. |
| Setting up a team environment | Review licensing, installation, and the reporting service hosting guidance before you build the integration. |

## About the Demos

The [Telerik Reporting online demos](https://demos.telerik.com/reporting) provide live examples of report viewers, report designers, and reporting scenarios. They are a good starting point when you want to see how the product behaves before you integrate it into an application.

If you install Telerik Reporting by using the [MSI installer or the Control Panel](slug:telerikreporting/installation), sample reports are also available as Visual Studio projects. The examples cover multiple supported platforms. To open the projects:

1. Navigate to the **Start** menu.
1. Select **Telerik** > **Reporting** > **Visual Studio Examples** > **C#/VB.NET Solution**.

## Support Options

If you run into issues while working with Telerik Reporting, use the support channel that best matches the type of question.

Sharing detailed feedback also helps improve the product and documentation.

* Use the [Telerik Reporting support system](https://www.telerik.com/account/support-tickets) when you have an active license and need product support.
* Use the [Telerik Reporting forum](https://www.telerik.com/forums/reporting) for general questions and community discussion.
* Use the [Telerik Reporting feedback portal](https://feedback.telerik.com/reporting) and the [roadmap](https://www.telerik.com/support/whats-new/reporting/roadmap) to review planned work and suggest new ideas.
* Use the [release history](https://www.telerik.com/support/whats-new/reporting/release-history) to review delivered features and changes.
* Use the article feedback form and the **Improve this article** link to report documentation issues or suggest improvements.
* Use [Progress Services](https://www.progress.com/services) if you need a custom solution or implementation support.

## Learning Resources

Use these resources to learn the product, evaluate features, and solve common setup issues:

* [Video onboarding for registered users](slug:getting-started/video-onboarding)
* [Online demos for Telerik Reporting](https://demos.telerik.com/reporting)
* [Telerik Reporting videos](https://www.telerik.com/videos/reporting)
* [Telerik blog posts about Reporting](https://www.telerik.com/blogs/tag/reporting)
* [Telerik Reporting webinars](https://www.telerik.com/webinars/reporting)
* [Knowledge Base documentation hub](/knowledge-base)

## Next Steps

* [First Steps with Telerik Reporting](slug:telerikreporting/getting-started/first-steps)
* [Setting Up Your Telerik Reporting License Key](slug:license-key)
* [Licensing Frequently Asked Questions](slug:license-frequently-asked-questions)

## See Also

* [Web Report Designer User Guide](slug:user-guide/overview)
