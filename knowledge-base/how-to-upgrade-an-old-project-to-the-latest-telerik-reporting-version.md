---
title: Upgrading Old Projects to the Latest Telerik Reporting
description: "Learn how to upgrade your old project successfully and catch up with the API changes in the later versions. This is a guide to upgrade old Telerik Reporting project to the latest version."
type: how-to
page_title: Upgrade from old to the latest version of Telerik Reporting
slug: how-to-upgrade-an-old-project-to-the-latest-telerik-reporting-version
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>All</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

You have an old Telerik Reporting project and you want to upgrade it to latest version. When you upgrade an old project directly to the latest version of Telerik Reporting you may see build errors. The reason is API changes introduced during the years.

To upgrade Telerik Reporting to the latest version without a problem you can rely on the fact that we keep obsolete code for at least an year before changing the API. In the transition period Report Designers are configured to reserialize the obsolete code from the report's definition, and to update it with the new standard.

## Solution

The recommended approach for upgrading is to download an official release of each year between the project's Telerik Reporting version and the target version. Then you can upgrade the project, and check each report in order to remove warning for obsolete code. A small change in the designer will cause it to reserialize the report definition.

Details how to download MSI files and upgrade project's items can be found in [Installing Telerik Reporting]({%slug telerikreporting/installation%}) and [Upgrading Telerik Reporting Projects]({%slug telerikreporting/upgrade/overview%}).

## Notes

Here are the most important changes in Telerik Reporting during the last several years and the respective information sources:

* Reports should be wrapped in a [report source object]({%slug telerikreporting/designing-reports/report-sources/overview%}) in order to be passed to a report viewer, SubReport or action - [How to migrate your project to utilize the new ReportSource objects]({%slug how-to-migrate-your-project-to-utilize-the-new-reportsource-objects%}).
* As of [Q1 2013](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q1-2013) there are removed several obsolete properties and namespaces.
* As of [Q2 2013](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q2-2013) Telerik Reporting is built against .NET4 framework Full Profile, which is supported in Visual Studio 2010+ versions. Also the old Chart item is made obsolete. Its successor is the native reporting [Graph item]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}).
* As of [Q3 2013](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q3-2013) there is a new web viewer - the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}), which is a client-side widget served by a running [Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}), dedicated to work with the viewer.
* As of [Q1 2014](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q1-2014) the WPF and Silverlight ReportViewer controls use only implicit styles.
* As of [Q3 2015](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-q3-2015-(version-9-2-15-930)) the old ASP.NET WebForms ReportViewer is obsolete.
* As of [R3 2016](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-r3-2016-(version-10-2-16-914)) the ObjectDataSource component requires additional settings (security improvement).
* As of **R3 2016** changes on report items definitions in events are not accepted - [Upgrade issues with ObjectDataSource Component after Telerik Reporting R3 2016]({%slug telerik-reporting-r3-2016---upgrade-issues-with-objectdatasource-component%}).

## See Also

* [Telerik Reporting Release History](https://www.telerik.com/support/whats-new/reporting/release-history)
* [Upgrade Path Overview]({%slug telerikreporting/upgrade/overview%})
