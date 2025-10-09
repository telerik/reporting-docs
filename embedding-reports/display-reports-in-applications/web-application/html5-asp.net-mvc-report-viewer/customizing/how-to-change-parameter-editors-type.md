---
title: Changing the Parameter Editors Type
page_title: Modify the Parameter Editors Type in HTML5 MVC Report Viewer
description: "Learn how the default parameter editors can be changed from the initialization code of the HTML5 MVC Report Viewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-change-parameter-editors-type
tags: how,to,change,parameter,editors,type
published: True
reporting_area: MVCWrapper
position: 3
previous_url: /html5-mvc-report-viewer-change-parameters-editors-type
---

# Changing Parameter Editors Type Overview

The article elaborates how to change the default parameters editors types for visible parameters in the HTML5 Viewer's Parameters Area.

The parameters editors types are defined through the Parameters method when creating the Telerik Report Viewer widget. The available parameter editors on which the type can be changed are:

The following example illustrates how to set the Parameters method to the Telerik Report Viewer widget.

```CSHTML
@(Html.TelerikReporting().ReportViewer()
    .Parameters(new Parameters {
        Editors = new Editors {
            SingleSelect = EditorTypes.ComboBox,
            MultiSelect = EditorTypes.ComboBox
            }
        }
    ))
```

> The `.Parameters` method is optional. If not used, the Telerik Report Viewer will fall back to the [default values]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}).

## See Also

- [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})

- [How To: Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
