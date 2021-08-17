---
title: How to upgrade an old project to the latest Telerik Reporting version
description: Upgrade your old project successfully and catch up with the API changes in the later versions. This is a guide to upgrade old Telerik Reporting project to the latest version.
type: how-to
page_title: Upgrade from old to latest version of Telerik Reporting
slug: how-to-upgrade-an-old-project-to-the-latest-telerik-reporting-version
res_type: kb
category: knowledge-base
---

## DESCRIPTION
You have an old Telerik Reporting project and you want to upgrade it to the latest version. When you upgrade an old project directly to the latest version of Telerik Reporting you may see build errors. The reason is API changes introduced during the years.  

This article will guide you on the steps to upgrade to the latest version of Telerik Reporting without build errors.

## SOLUTION   
To upgrade Telerik Reporting to the latest version without a problem you can rely on the fact that we keep obsolete code for at least an year before changing the API. In the transition period Report Designers are configured to reserialize the obsolete code from the report's definition, and to update it with the new standard.  

The recommended approach for upgrading is to download an official release of each year between the project's Telerik Reporting version and the target version. Then you can upgrade the project, and check each report in order to remove warning for obsolete code. A small change in the designer will cause it to reserialize the report definition.  

Details how to download MSI files and upgrade project's items can be found in <a href="http://docs.telerik.com/reporting/installation-installing-from-msi" target="_blank">Installing Telerik Reporting</a> and <a href="http://docs.telerik.com/reporting/installation-upgrading-newer-version" target="_blank">Upgrading Telerik Reporting Projects</a>.  

### Some important changes during the years:  
- Reports should be wrapped in a <a href="https://docs.telerik.com/reporting/report-sources" target="_blank">report source object</a> in order to be passed to a report viewer, SubReport or action - <a href="/support/kb/reporting/details/how-to-migrate-your-project-to-utilize-the-new-reportsource-objects" target="_blank">How to migrate your project to utilize the new ReportSource objects</a>.
- As of <a href="/support/whats-new/reporting/release-history/telerik-reporting-q1-2013" target="_blank">Q1 2013</a> there are removed several obsolete properties and namespaces.
- As of <a href="/support/whats-new/reporting/release-history/telerik-reporting-q2-2013" target="_blank">Q2 2013</a> Telerik Reporting is built against .NET4 framework Full Profile, which is supported in Visual Studio 2010+ versions. Also the old Chart item is made obsolete. Its successor is the native reporting <a href="https://docs.telerik.com/reporting/graphoverview" target="_blank">Graph item</a>.
- As of <a href="/support/whats-new/reporting/release-history/telerik-reporting-q3-2013" target="_blank">Q3 2013</a> there is a new web viewer - the <a href="https://docs.telerik.com/reporting/html5-report-viewer-system-requirements" target="_blank">HTML5 Report Viewer</a>, which is a client-side widget served by a running <a href="https://docs.telerik.com/reporting/telerik-reporting-rest-conception" target="_blank">Reporting REST service</a>, dedicated to work with the viewer.
- As of <a href="/support/whats-new/reporting/release-history/telerik-reporting-q1-2014" target="_blank">Q1 2014</a> the WPF and Silverlight ReportViewer controls use only implicit styles.
- As of <a href="/support/whats-new/reporting/release-history/telerik-reporting-q3-2015-(version-9-2-15-930)" target="_blank">Q3 2015</a> the old ASP.NET WebForms ReportViewer is obsolete.
- As of <a href="http://docs.telerik.com/reporting/upgrade-path-2016-r3" target="_blank">R3 2016</a> the ObjectDataSource component requires additional settings (security improvement).
- As of <a href="/support/kb/reporting/deploy-to-web-desktop-cloud/details/telerik-reporting-r3-2016---upgrade-issues-with-objectdatasource-component" target="_blank">R3 2016</a> changes on report items definitions in events are not accepted.

## Additional Resources

**<a href="/support/whats-new/reporting/release-history" target="_blank">Telerik Reporting Release Notes</a>.**
**<a href="/reporting/upgradepathoverview" target="_blank">Upgrade Path help articles</a>.**

