<style>
article {
  background: transparent !important;
}

div.contribution-panel {
  display: none;
}

blockquote {
  border: 0;
  margin: 20px 0;
  min-height: 70px;
  padding: 24px 80px;
  background-color: #f9edc6;
  background-image: url("/reporting/assets/important-icon.svg");
  color: #fff;
  background-repeat: no-repeat;
  background-size: 48px;
  background-position: center;
  background-position-x: 16px;
  background-position-y: 50%;
  color: #000000; }
  blockquote:not(.alert-note) a, blockquote:not(.alert-note) a:link {
    color: #000000;
    text-decoration: underline; }
    blockquote:not(.alert-note) a:hover, blockquote:not(.alert-note) a:active, blockquote:not(.alert-note) a:focus, blockquote:not(.alert-note) a:link:hover, blockquote:not(.alert-note) a:link:active, blockquote:not(.alert-note) a:link:focus {
      color: #000000;
      text-decoration: none !important; }
  blockquote p:first-child,
  blockquote ul:first-child,
  blockquote ol:first-child {
    margin-top: 0; }
  blockquote p:last-child,
  blockquote ul:last-child,
  blockquote ol:last-child {
    margin-bottom: 0; }
  blockquote.disclaimer {
    background-color: #eaebec;
    color: #4f5d6c; }
    blockquote.disclaimer p:first-child {
      color: #36393f; }
  blockquote.alert-note {
    margin-top: 2em;
    margin-bottom: 2em;
    background-color: #eaebec;
    color: #4f5d6c; }
  blockquote.important {
    background-color: #f9edc6;
    background-image: url("/reporting/assets/important-icon.svg"); }
  blockquote.caution {
    background-color: #f7e1df;
    background-image: url("/reporting/assets/caution-icon.svg"); }
  blockquote.tip {
    background-color: #e4f1df;
    background-image: url("/reporting/assets/tip-icon.svg"); }


article:not(.api-reference)>p:first-child, article:not(.api-reference) h1+p {
  font-size: 18px;
  font-weight: 300;
  line-height: 24px;
  margin-top: 15px;
  margin-bottom: 20px;
  font-family: "Roboto", Helvetica, Arial, sans-serif;
  color: #8a959f;
}

@media (min-width: 768px) {
  article:not(.api-reference)>p:first-child, article:not(.api-reference) h1+p {
    font-size: 22px;
    line-height: 28px;
  }
}

@media (min-width: 1025px) {
  article:not(.api-reference)>p:first-child, article:not(.api-reference) h1+p {
    font-size: 26px;
    line-height: 32px;
  }
}

</style>

# Telerik Reporting API Reference
The API reference section of the documentation contains a list and descriptions of all public available classes, methods and properties of the Telerik Reporting product.

> This documentation refers to the latest version of Telerik Reporting libraries.


The following tables list the most used members of the different libraries.

## Report Definition

<table>
    <tbody>
        <tr>
            <th><span style="font-weight: bold;">Namespace</span></th>
            <th><span style="font-weight: bold;">Class Name</span></th>
            <th><span style="font-weight: bold;">Description</span></th>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.html">Telerik.Reporting</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Report.html">Report</a> Definition Item</td>
            <td>The base Report Definition Item class. It contains empty Page Header, Details and Page Footer sections.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.html">Telerik.Reporting</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.List.html">List</a>, <a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Table.html">Table</a>, <a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Crosstab.html">Crosstab</a>, <a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Graph.html">Graph</a> Definition Data Items</td>
            <td>The most used Data Items in the report.</td>
        </tr>
       <tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.html">Telerik.Reporting</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.SqlDataSource.html">SqlDataSource</a>, <a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.WebServiceDataSource.html">WebServiceDataSource</a>, <a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.ObjectDataSource.html">ObjectDataSource</a></td>
            <td>The most used Data Source components in the report.</td>
        </tr>
    </tbody>
</table>

## Report Processing

<table>
    <tbody>
        <tr>
            <th><span style="font-weight: bold;">Namespace</span></th>
            <th><span style="font-weight: bold;">Class Name</span></th>
            <th><span style="font-weight: bold;">Description</span></th>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Processing.html">Telerik.Reporting.Processing</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Processing.Report.html">Report</a> Processing Item</td>
            <td>The Processing Report Item class.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Processing.html">Telerik.Reporting.Processing</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Processing.ReportProcessor.html">ReportProcessor</a></td>
			<td>The Reporting Engine class. Use to export and print reports programmatically</td>
        </tr>
    </tbody>
</table>

## Reporting Services

<table>
    <tbody>
        <tr>
            <th><span style="font-weight: bold;">Namespace</span></th>
            <th><span style="font-weight: bold;">Class Name</span></th>
            <th><span style="font-weight: bold;">Description</span></th>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Services.html">Telerik.Reporting.Services</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Services.ReportSourceResolverBase.html">ReportSourceResolverBase</a></td>
            <td>The Telerik Reporting REST Service basic ReportSource Resolver class for ASP.NET Framework.</td>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Services.html">Telerik.Reporting.Services</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Services.TypeReportSourceResolver.html">TypeReportSourceResolver</a></td>
            <td>The Telerik Reporting REST Service built-in ReportSource Resolver for CLR (CS/VB) report definitions.</td>
        </tr>
		<tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Services.html">Telerik.Reporting.Services</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.Reporting.Services.UriReportSourceResolver.html">UriReportSourceResolver</a></td>
            <td>The Telerik Reporting REST Service built-in ReportSource Resolver for descriptive (TRDP/TRDX) report definitions.</td>
        </tr>
    </tbody>
</table>

## Report Viewers

<table>
    <tbody>
        <tr>
            <th><span style="font-weight: bold;">Namespace</span></th>
            <th><span style="font-weight: bold;">Class Name</span></th>
            <th><span style="font-weight: bold;">Description</span></th>
        </tr>
        <tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.ReportViewer.WinForms.html">Telerik.ReportViewer.WinForms</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/TelerikTelerik.ReportViewer.WinForms.ReportViewer.html">ReportViewer</a> WinForms</td>
            <td>The Telerik Reporting ReportViewer for .NET Framework Windows Forms applications.</td>
        </tr>
		<tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.ReportViewer.WPF.html">Telerik.ReportViewer.WPF</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/TelerikTelerik.ReportViewer.WPF.ReportViewer.html">ReportViewer</a> WPF</td>
            <td>The Telerik Reporting ReportViewer for .NET Framework WPF applications.</td>
        </tr>
		<tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.ReportViewer.Html5.WebForms.html">Telerik.ReportViewer.Html5.WebForms</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/TelerikTelerik.ReportViewer.Html5.WebForms.ReportViewer.html">ReportViewer</a> ASP.NET WebForms</td>
            <td>The Telerik Reporting ReportViewer for ASP.NET Web Forms applications. Wrapper of the pure Html5 Report Viewer</td>
        </tr>
		<tr>
            <td><a href="https://docs.telerik.com/reporting/api/Telerik.ReportViewer.Html5.MVC.html">Telerik.ReportViewer.Html5.MVC</a></td>
            <td><a href="https://docs.telerik.com/reporting/api/TelerikTelerik.ReportViewer.Html5.MVC.ReportViewer.html">ReportViewer</a> ASP.NET MVC</td>
            <td>The Telerik Reporting ReportViewer for ASP.NET MVC applications. Wrapper of the pure Html5 Report Viewer</td>
        </tr>
    </tbody>
</table>