---
title: Setting Object Data Source in Telerik Report Server Docker Container
description: Learn how to correctly add and configure an object data source in Telerik Report Server hosted in a Docker container.
type: how-to
page_title: Configuring Object Data Source in Report Server on Docker
meta_title: Configuring Object Data Source in Report Server on Docker
slug: configuring-object-data-source-report-server-docker
tags: report-server,docker,object-datasource,assembly,configuration
res_type: kb
ticketid: 1709828
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Report Server</td>
</tr>
<tr>
<td>Version</td>
<td>11.3.26.121</td>
</tr>
</tbody>
</table>

## Description

I need to configure an object data source in Telerik Report Server hosted in a Docker container. I added the `.dll` file to the container's `app` directory but the data source does not appear in the wizard after restarting the container. Additionally, attempts to configure the assembly through the `appsettings.json` file and volumes in the `docker-compose.yml` file did not persist across container restarts. I also encountered an error regarding an undefined service "storage" in the `docker-compose.yml` file.

This knowledge base article also answers the following questions:
- How to add an external assembly in Telerik Report Server in Docker?
- Why does my object data source not appear in the Telerik Report Server?
- How to configure storage in Docker Compose for Telerik Report Server?

## Solution

To configure an object data source in Telerik Report Server hosted in a Docker container, follow these steps:

1. Add the `.dll` file to the container's `app` directory. For example, `/app/FuneralBase.Reporting.Bridge.dll`.

2. Update the `appsettings.json` file in the same directory to explicitly allow the assembly. Use the following configuration:
   ```json
   {
     "telerikReporting": {
       "assemblyReferences": [
         {
           "name": "FuneralBase.Reporting.Bridge"
         }
       ]
     }
   }
   ```

3. Ensure the `docker-compose.yml` file includes a storage service and mounts the necessary files. Use the following configuration:
   ```yaml
   services:
     telerik-report-server:
       image: progressofficial/telerik-reportserver-app:latest
       restart: always
       environment:
         - RSNET_AMO=True
         - RSNET_Platform=AMO
         - reportServer__storage__provider=MsSqlServer
         - reportServer__storage__parameters__0__name=ConnectionString
         - reportServer__storage__parameters__0__value=Server=tcp:<host>,1433;Initial Catalog=TelerikReportServer;Persist Security Info=False;User ID=sa;Password=<password>;Encrypt=False
       volumes:
         - ./FuneralBase.Reporting.Bridge.dll:/app/FuneralBase.Reporting.Bridge.dll
         - ./appsettings.json:/app/appsettings.json
       ports:
         - "80:80"
       depends_on:
         - storage
     storage:
       image: "mcr.microsoft.com/mssql/server:2022-latest"
       restart: always
       environment:
         - MSSQL_SA_PASSWORD=<password>
         - ACCEPT_EULA=Y
       volumes:
         - mssql-storage:/var/opt/mssql

   volumes:
     mssql-storage:
   ```

4. Restart the container to apply changes using the `docker restart <container-name>` command.

5. Verify the assembly and updated `appsettings.json` file are present in the container using the Docker Desktop GUI or command-line tools.

6. If you encounter issues with the container creating new instances on each restart, ensure the storage configuration is correctly set up in the `docker-compose.yml` file.

By following these steps, the object data source should appear in the Telerik Report Server wizard.

## See Also

- [AssemblyReferences Element](https://www.telerik.com/products/reporting/documentation/doc-output/configure-the-report-engine/assemblyreferences-element)
- [REST API Reference for Telerik Report Server](https://www.telerik.com/report-server/documentation/implementer-guide/apis/rest-api/v2/get-api-reportserver-v2-data-ods-types)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
