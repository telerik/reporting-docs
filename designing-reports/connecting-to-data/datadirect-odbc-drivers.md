---
title: DataDirect ODBC Drivers
page_title: DataDirect ODBC Drivers | for Telerik Reporting Documentation
description: DataDirect ODBC Drivers
slug: telerikreporting/designing-reports/connecting-to-data/datadirect-odbc-drivers
tags: datadirect,odbc,drivers
published: True
position: 5
---

# DataDirect ODBC Drivers



Our product can connect to virtually any database through an ADO.NET or ODBC data provider, but these providers usually require downloading, installing and setting up a 3rd party driver         on the client's machine, which makes the setup unnecessarily complicated. Telerik Reporting helps easing the process, coming with a bundle of Progress DataDirect® ODBC drivers that can         connect your report to some of the major databases used today. The DataDirect drivers are recognized as a market leading product, providing high performance and rich data sources coverage.       

## Progress DataDirect® ODBC Drivers Bundle

>note These DataDirect ODBC drivers are branded and will work exclusively with Telerik Reporting and Telerik ReportServer runtime. They are not intended to be used in a             3rd party application and will display a warning message when used without authorization.           


The drivers library and installers can be downloaded as a separate ZIP-file from the user's account. The archive contains three files:

* *Telerik.Reporting.DataDirectDriversInstaller.dll*  - the resource library file, that contains the __x86__  and               __x64__  versions of the drivers.             

* *Telerik.Reporting.DataDirectDriversInstaller.CLI.exe*  - a command-line interface for installing the drivers via batch file or script.             

* *Telerik.Reporting.DataDirectDriversInstaller.UI.exe*  - a Windows Forms application that provides a convenient UI and an option to log the installation output.             

## Telerik Reporting DataDirect ODBC Drivers List

The following tables describe the available drivers that are distributed by the installer. Some of the drivers have only __x86__  (32-bit) versions           The drivers platform should be considered based on the target application platform.         


>caption Telerik Reporting DataDirect ODBC drivers - (x64) 64-bit

| Driver | Short name |
| ------ | ------ |
|Apache Hive|HIVE|
|DB2 Wire Protocol|DB2|
|Greenplum Wire Protocol|GPLM|
|Impala Wire Protocol|IMPALA|
|Informix Wire Protocol|IFCL|
|MySQL Wire Protocol|MYSQL|
|Oracle|OR8|
|Oracle Wire Protocol|ORA|
|PostgreSQL Wire Protocol|PSQL|
|Progress OpenEdge Wire Protocol|OE|
|Salesforce|SFRC|
|SQL Server Wire Protocol|SQLS|
|SQL Server Legacy Wire Protocol|MSSS|
|Sybase Wire Protocol|ASE|
|Sybase IQ Wire Protocol|SYIQ|
|Teradata|TERA|




The list with the 32-bit DataDirect ODBC drivers includes all the databases that have 64-bit drivers and adds the following ones, listed below:         


>caption Telerik Reporting DataDirect ODBC drivers - (x86) 32-bit drivers (extends the list with 64-bit drivers)

| Driver | Short name |
| ------ | ------ |
|Btrieve|BTR|
|dBase DBF files|DBF|
|Informix|INF|
|Text Files|TXT|




## Command-Line Interface Installer

The CLI tool is useful when the drivers installation or uninstallation is executed from a script or batch file. Since the tool needs access to the Windows Registry,           the CLI executable must be started from a user account that has the necessary permissions. The following table lists the available arguments to be passed to the CLI tool.           The arguments are case-insensitive and they can follow any order.         


>caption CLI arguments

| Argument | Mandatory | Description |
| ------ | ------ | ------ |
| */mode* |Yes|Determines the mode of the installation. Available values: __install__ or __uninstall__ .|
| */targetPath* |Only in __install__ mode|Sets the path to the directory in which the drivers will be installed. When the directory name contains spaces, the argument value must be quoted.                 When in __uninstall__ mode, this key will not be respected and can be omitted, because the target path will be extracted from the registry entries.|
| */platform* |Yes|Defines the drivers platform. The installer comes with 32-bit (x86) and 64-bit (x64) versions of DataDirect ODBC drivers and this key determines which set will be installed. Available values: __x64__ or __x86__ .|
| */drivers* |Yes|Determines which drivers will be installed or uninstalled. The argument value is a quoted comma-separated string, containing the shortened names of the drivers.                 The available values are listed in the[drivers section](0312e83c-2e17-4261-803b-befcefe88c5b#telerik-reporting-datadirect-odbc-drivers-list).|
| */successToken* |No|A token that will be output to console after successful installation/uninstallation. It is useful in scenarios where the console output is monitored to determine if the process completed successfully.|




__Example usage:__ 

`             /mode install /targetpath "C:\Program Files\Progress\Telerik Reporting ODBC Drivers" /platform x86 /drivers "SQLS,ORA" /successToken "OK"           ` - installs the 32-bit  SQL Server and Oracle drivers to the target path and outputs "OK" if installation succeeds.         

`             /mode uninstall /platform x86 /drivers "SQLS,ORA" /successToken "OK"           ` - uninstalls the 32-bit  SQL Server and Oracle drivers and outputs "OK" if uninstallation succeeds.         

## Graphical User Interface Installer  

  ![datadirect-drivers-installer-gui](images/DataSources/datadirect-drivers-installer-gui.png)

The drivers can be installed or uninstalled using a Windows Forms application, which makes the installation process more intuitive and convenient.           It provides the same options as the CLI installer and adds the ability to output the installation log to an external file.           It also automatically detects the current application's platform and selects the corresponding __x86__  or __x64__  option.         

## Additional Information

The installer does not create or modify any data source names (DSN) in ODBC Manager application. In order to use the installed driver to fetch data from a database and           show it in a report, a DSN must be created in the ODBC Manager. The report should contain a SQL DataSource, which connects to this DSN and provide the necessary permissions.         

The tool supports partial uninstallation - i.e. only a particular driver can be removed from registry and installation folder.            However, if all the drivers are selected for uninstallation, the tool will perform a complete uninstall and remove the whole directory, if there are no other            subdirectories in it.         

# See Also


# See Also

 * [Progress DataDirect ODBC Drivers documentation](http://media.datadirect.com/download/docs/odbc/allodbc/)

 * [DataDirect ODBC Drivers Keys and Values](http://media.datadirect.com/download/docs/odbc/distgde/help.html#page/distguide%2Fkeys-and-values.html%23)
