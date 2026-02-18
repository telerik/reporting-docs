---
title: Introduction to Reporting
page_title: Introduction to Telerik Reporting by Progress
description: "Telerik Reporting is a .NET platform enabling you to create, design, and integrate reports in Blazor, Angular, ASP.NET Core, WPF, and more."
slug: telerikreporting/welcome-to-telerik-reporting!
tags: telerik, reporting, introduction, welcome
published: True
position: 0
previous_url: /overview, /quick-start-overview
---

# Welcome to Telerik Reporting

Progress® Telerik® Reporting is a [.NET Reporting](https://www.telerik.com/products/reporting.aspx) [embedding tool](https://www.telerik.com/products/reporting/embedded-reporting.aspx) that enables you to create, design, export, and integrate reports in cloud-based, web, and desktop applications.

Telerik Reporting provides web and desktop report designers and services, and report viewer controls. The desktop components and the services are .NET/.NET Framework-only, whereas the HTML5-based components can be integrated into virtually any website or application.

With Telerik Reporting you can retrieve and process data from relational, multi-dimensional, ORM, or custom data-layer-based data sources.

End users can view the ready reports in PDF, Microsoft Office Word, Excel, and PowerPoint document formats, or use a dedicated viewer in a Web or .NET/.NET Framework desktop application.

{% if site.has_cta_panels == true %}
{% include cta-panel-introduction.html %}
{% endif %}

## Supported Platforms

Telerik Reporting helps you create reports that run on the following operating systems:

- Windows
- Linux
- MacOS

## Supported Frameworks

We provide widgets and functionality letting you integrate Telerik Reporting seamlessly in multiple Web and Desktop Frameworks:

| Supported Framework | Media   |
| :------------------ | :------ |
| ASP.NET Core        | Web     |
| ASP.NET MVC         | Web     |
| ASP.NET WebForms    | Web     |
| Angular             | Web     |
| React               | Web     |
| Blazor              | Web     |
| WinForms            | Desktop |
| WPF                 | Desktop |
| WinUI               | Desktop |

## Key Components

The lifecycle of a Telerik report is divided into three main steps&mdash;designing the report, populating the report with data and rendering it in a viewer, and exporting the report to a document file.

The Telerik Report Designers and Viewers are the main components of Telerik Reporting and accompany the users in their journey along the lifecycle of the report.

### Report Designers

The Report Designers are responsible for the designing process.

- Report Designers are tools that help you create the report you require, connect it to a data source to load the information you need, style its header, footer, and general appearance, make report collections if necessary, and export its content to PDF, for example.
- Which Report Designer you choose depends on the specific functionality you want to use.

| Report Designer                                                                                                                                          | Specifics                                                                                                                                                                                                                                                      |
| :------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Standalone desktop designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})   | <ul><li>A single `.exe` file representing a Windows tool powered by the Telerik Reporting engine.</li><li>Uses the latest UI standards to facilitate the process of creating reports, locally analyzing report data, exporting and sharing.</li></ul>          |
| [Web report designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})                                    | <ul><li>An HTML-, CSS-, JavaScript-and-jQuery-based widget allowing you to integrate a report designer into your web applications.</li><li>Styling is based on the Kendo UI Sass Default theme.</li><li>Previews reports in the HTML5 Report Viewer.</li></ul> |
| [Designer for Visual Studio]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) | <ul><li>Dedicated to editing CLR or type report definitions (CS or VB files) in the Visual Studio environment.</li><li>Available under the .NET Framework only.</li></ul>                                                                                      |

### Report Viewers

The Report Viewers are UI components that are tailored to a specific technology.

- Report Viewers are tools that enable you to deploy and render your report in applications that are built on various technologies such as ASP.NET Core or Angular.
- Which Report Viewer you will choose to use depends on the targeted technology of the application.

