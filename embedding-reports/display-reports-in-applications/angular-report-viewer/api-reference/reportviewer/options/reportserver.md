---
title: reportServer
page_title: reportServer property
description: "Sets the configuration details for connecting to a Telerik Report Server.  The authentication method depends on the Report Server version: - Report Server for .NET: Supports Token authentication (getPersonalAccessToken) or username/password authentication. The token can be from any user, including the Guest user. - Report Server for .NET Framework 4.6.2: Supports username/password authentication or Guest account (url only, if Guest is enabled on the server).  Has the following properties: - url (string, required) - The URL to the Telerik Report Server instance. - getPersonalAccessToken (function, optional) - A callback function that returns the Token for authentication against the Telerik Report Server for .NET instance wrapped in a Promise. This is the recommended authentication method for Report Server for .NET. The token can be from any user account, including the Guest user. Only supported by Report Server for .NET. - username (string, optional) - A registered username in the Report Server that will be used to get access to the reports. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used. - password (string, optional) - The password for the provided username. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2.  Required when not using serviceUrl."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/reportserver
published: True
reportingArea: AngularWrapper
---

# The `reportServer` option of the Angular Report Viewer

Sets the configuration details for connecting to a Telerik Report Server.
The authentication method depends on the Report Server version:

- Report Server for .NET: Supports Token authentication (getPersonalAccessToken) or username/password authentication. The token can be from any user, including the Guest user.
- Report Server for .NET Framework 4.6.2: Supports username/password authentication or Guest account (url only, if Guest is enabled on the server).

Has the following properties:
- url (string, required) - The URL to the Telerik Report Server instance.
- getPersonalAccessToken (function, optional) - A callback function that returns the Token for authentication against the Telerik Report Server for .NET instance wrapped in a Promise. This is the recommended authentication method for Report Server for .NET. The token can be from any user account, including the Guest user. Only supported by Report Server for .NET.
- username (string, optional) - A registered username in the Report Server that will be used to get access to the reports. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used.
- password (string, optional) - The password for the provided username. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2.

Required when not using serviceUrl.

## Type

`any`

## Examples

````html
<!-- Report Server for .NET - Token authentication (recommended) -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: getPersonalAccessToken
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````typescript
// Report Server for .NET - Token authentication (recommended)
getPersonalAccessToken() {
  return Promise.resolve('<personal-access-token>');
}
````

````html
<!-- Report Server for .NET - Token authentication with secure endpoint -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: getPersonalAccessToken
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
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
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: getPersonalAccessToken
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````typescript
// Report Server for .NET - Token authentication with Guest user token
getPersonalAccessToken() {
  return Promise.resolve('<guest-user-token>');
}
````

````html
<!-- Report Server for .NET - Username/password authentication -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-net/',
    username: 'myUser',
    password: 'myPassword'
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````html
<!-- Report Server for .NET Framework 4.6.2 - Username/password authentication -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-framework/',
    username: 'myUser',
    password: 'myPassword'
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````html
<!-- Report Server for .NET Framework 4.6.2 - Guest account (requires Guest enabled on server) -->
<tr-viewer
  [reportServer]="{
    url: 'https://my-report-server-framework/'
  }"
  [reportSource]="{
    report: 'Samples/Dashboard'
  }">
</tr-viewer>
````

````typescript
// Complete example with Report Server for .NET using Token authentication
export class AppComponent {
  reportServer = {
    url: 'https://my-report-server-net/',
    getPersonalAccessToken: this.getPersonalAccessToken
  };

  reportSource = {
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

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/overview%})
* [reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/reportsource%})
* [scale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/scale%})

