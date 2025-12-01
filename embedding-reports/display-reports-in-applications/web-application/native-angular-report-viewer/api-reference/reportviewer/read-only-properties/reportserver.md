---
title: reportServer
page_title: reportServer property
description: "Configuration for Telerik Report Server connection.  The authentication method depends on the Report Server version: - Report Server for .NET: Supports Token authentication (ReportServerTokenSettings) or username/password authentication (ReportServerSettings). The token can be from any user, including the Guest user. - Report Server for .NET Framework 4.6.2: Supports username/password authentication (ReportServerSettings) or Guest account (url only with ReportServerSettings, if Guest is enabled on the server).  Required when serviceType is set to 'reportServer'. The ReportServerSettings or ReportServerTokenSettings types should be imported from '@progress/telerik-common-report-viewer'.  ReportServerTokenSettings properties: - url (string, required) - The URL to the Telerik Report Server instance. - getPersonalAccessToken (function, required) - A callback function that returns the Token for authentication against the Telerik Report Server for .NET instance wrapped in a Promise. This is the recommended authentication method for Report Server for .NET. The token can be from any user account, including the Guest user. Only supported by Report Server for .NET.  ReportServerSettings properties: - url (string, required) - The URL to the Telerik Report Server instance. - username (string, required) - A registered username in the Report Server that will be used to get access to the reports. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. - password (string, required) - The password for the provided username. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/reportserver
published: True
reportingArea: NativeAngular
---

# reportServer

Configuration for Telerik Report Server connection.
The authentication method depends on the Report Server version:

- Report Server for .NET: Supports Token authentication (ReportServerTokenSettings) or username/password authentication (ReportServerSettings). The token can be from any user, including the Guest user.
- Report Server for .NET Framework 4.6.2: Supports username/password authentication (ReportServerSettings) or Guest account (url only with ReportServerSettings, if Guest is enabled on the server).

Required when serviceType is set to 'reportServer'.
The ReportServerSettings or ReportServerTokenSettings types should be imported from '@progress/telerik-common-report-viewer'.

ReportServerTokenSettings properties:
- url (string, required) - The URL to the Telerik Report Server instance.
- getPersonalAccessToken (function, required) - A callback function that returns the Token for authentication against the Telerik Report Server for .NET instance wrapped in a Promise. This is the recommended authentication method for Report Server for .NET. The token can be from any user account, including the Guest user. Only supported by Report Server for .NET.

ReportServerSettings properties:
- url (string, required) - The URL to the Telerik Report Server instance.
- username (string, required) - A registered username in the Report Server that will be used to get access to the reports. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.
- password (string, required) - The password for the provided username. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.

## Type

`any`

## Examples

````html
<!-- Report Server for .NET - Token authentication (recommended) -->
<reporting-angular-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: getPersonalAccessToken
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</reporting-angular-viewer>
````

````typescript
// Report Server for .NET - Token authentication (recommended)
getPersonalAccessToken() {
  return Promise.resolve('<personal-access-token>');
}
````

````html
<!-- Report Server for .NET - Token authentication with secure endpoint -->
<reporting-angular-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: getPersonalAccessToken
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</reporting-angular-viewer>
````

````typescript
// Report Server for .NET - Token authentication with secure endpoint
getPersonalAccessToken() {
  return fetch('/rs-token')
    .then(response => response.text());
}
````

````html
<!-- Report Server for .NET - Token authentication with Guest user token -->
<reporting-angular-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: getPersonalAccessToken
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</reporting-angular-viewer>
````

````typescript
// Report Server for .NET - Token authentication with Guest user token
getPersonalAccessToken() {
  return Promise.resolve('<guest-user-token>');
}
````

````typescript
// Report Server for .NET - Token authentication using ReportServerTokenSettings
import { ReportServerTokenSettings } from '@progress/telerik-common-report-viewer';

reportServer: ReportServerTokenSettings = new ReportServerTokenSettings(
  'https://my-report-server-net/',
  () => Promise.resolve('<personal-access-token>')
);
````

````html
<!-- Report Server for .NET - Username/password authentication -->
<reporting-angular-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    username: 'myUser',
    password: 'myPassword'
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</reporting-angular-viewer>
````

````typescript
// Report Server for .NET - Username/password authentication using ReportServerSettings
import { ReportServerSettings } from '@progress/telerik-common-report-viewer';

reportServer: ReportServerSettings = new ReportServerSettings(
  'https://my-report-server-net/',
  'myUser',
  'myPassword'
);
````

````html
<!-- Report Server for .NET Framework 4.6.2 - Username/password authentication -->
<reporting-angular-viewer
  [reportServer]="{
    url: 'https://my-report-server-framework/',
    username: 'myUser',
    password: 'myPassword'
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</reporting-angular-viewer>
````

````typescript
// Report Server for .NET Framework 4.6.2 - Username/password authentication using ReportServerSettings
import { ReportServerSettings } from '@progress/telerik-common-report-viewer';

reportServer: ReportServerSettings = new ReportServerSettings(
  'https://my-report-server-framework/',
  'myUser',
  'myPassword'
);
````

````html
<!-- Report Server for .NET Framework 4.6.2 - Guest account (requires Guest enabled on server) -->
<reporting-angular-viewer
  [reportServer]="{
    url: 'https://my-report-server-framework/'
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</reporting-angular-viewer>
````

````typescript
// Complete example with Report Server for .NET using Token authentication
import { Component } from '@angular/core';
import { ReportServerTokenSettings, ReportSource } from '@progress/telerik-common-report-viewer';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {
  reportServer: ReportServerTokenSettings = {
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: this.getPersonalAccessToken
  };

  reportSource: ReportSource = {
    report: 'Samples/Dashboard',
    parameters: {
      ReportYear: 2004
    }
  };

  getPersonalAccessToken() {
    return Promise.resolve('<personal-access-token>');
  }
}
````

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
