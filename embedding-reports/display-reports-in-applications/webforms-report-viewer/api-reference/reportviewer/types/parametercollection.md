---
title: Telerik.ReportViewer.Html5.WebForms.ParameterCollection
page_title: Telerik.ReportViewer.Html5.WebForms.ParameterCollection Type
description: "Represents a collection of Telerik.ReportViewer.Html5.WebForms.Parameter objects used for configuring report parameters in the HTML5 WebForms ReportViewer. Used to manage parameter values that are passed to reports during initialization and processing. The collection prevents duplicate parameter names by updating existing parameter values when adding parameters with matching names."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametercollection
published: True
reportingArea: WebForms
---

# The `ParameterCollection` type of the HTML5 ASP.NET WebForms Report Viewer

Represents a collection of [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameter%}) objects used for configuring report parameters in the HTML5 WebForms ReportViewer. Used to manage parameter values that are passed to reports during initialization and processing. The collection prevents duplicate parameter names by updating existing parameter values when adding parameters with matching names.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Add(System.String,System.Object) | - | Creates a [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameter%}) with specific settings and<br>adds it to the <br>[`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametercollection%}) or updates an existing one. |
| AddRange(System.Collections.Generic.IEnumerable{Telerik.ReportViewer.Html5.WebForms.Parameter}) | - | Adds/updates an enumerable of [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameter%}) objects to/in the <br>[`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametercollection%}).<br><br>The [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameter%}) objects returned from the<br>enumerable are appended to the end of the <br>[`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametercollection%}) or updated in place. |
| Contains(System.String) | `System.Boolean` | Determines whether the [`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametercollection%})<br>contains a parameter with a specific name. |
| Equals(System.Object) | `System.Boolean` | Determines whether the current ParameterCollection is equal to the specified object. |
| Equals(Telerik.ReportViewer.Html5.WebForms.ParameterCollection) | `System.Boolean` | Determines whether the current ParameterCollection is equal to another ParameterCollection by comparing all parameter values.<br>Performs deep comparison of all parameters including their names and values for collection equality determination. |
| GetHashCode | `System.Int32` | Serves as the default hash function for the ParameterCollection.<br>Calculates a hash code from all parameters in the collection to support proper hash table operations. |
| IndexOf(System.String) | `System.Int32` | Determines the index of a specific parameter in the<br>[`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametercollection%}). |
| InsertItem(System.Int32,Telerik.ReportViewer.Html5.WebForms.Parameter) | - | Inserts a parameter at the specified index, or updates an existing parameter if one with the same name already exists.<br>If a parameter with the same name already exists, the existing parameter's value is updated instead of adding a duplicate. |
| Item(System.String) | [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameter%}) | Gets a [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameter%}) by name from the collection.<br>Provides indexed access to parameters by name for convenient parameter value retrieval and assignment. |
| SetItem(System.Int32,Telerik.ReportViewer.Html5.WebForms.Parameter) | - | Sets the parameter at the specified index, or updates an existing parameter if one with the same name already exists.<br>If a parameter with the same name already exists at a different index, the existing parameter's value is updated instead of setting at the specified index. |
| ToString | `System.String` | Returns a string representation of the ParameterCollection containing all parameter information.<br>Provides a compact string representation of all parameters for debugging and logging purposes. |

## See Also

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
