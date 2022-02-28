---
title: How to Pass Values to Report Parameters
page_title: How to Pass Values to Report Parameters | for React Report Viewer Documentation
description: How to Pass Values to Report Parameters
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,to,pass,values,to,report,parameters
published: True
position: 3
---

# How to Pass Values to Report Parameters

This topic explains how to update the report parameters with values passed from a custom UI instead of using the report viewer's default parameters area. 
The report identifier and all required parameters values for it are packed in a **ReportSource** object. 
To update the report source, the [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method is used. 

## Pass values to report parameters from the application UI

The following example demonstrates how to update the report viewer when the selected value of the dropdown changes:

```js
export function ReportViewer() {
  const viewerRef = useRef(null);

  return (
    <>
      <div id="invoiceIdSelector">
        <label htmlFor="invoiceId">Invoices</label>
        <select defaultValue="SO51081" id="invoiceId" onChange={(e => {
          const { viewerObject } = viewerRef.current;
          viewerObject.reportSource({ report: viewerObject.reportSource().report, parameters: { OrderNumber: e.target.value } })
        })} title="Select the Invoice ID">
          <option value="SO51081">SO51081</option>
          <option value="SO51082">SO51082</option>
          <option value="SO51083">SO51083</option>
        </select>
      </div>
      <TelerikReportViewer
        ref={viewerRef}
        serviceUrl="https://demos.telerik.com/reporting/api/reports/"
        reportSource={{
          report: 'Invoice.trdx',
          parameters: {}
        }}
        viewerContainerStyle={{
          position: 'absolute',
          left: '5px',
          right: '5px',
          top: '40px',
          bottom: '5px',
          overflow: 'hidden',
          clear: 'both',
          fontFamily: 'ms sans serif'
        }}
        viewMode="INTERACTIVE"
        scaleMode="SPECIFIC"
        scale={1.0}
        enableAccessibility={false} />
    </>
  )
}
```

> The React Report Viewer is not a native react.js component. If you use a state variable as the value of a report parameter, the report viewer will not refresh with the new value when the setState method of the state variable is executed.
In order for the report viewer to be updated with the new value, the **reportSource(rs)** method must be called with the updated value of the state variable.

# See Also

* [How to Use React Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service%})

* [How to Use React Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-report-server%})
