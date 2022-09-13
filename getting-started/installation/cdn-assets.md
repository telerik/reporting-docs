---
title: Telerik Reporting CDN
page_title: Using the Telelerik Reporting CDN in Web Applications
description: "Use the Telerik Reporting CDN to serve resources for the report viewer or the web report designer"
slug: telerikreporting/getting-started/installation/cdn-assets
tags: how,to,add,the,telerik,cdn,reportviewer,script
published: True
position: 21
---

# Telerik Report Viewer and Telerik Web Report Designer Resources

In order to run any of the HTML5-based report viewers, you need to add a reference to the JavaScript file of the viewer.
When it comes to the Web Report Designer, in addition to the viewer's script,
you also have to add the designer's scripts.

## Previous Approach

You could serve the files from the Telerik Reporting REST service or add them locally to your project by coping them from the installation folder
of Telerik Reporting: 
C:\Program Files (x86)\Progress\Telerik Reporting **Version**\Html5

## Current Recommendation

Now, these resources are served also by the Teleik Reporting CDN and we recommend it as a first-choice option.
To serve a resource from the CDN, you can construct the URL as follows:
https://reporting.cdn.telerik.com/**Version**/js/**NameOfFile**

For example:
https://reporting.cdn.telerik.com/16.2.22.914/js/webReportDesigner.min.js



## See Also 

* [Restoring NuGet Packages in Your CI Workflow]({% slug using-nuget-keys %})
* [NuGet V2 Feed Error about Returned Unexpected 401 Status Code]({% slug nuget-feed-returned-unexpected-401-status-error %})
