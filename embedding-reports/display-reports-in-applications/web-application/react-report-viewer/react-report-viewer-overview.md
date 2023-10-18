---
title: Overview
page_title: React Report Viewer at a glance 
description: "Find out more about the available non-native React Report Viewer, the requirements to use it, and its browser support."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview
tags: react, report, viewer, overview
published: True
position: 0
previous_url: /react-report-viewer, /using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview
---

# React Report Viewer Overview

> The current React Report Viewer version is `{{site.spaviewerversion}}` and should be used with `Reporting REST Service {{site.buildversion}}` or `Telerik Report Server {{site.reportserverversion}}`.

You can integrate the React Report Viewer component in your React applications. Note that the viewer is introduced in [R1 2022]({%slug telerikreporting/upgrade/2022/r1-2022%}).

The React component is built on top of the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), which is the foundation for all Web-based report viewers as well.

## Requirements

To successfully integrate the React Report Viewer component, ensure the following:

1. Required Application Version:

	+ React 17.0.2+ application

1. Required Service:

	+ The viewer requires a running instance of [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) in order to display reports. Make sure to [enable Cross-Origin Requests (CORS)](https://learn.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api)  in the REST Service project.

1. Required JavaScript libraries:

	+ [jQuery 3.2.1+](https://jquery.com/download/)

1. The [React Report Viewer package](https://www.npmjs.com/package/@progress/telerik-react-report-viewer) requires the following peer dependencies:

	+ react-dom 17.0.2+
	+ react-scripts 4.0.3+
	+ jquery

1. Required references to Telerik Kendo UI styles:

	+ [Less-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/less-themes/overview); or
	+ [Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview)

## Browser Support

The React viewer is based on the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), thus the client browser should conform to the HTML5 Report Viewer [Browser Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#browser-support).

## See Also

* [Use React Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service%})
* [Use React Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-report-server%})
