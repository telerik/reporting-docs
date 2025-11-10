---
title: Overview
page_title: Using Out-proc Session State with ASP.NET WebForms Report Viewer
description: "Learn how the Out-proc session state can be used with ASP.NET WebForms Report Viewer and when one should or should not use it."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/using-out-proc-session-state/overview
tags: overview
published: False
position: 0
previous_url: /asp-net-report-viewer-outproc
reportingArea: General
---

# Using Out-proc Session State Overview

> This is a legacy report viewer and for new projects our recommendation is to use the latest WebForms Report Viewer - [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})

The ReportViewer control uses the `ASP.NET session state` to preserve the report instance that is displayed, between page postbacks and different viewer operations. The session state, however, can be configured to run in different modes. By default it uses the memory of the worker process (InProc mode) and the report instance stays intact. However, in some cases it is more appropriate to use a `StateServer`, `SqlServer` or `Custom` session state mode. All of these modes are referred to as `out-proc` session state modes. The biggest difference between the two modes is that the session variables have to be serialized and deserialized when the session state is preserved and restored. In this case, the serialization process imposes the following limitations which have to be considered when designing Telerik reports:

* The report should have a public default constructor as it is used to instantiate the report class during the deserialization process.

* Data sources for the data items should be binary serializable.

* Report events should be attached in the report’s default `constructor`.

* The fields representing the report items in the Report class should not be used in the report events.
  
	Instead the report item should be taken from the Items collection of the report. Consider the following examples:
  
	__Wrong__ 

	{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\OutProcSnippets.cs region=WrongItemDataBinding}}
	{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\OutProcSnippets.vb region=WrongItemDataBinding}}

	__Correct__ 

	{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\OutProcSnippets.cs region=CorrectItemDataBinding}}
	{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\OutProcSnippets.vb region=CorrectItemDataBinding}}

* To utilize the events of the report items (`NeedDataSource`, `ItemDataBinding`, `ItemDataBound`) you have to attach them in the `ItemDataBinding` event of the Report. For example:

	{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\OutProcSnippets.cs region=AttachItemsEvents}}
	{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\OutProcSnippets.vb region=AttachItemsEvents}}


As the data sources are kept in the session state, it is highly recommended to use the built-in [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}). As a last resort you can use the `NeedDataSource` event to populate the report with data. Otherwise, the session state will either become very large, especially when using large datasets or the data for the report will not be serialized at all if it cannot be binary serialized/deserialized (e.g. business objects, anonymous types, data adapters, etc.). You should restrain from setting an instance of your business object directly as a data source, as it would be serialized multiple times into the session.

It is highly recommended not to use events when designing reports. The reporting engine provides another powerful means to achieve the same functionality. For example, instead of using events to accomplish your goals, you can take advantage of [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}), [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) and [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}).

More info about the differences between different state modes you can find in the [ASP.NET Session State](https://learn.microsoft.com/en-us/previous-versions/dotnet/articles/ms972429(v=msdn.10)) documentation article.

## See Also

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%})

* [How to Add report viewer to a web page]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page%})

* [Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/report-viewer-localization%})

* [Medium Trust Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/medium-trust-support%})

* [AJAX support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/ajax-support%})
