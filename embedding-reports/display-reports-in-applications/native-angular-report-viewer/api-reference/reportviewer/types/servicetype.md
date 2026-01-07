---
title: types.ServiceType
page_title: types.ServiceType Type
description: "Service type options for the Native Angular Report Viewer. The available service types are: - 'REST': A Telerik Reporting REST Service. - 'reportServer': A Telerik Report Server instance."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/types/servicetype
published: True
reportingArea: NativeAngular
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ServiceType` type of the Native Angular Report Viewer

Service type options for the Native Angular Report Viewer.
The available service types are:

- 'REST': A Telerik Reporting REST Service.
- 'reportServer': A Telerik Report Server instance.

## Type Definition

````typescript
type ServiceType = "REST" | "reportServer";
````

