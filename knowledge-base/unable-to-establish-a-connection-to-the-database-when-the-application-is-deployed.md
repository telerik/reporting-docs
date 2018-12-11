---
title: Error Unable to establish a connection to the database when the application is deployed
description: Upon deploying an error message Unable to establish a connection to the database when the application is deployed has been thrown
type: troubleshooting
page_title: Error Unable to establish a connection to the database when the application is deployed
slug: unable-to-establish-a-connection-to-the-database-when-the-application-is-deployed
position: 
tags: Configuration
ticketid: 1361723
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.2.18.912</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Error Message
The error message 
```
Unable to establish a connection to the database. Please verify that your connection string is valid. In case you use a named connection string from
the application configuration file, make sure the name is correct and the connection string settings are present in the configuration file of your
application.
------------- InnerException -------------
The 'DbProviderFactories' section can only appear once per config file.
```
 is returned from the attempt to deploy an application to a server.

## Cause\Possible Cause(s)
The issues is caused by multiple **DbProviderFactory** entries in the *machine.config* file on the server. 

## Solution
Check the specified configuration files and compare them with development machine's ones. Alternatively, some troubleshooting instructions are discussed in the following stackoverflow threads:
- [Override machine.config by web.config](https://stackoverflow.com/questions/2201242/override-machine-config-by-web-config)
- ['DbProviderFactories' section can only appear once per config file error](https://forums.asp.net/t/1693277.aspx?+DbProviderFactories+section+can+only+appear+once+per+config+file+error)
