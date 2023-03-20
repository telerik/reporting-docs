---
title: Changing the available connections in the SqlDataSource Wizard Web Report Designer
description: "Learn how to modify the dropdown with the available connection strings in the Telerik Reporting Web Report Designer's SqlDataSource wizard."
type: how-to
page_title: Filtering the dropdown with the connections in SqlDataSource Wizard 
slug: edit-sqldatasource-wizard-available-connections
position: 
tags: web,report,designer,sqldatasource,wizard
ticketid: 1601872
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>Web Application</td>
		</tr>
	</tbody>
</table>


## Description

I want to dynamically change the dropdown with the existing connections in the first step of the SqlDataSource wizard in the Web Report Designer.

By default, the connections dropdown is populated based on the configuration file of the applicatino where the service of the Web Report Designer is running 
and also by the  [ReportDesignerServiceConfiguration](../api/telerik.webreportdesigner.services.ireportdesignerserviceconfiguration).[SettingsStorage](../api/Telerik.WebReportDesigner.Services.ReportDesignerServiceConfiguration#Telerik_WebReportDesigner_Services_ReportDesignerServiceConfiguration_SettingsStorage) property.

However, I would like to be able to dynamically filter those connections, based on the currently logged in user, for example.

## Suggested Workarounds

Currently, the [GetDataConnections](../api/Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase#collapsible-Telerik_WebReportDesigner_Services_Controllers_ReportDesignerControllerBase_GetDataConnections) method used to populate the dropdown is not overridable, 
thus as a workaround, we may instead override the [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) where we may intercept the response of that request and have its JSON modified.

For example:

````JavaScript
        const originalFetch = window.fetch;
        window.fetch = async (...args) => {

            let [resource, config] = args;
            let response = await originalFetch(resource, config);

            if (resource === "api/reportdesigner/dataconnections") {
                // response interceptor
                let json = () =>
                    response
                        .clone()
                        .json()
                        .then((data) => {
                            data.shift();
                            return data;
                        });

                response.json = json;
            }

            return response;
        }
````

The above example simply removes the first element of the array of connections returned by the [GetDataConnections](../api/Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase#collapsible-Telerik_WebReportDesigner_Services_Controllers_ReportDesignerControllerBase_GetDataConnections)
endpoint but the approach allows for more complex logic being used for filtering the array.

>note The URL of the `GetDataConnections` request may differ depending on what base route has been provided in the `Route` attribute of the `ReportDesignerController`.

## See Also

[Intercepting JavaScript Fetch API requests and responses](https://blog.logrocket.com/intercepting-javascript-fetch-api-requests-responses/)
