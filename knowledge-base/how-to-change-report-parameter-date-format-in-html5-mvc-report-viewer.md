---
title: How to change report parameter date format in HTML5 MVC Report Viewer
description: How to change report parameter date format in HTML5 MVC Report Viewer.
type: how-to
page_title: How to change report parameter date format in HTML5 MVC Report Viewer
slug: how-to-change-report-parameter-date-format-in-html5-mvc-report-viewer
res_type: kb
---

## Description

Change the default **DateTime** report parameter format in HTML5 MVC Report Viewer

## Solution

In Telerik Reporting the default element for editing DateTime Paremeters is kendoDatePicker. Its default DateTime format depends on the [culture](../designing-reports-report-globalization) settings of the environment.

There are two major ways to change the default DateTime Parameter format that we would describe in this article.


1. Change **kendoDatePicker** format.

With this approach the new date format is assigned to the **kendoDatePicker** through the **UpdateUi** event. Since the event is raised multiple times during ReportViewer lifecycle, a flag is used to indicate whether date format change is necessary, to avoid calling the *setDateFormat* function on each UpdateUi raising.

The following script section should be added (in the head section) to the **ReportViewer.cshtml** file

```html
<script>
        var dateUpdated = false;// Flag to indicate that date format has been set
 
        function setDateFormat(dateFormat) {
            var datepicker = $("#reportViewer1").find("[data-role='datepicker']");
            if (datepicker.length > 0) {
                dateUpdated = true;
 
                for (var i = 0; i < datepicker.length; i += 1) {
                    var dp = $(datepicker[i]).data("kendoDatePicker");
                    var currentFormat = dp.options.format;
                    var oldValue = dp.value();
 
                    dp.options.format = dateFormat;
                    dp.value(oldValue);
                }
            }
        }
 
        function onUpdateUi() {
            // Skip if date format already set
            if (!dateUpdated) {
                setDateFormat("dd/MM/yyyy");//SPECIFY THE DATE FORMAT HERE
            }
        }
    </script>
```

The following script shows how the ReportViewer description would look like in the **.cshtml** file after adding the UpdateUi event.

```cs
    <body>
    @(Html.TelerikReporting().ReportViewer()
        .Id("reportViewer1")
        .ServiceUrl(Url.Content("~/api/reports"))
        .ReportSource(new TypeReportSource() { TypeName = "ReportLibrary1.Report1, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" })
        .ViewMode(ViewMode.Interactive)
        .ScaleMode(ScaleMode.Specific)
        .Scale(1.0)
        .PersistSession(false)
        .PrintMode(PrintMode.AutoSelect)
        .ClientEvents(
                    editors => editors
                        .UpdateUi("onUpdateUi")
            )
    )
    </body>
```

2. Create **custom parameter editor** for the DateTime Parameter.

Details on how to create custom parameter editor could be found in [this help article](../html5-report-viewer-howto-custom-parameter-editor).

The following script section should be added (in the head section) to the ReportViewer .cshtml file


```html
<script>
        function customMatch(parameter) {
            return parameter.type === "System.DateTime";
        }
 
        function createCustomEditor(placeholder, options) {
            $(placeholder).html('<input type="datetime"/>');
            var datePicker = $(placeholder),
                              parameter,
                              valueChangedCallback = options.parameterChanged,
                              dropDownList;
 
            function onChange() {
                var dtv = this.value();
                valueChangedCallback(parameter, dtv);
            }
 
            return {
                beginEdit: function (param) {
                    parameter = param;
 
                    var dt = null;
                    try {
                        if (param.value) {
                            dt = param.value;
                        }
                    } catch (e) {
                        dt = null;
                    }
 
                    $(datePicker).find("input").kendoDatePicker({
                        format: "MM/dd/yyyy",//SPECIFY THE DATE FORMAT HERE
                        change: onChange,
                        value: dt
                    });
 
                    dropDownList = $(datePicker).find("input").data("kendoDatePicker");
                }
            };
        }
</script>
```


The property *ParameterEditors* of the ReportViewer should be set in the body section of the ReportViewer .cshtml file, and it will look like this

```cs
<body>
    @(Html.TelerikReporting().ReportViewer()
        .Id("reportViewer1")
        .ServiceUrl(Url.Content("~/api/reports"))
        .ReportSource(new TypeReportSource() { TypeName = "ReportLibrary1.Report1, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" })
        .ViewMode(ViewMode.Interactive)
        .ScaleMode(ScaleMode.Specific)
        .Scale(1.0)
        .PersistSession(false)
        .PrintMode(PrintMode.AutoSelect)
        .ParameterEditors(
                    editors => editors
                        .CustomEditors(new CustomParameterEditor
                        {
                            MatchFunction = "customMatch",
                            CreateEditorFunction = "createCustomEditor"
                        })
            )
    )
</body>
```



