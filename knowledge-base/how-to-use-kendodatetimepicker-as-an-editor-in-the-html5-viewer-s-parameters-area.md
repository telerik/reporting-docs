---
title: How to use kendoDateTimePicker as an editor in the HTML5 Viewer's Parameters Area
description: How to replace the default kendoDatePicker with kendoDateTimePicker widget.
type: how-to
page_title: Implementing the kendoDateTimePicker editor in the HTML5 Viewer's Parameters Area
slug: how-to-use-kendodatetimepicker-as-an-editor-in-the-html5-viewer-s-parameters-area
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
        <tr>
			<td>Project Type</td>
			<td>Web Application</td>
		</tr>
        <tr>
			<td>Report Viewer</td>
			<td>HTML5 Report Viewer</td>
		</tr>
	</tbody>
</table>

  
## Description  

Telerik Reporting provides an HTML5 Viewer that is a client-side HTML/CSS/JS widget built with [Telerik Kendo UI Widgets]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}). The viewer can be configured to use different than the default widgets in its structure, where the selected widgets should comply to the following requirements: 

- [HTML5 Viewer JavaScript declaration - How To: Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%});
- [ASP.NET MVC Wrapper of the HTML5 Viewer - How To: Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/customizing/how-to-create-a-custom-parameter-editor%});
- [ASP.NET WebForms wrapper of the HTML5 Viewer - How To: Create a Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-create-a-custom-parameter-editor%}).


Telerik **kendoDateTimePicker** widget is not included in the Kendo UI JavaScript distributed by Telerik Reporting through *telerikReportViewer.kendo-x.x.x.min.js* file, or *kendo.subset.2015.3.930.min.js* in older versions. 

You will have to replace the Kendo UI subset with the full Kendo UI JavaScript e.g. *kendo.all.min.js*.  
  
## Solution

```html
<script type="text/javascript">
    $(document).ready(function () {
        $("#reportViewer1")
            .telerik_ReportViewer({
                // The URL of the service which will serve reports.
                serviceUrl: "/api/reports",
                //ReportSource - string description of the report we want from the server
                reportSource: { report: "SampleReport.trdp" },
                // Specifies whether the viewer is in interactive or print preview mode.
                viewMode: telerikReportViewer.ViewModes.INTERACTIVE,
                // Sets the scale mode of the viewer.
                scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
                // Zoom in and out the report using the scale
                scale: 1.0,
                //the custom parameter editor
                parameterEditors: [
                {
                      match: function (parameter) {
                      return parameter.type === "System.DateTime";
                  },
 
                  createEditor: function (placeholder, options) {
                      $(placeholder).html('<input type="datetime"/>');
                      var dateTimePicker = $(placeholder),
                                           parameter,
                                           valueChangedCallback = options.parameterChanged,
                                           dropDownList;
 
                      function onChange() {
                          var dtv = this.value();
                          if (null !== dtv) {
                              dtv = myadjustTimezone(dtv);
                          }
                          valueChangedCallback(parameter, dtv);
                      }
 
                      return {
                          beginEdit: function (param) {
                              parameter = param;
 
                              var dt = null;
                              try {
                                  if (param.value) {
                                      dt = myunadjustTimezone(param.value);
                                  }
                              } catch (e) {
                                  dt = null;
                              }
                                //you can configure the widget
                              $(dateTimePicker).find("input").kendoDateTimePicker({
                                  format: "dd/MM/yyyy hh:mm:ss",
                                  min: new Date(2014, 0, 1, 8, 0, 0),
                                  max: new Date(2018, 0, 4, 22, 0, 0),
                                  change: onChange,
                                  value: dt
                              });
                              dropDownList = $(dateTimePicker).find("input").data("kendoDateTimePicker");
                          }
                      }
                  }
              }]
            });
    });
 
    //functions required for adjusting the Date and Time selection to avoid sending and receiving dates, which are not in UTC
    function myadjustTimezone(date) {
        return new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds(), date.getMilliseconds()));
    };
    function myunadjustTimezone(date) {
        return new Date(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(), date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds(), date.getUTCMilliseconds());
    };
 
</script>
```
## Notes

- We adjust the dates that we send and receive in order to always work with **UTC** dates. Working with local times may cause issues if the server machine is in other timezone than the client machines.  
  
- If you prefer to not use the Parameters Area, you can create an external UI that updates the HTML5 Viewer's reportSource in JavaScript - [How To: Pass Values to Report Parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-pass-values-to-report-parameters%}).

