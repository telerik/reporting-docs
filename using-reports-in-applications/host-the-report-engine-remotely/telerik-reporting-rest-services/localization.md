---
title: Localization
page_title: Localization | for Telerik Reporting Documentation
description: Localization
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/localization
tags: localization
published: True
position: 6
---

# Localization



The service renders the report with the request thread culture.         By default the request thread respects the host's default locale.         In order the request thread to respect the clients/browsers preferred language settings you should add in the root web.config file         the following globalization element:       

	
````xml
        <globalization culture="auto" uiCulture=”auto” />
````



Then the user agent (the browser) preferred language will be used as culture.       



# See Also


# See Also

 * [globalization Element](http://msdn.microsoft.com/en-us/library/hy4kkhe0(v=vs.85).aspx)
