---
title: Localization
page_title: Localization Explained
description: "Learn how to use the user agent (browser) preferred language when rendering reports in the Telerik Reporting REST Service."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/localization
tags: localization
published: True
position: 6
previous_url: /telerik-reporting-rest-service-localization,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/localization
reportingArea: General
---

# Localization Overview

The service renders the report with the request thread culture. By default the request thread respects the host's default locale. In order the request thread to respect the clients/browsers preferred language settings you should add in the root `web.config` file the following globalization element:

````XML
<globalization culture="auto" uiCulture=”auto” />
````

Then the user agent (the browser) preferred language will be used as culture.

## See Also

* [globalization Element](https://learn.microsoft.com/en-us/previous-versions/dotnet/netframework-3.0/hy4kkhe0(v=vs.85))