| Report Viewer                                                                                                                                                                          | App Type | Essentials                                                                                               |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------- | :------------------------------------------------------------------------------------------------------- |
| [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})                            | Web      | An HTML, CSS, JavaScript, and jQuery client-side targeting all web applications working with JavaScript. |
| [HTML5 MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/overview%})            | Web      | A server-side wrapper allowing you to configure the HTML5 Report Viewer in MVC applications.             |
| [HTML5 WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}) | Web      | A server-side wrapper allowing you to configure the HTML5 Report Viewer in WebForms applications.        |
| [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})          | Web      | A fully native Angular widget built with Telerik UI for Angular components.                              |
| [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})  | Web      | An Angular component wrapping the HTML5 Report Viewer.                                                   |
| [ReactJS Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})      | Web      | A React component wrapping the HTML5 Report Viewer.                                                      |
| [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})                          | Web      | A Blazor component wrapping the HTML5 Report Viewer.                                                     |
| [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})                        | Web      | A fully native Blazor widget built with Telerik UI for Blazor components.                                |
| [WinForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%})                                   | Desktop  | A composite of standard Windows Forms controls targeting WinForms and WPF projects.                      |
| [WPF Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})                                                  | Desktop  | A composite of Telerik UI for WPF controls targeting WPF and WinForms projects.                          |
| [WinUI Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/overview%})                                    | Desktop  | A composite of Telerik UI for WinUI controls targeting WinUI3 projects.                                  |

## About the Demos

The [Telerik Reporting online demos](https://demos.telerik.com/reporting) provides a set of pre-built live demos designed to demonstrate the Telerik Reporting capabilities. The demos use the HTML5-based web report viewers.

If you install Telerik Reporting by using the [MSI file or the Control Panel]({%slug telerikreporting/installation%}), the sample reports will also be available as Visual Studio projects. The examples for Visual Studio contain applications for all supported platforms. To open the projects:

1. Navigate to the **Start** menu.
1. Select **Telerik** > **Reporting** > **Visual Studio Examples** > **C#/VB.NET Solution**.

## Support Options

For any issues you might come across while working with Telerik Reporting, use any of the following available support channels.

Note that sharing quality feedback and ideas will not only benefit the community and improve the products but may also win you [Telerik points](https://www.telerik.com/community/telerik-points).

- Telerik Reporting license holders can take advantage of the Telerik Reporting outstanding customer support delivered by the actual developers who built the tool. To submit a support ticket, use the [Telerik Reporting support system](https://www.telerik.com/account/support-tickets).
- The [Telerik Reporting forum](https://www.telerik.com/forums/reporting) is part of the free support you can get from the community and from the Telerik Reporting team on all kinds of general issues.
- [Telerik Reporting feedback portal](https://feedback.telerik.com/reporting) and [Telerik Reporting roadmap](https://www.telerik.com/support/whats-new/reporting/roadmap) provide information on the features in discussion and also the planned ones for release.
- For any features that have already been released, visit the [Telerik Reporting Release History](https://www.telerik.com/support/whats-new/reporting/release-history) page.
- This official Telerik Reporting documentation is public and available for all users. If you want to share your feedback on a specific article, fill in the **Was this article helpful?** form and tell us more about whether the content was useful for you to successfully achieve what you wanted.
- You can also directly contribute to the documentation&mdash;click the **Improve this article** link on the right-hand side of the page to access the GitHub repository with the source documentation files. Then, create a Pull Request with the suggested changes.
- Need something unique that is tailor-made for your project? Progress offers its [Progress Services group](https://www.progress.com/services) that can work with you to create any customized solution that you might need.

## Learning Resources

- [Video Onboarding (Training Courses for Registered Users)]({%slug getting-started/video-onboarding%})
- [Online Demos for Telerik Reporting](https://demos.telerik.com/reporting)
- [Telerik Reporting Videos](https://www.telerik.com/videos/reporting)
- [Telerik Blog on Telerik Reporting](https://www.telerik.com/blogs/tag/reporting)
- [Telerik Reporting Webinars](https://www.telerik.com/webinars/reporting)
- [Knowledge Base Documentation Hub](/knowledge-base)

## Next Steps

* [First Steps with Telerik Reporting]({%slug telerikreporting/getting-started/first-steps%})
* [Setting Up Your Telerik Reporting License Key]({%slug license-key%})
* [Licensing Frequently Asked Questions]({%slug license-frequently-asked-questions%})

## See Also

* [Web Report Designer User Guide]({%slug user-guide/overview%})
