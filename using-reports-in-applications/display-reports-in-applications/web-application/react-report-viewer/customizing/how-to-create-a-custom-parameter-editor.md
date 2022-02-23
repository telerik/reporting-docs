---
title: How to Create a Custom Parameter Editor
page_title: How to Create a Custom Parameter Editor 
description: How to Create a Custom Parameter Editor
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/customizing/how-to-create-a-custom-parameter-editor
tags: how,to,create,a,custom,parameter,editor
published: True
position: 1
---

# How to Create a Custom Parameter Editor

The article elaborates how to change the default editors for visible parameters in the React Report Viewer's Parameters Area.

Custom parameter editors are defined through the **parameterEditors**  array passed as an option when creating the report viewer widget. Each object represents a parameter editor factory for creating editors suitable to edit a specific report parameter configuration. 


## Setting the Custom Parameter Editor

The following example illustrates how to use the [Kendo DateTimePicker](https://demos.telerik.com/kendo-ui/datetimepicker/index) widget for a DateTime parameter:

1. Each editor is an object which contains two methods: match and createEditor.

   ````js
   function match(parameter) {
     return parameter.type === "System.DateTime";
   }
   
   function createEditor(placeholder, options) {
      var dateTimePicker = $(placeholder).html('<input type="datetime"/>'),
      parameter,
      valueChangedCallback = options.parameterChanged,
      dropDownList;
      
      function onChange() {
        var val = dropDownList.value();
        valueChangedCallback(parameter, val);
      }
      
      return {
        beginEdit: function (param) {
      
            parameter = param;
      
            $(dateTimePicker).find("input").kendoDateTimePicker({
                dataTextField: "name",
                dataValueField: "value",
                value: parameter.value,
                dataSource: parameter.availableValues,
                change: onChange
            });
      
            dropDownList = $(dateTimePicker).find("input").data("kendoDateTimePicker");
        }
      };
   }
````

1. The viewer is using a special Kendo subset that contains only the required widgets and the Kendo DateTimePicker widget is not part of the subset.
For that reason, we need to load the Kendo All script. Note that currently we need to use this special logic for loading the viewer to the fact that jQuery has
to be loaded before Kendo All:

   ````js
   let viewer;
   
   function loadScript(callback) {
     const script = document.createElement("script");
     script.src = "http://kendo.cdn.telerik.com/2020.3.1118/js/kendo.all.min.js";
     script.async = true;
     script.onload = callback;
     document.body.appendChild(script);
   }
      
   class App2 extends Component {
        componentDidMount() {
          loadScript(() => {
            this.setState({ visible: true });
          });
        }
      
        render() {
          return this.state?.visible ? (<div>
            <TelerikReportViewer
              ref={el => viewer = el}     
              reportSource={{
                report: 'MyReport.trdp',
                parameters: {}
              }}
              parameterEditors={{
                match: match,
                createEditor: createEditor
              }} />
      
          </div>) : null;
        }
   }
      
   ReactDOM.render(
     <App2/>,
     document.getElementById('root')
   );   
````



## See Also

* [How to Create a Custom Parameter Editor](%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%}) in the Html5 Report Viewer

