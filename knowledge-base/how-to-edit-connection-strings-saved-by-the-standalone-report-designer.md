---
title: How to edit connection strings saved by the Standalone Report Designer?
description: How to modify connection strings saved by the Standalone Report Designer?.
type: how-to
page_title: How to make changes to connection strings saved by the Standalone Report Designer?
slug: how-to-edit-connection-strings-saved-by-the-standalone-report-designer
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Designer</td>
		<td>Standalone Report Designer</td>
	</tr>
</table>

## Description

This article lists the required steps to edit connection strings saved by the Standalone Report Designer. 

The predefined connection strings are saved in the Standalone Report Designer configuration file (*Telerik.ReportDesigner.exe.config*) and can be edited directly from there. Any other connection strings used in the designer are stored locally on the user's computer in an XML file.

The configuration file storing the user's application settings can be found at:  
   
%localAppData%\Progress_Software_Corpora\Telerik.ReportDesigner.*\\\<version>\user.config.
  

For example, Telerik Reporting **R1 2021** user's application configuration file would be placed in:   

*C:\Users\MyUserName\AppData\Local\Progress_Software_Corpora\Telerik.ReportDesigner.ex_StrongName_xvg2ahozm2u22wxtsw2egsvlddrzt5hj\15.0.21.120\user.config.*
  
> From **Q2 2018** until **R1 2019** , the Progress_Software_Corpora folder is named **Telerik_EAD**, and prior to Q2 2018 the folder is named **Telerik_AD**. 

## Solution
  
The *config* file has the following structure:  

 ```xml
 <?xml version="1.0" encoding="utf-8"?>
<configuration>
    <configSections>
        <sectionGroup name="userSettings" type="System.Configuration.UserSettingsGroup, System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" >
            <section name="Telerik.ReportDesigner.Settings"
                     type="System.Configuration.ClientSettingsSection, System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
                     allowExeDefinition="MachineToLocalUser"
                     requirePermission="false" />
        </sectionGroup>
    </configSections>
    <userSettings>
        <Telerik.ReportDesigner.Settings>
            <setting name="ConnectionStrings" serializeAs="Xml">
                <value>
                    <UserConnectionStringCollection>                                  
                    </UserConnectionStringCollection>
                </value>
            </setting>
            <setting name="Session" serializeAs="Xml">
                <value>
                    <UserSession>
                        <ActiveDocument Path="C:\MyReport.trdx" />
                        <Documents>                          
                        </Documents>
                    </UserSession>
                </value>
            </setting>
            <setting name="RecentDocuments" serializeAs="Xml">
                <value>
                    <RecentDocumentList MaxSize="10">                     
                    </RecentDocumentList>
                </value>
            </setting>
            <setting name="UpgradeRequired" serializeAs="String">
                <value>False</value>
            </setting>
        </Telerik.ReportDesigner.Settings>
    </userSettings>
</configuration>
 ``` 

You can add/remove/modify connection strings listed as existing data connections.

