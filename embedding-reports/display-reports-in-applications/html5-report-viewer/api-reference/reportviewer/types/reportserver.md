---
title: ReportServer
page_title: ReportServer Type
description: "Configuration for connecting to a Telerik Report Server instance. Required if serviceUrl is not provided.  Authentication options: - Report Server for .NET: Supports Token authentication (getPersonalAccessToken) or username/password authentication. The token can be from any user, including the Guest user. - Report Server for .NET Framework 4.6.2: Supports username/password authentication or Guest account (url only, if Guest is enabled on the server)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/reportserver
published: True
reportingArea: HTML5
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

# The `ReportServer` type of the HTML5 Report Viewer

Configuration for connecting to a Telerik Report Server instance.
Required if serviceUrl is not provided.
Authentication options:

- Report Server for .NET: Supports Token authentication (getPersonalAccessToken) or username/password authentication. The token can be from any user, including the Guest user.
- Report Server for .NET Framework 4.6.2: Supports username/password authentication or Guest account (url only, if Guest is enabled on the server).

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| url | `string` | The URL to the Telerik Report Server instance. (required) |
| getPersonalAccessToken | `function` | A callback function that returns the Token for authentication against the Telerik Report Server for .NET instance wrapped in a Promise. This is the recommended authentication method for Report Server for .NET. The token can be from any user account, including the Guest user. Only supported by Report Server for .NET. (optional) |
| username | `string` | A registered username in the Report Server that will be used to get access to the reports. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. If omitted when connecting to Report Server for .NET Framework 4.6.2 with Guest enabled, the built-in Guest account will be used. (optional) |
| password | `string` | The password for the provided username. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. Can be omitted only when connecting with the Guest account to Report Server for .NET Framework 4.6.2. (optional) |

## Example

````JavaScript
// Example: Report Server for .NET - Token authentication (recommended)
var reportServer = {
  url: "https://my-report-server-net/",
  getPersonalAccessToken: function() {
    return Promise.resolve("<personal-access-token>");
  }
};
````

````JavaScript
// Example: Report Server for .NET - Token authentication with a secure endpoint
var reportServer = {
  url: "https://my-report-server-net/",
  getPersonalAccessToken: function() {
    return fetch('/rs-token')
      .then(response => response.text());
  }
};
````

````JavaScript
// Example: Report Server for .NET - Token authentication with Guest user token
var reportServer = {
  url: "https://my-report-server-net/",
  getPersonalAccessToken: function() {
    return Promise.resolve("<guest-user-token>");
  }
};
````

````JavaScript
// Example: Report Server for .NET - Username/password authentication
var reportServer = {
  url: "https://my-report-server-net/",
  username: "myUser",
  password: "myPassword"
};
````

````JavaScript
// Example: Report Server for .NET Framework 4.6.2 - Username/password authentication
var reportServer = {
  url: "https://my-report-server-framework/",
  username: "myUser",
  password: "myPassword"
};
````

````JavaScript
// Example: Report Server for .NET Framework 4.6.2 - Guest account (requires Guest enabled on server)
var reportServer = {
  url: "https://my-report-server-framework/"
};
````

````JavaScript
// Example: Complete Report Viewer initialization with Report Server for .NET using Token authentication
$("#reportViewer").telerik_ReportViewer({
  reportServer: {
    url: "https://my-report-server-net/",
    getPersonalAccessToken: function() {
      return Promise.resolve("<personal-access-token>");
    }
  },
  reportSource: {
    report: "Samples/Dashboard",
    parameters: {
      ReportYear: 2004
    }
  }
});
````

