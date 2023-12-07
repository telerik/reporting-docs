---
title: Overview
page_title: HTML5 ASP.NET Web Forms Report Viewer at a Glance
description: "Learn more about the HTML5 ASP.NET Web Forms Report Viewer, how it works, what are its requirements, and browser support."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview
tags: overview
published: True
position: 0
previous_url: /webforms-report-viewer-controls-overview, /webforms-report-viewer-controls-system-requirements, /embedding-reports/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/
---

# HTML5 ASP.NET Web Forms Report Viewer Overview

The HTML5 ASP.NET WebForms Report Viewer provides server-side wrappers for the [HTML5 JavaScript ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}). Developers comfortable with ASP.NET Web Forms can easily configure and work with the Report Viewer via their preferred server-side programming language.

With HTML5 ASP.NET WebForms Report Viewer you can have the viewer configured in code. The WebForms wrapper renders the widget and links to the required JS, CSS, and HTML resources on the page, where JavaScript is added at the end of the page.

The WebForms viewer works like the HTML5 Viewer in a client-server pair with the [Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}). Even if the Reporting REST Service is added in the same WebForms project, the service does not operate in the context of the client project. To use data modified in the WebForms project, it has to be saved in the data source, from where the Reporting REST service can access it.

> The old ASP.NET WebForms ReportViewer displays content rendered through the [Reporting HTML Rendering mechanism]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/html-rendering-design-considerations%}).
>
> As of [Telerik Reporting Q3 2015](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q3-2015-(version-9-2-15-930)), the old ASP.NET WebForms ReportViewer control is obsolete. The main reasons for this decision were that the viewer:
>
>	* Uses extensively `iframe` and `table` elements in its structure.
>
>	* Utilizes the ASP.NET Session to preserve resources between requests.
>
>	* Is suitable for WebForms projects only.

## Requirements

* The HTML5 ASP.NET Web Forms Report Viewer is built on and requires [ASP.NET 4 Web Forms](https://learn.microsoft.com/en-us/aspnet/web-forms/) or a newer framework.
* A reference to __Telerik.ReportViewer.Html5.WebForms.dll__.
* The HTML5 ASP.NET Web Forms Report Viewer is a server-side wrapper for the [HTML5 JavaScript Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and you should conform to the HTML5 Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}). The CSS and JS files must be loaded on the page before creating the HTML5 Viewer.
* The WebForms wrapper is designed to request all Kendo UI CSS and JS files, including the viewer's HTML, CSS, and JS templates, from the resources of the Reporting REST Service. If you will not add changes in the default styles of the viewer, you need only a link to __jQuery of version greater than 1.9.1__.

## Browser Support

The control is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) thus you should conform to the HTML5 Report Viewer [Browser Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#browser-support).
