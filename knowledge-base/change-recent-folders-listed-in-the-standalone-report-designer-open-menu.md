---
title: How to change the Recent Folders listed in the Standalone Report Designer Open Menu
description: It is possible to edit the Recent Folder list in the Standalone Report Designer. Follow the steps in this article to learn how.
type: how-to
page_title: Change the Recent Folder List in the Standalone Report Designer Open Menu
slug: change-recent-folders-listed-in-the-standalone-report-designer-open-menu
position: 
tags: standalone report designer, user config
ticketid: 1465473
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.0.20.219</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

When installing Telerik Reporting, the Standalone report designer also includes a user configuration for the user experience. This can used to manipulate Recent Folders, Recent Documents or Connection String. See the following solution for how to do this.

## Solution

Below is a sample of the user configuration and the file is located at `%LocalAppData%\Progress_Software_Corpora\Telerik.ReportDesigner.ex_StrongName_xvg2ahozm2u22wxtsw2egsvlddrzt5hj\[TELERIK_REPORTING_VERSION]\user.config` 

````xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <configSections>
        <sectionGroup name="userSettings" type="System.Configuration.UserSettingsGroup, System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089">
            <section name="Telerik.ReportDesigner.Settings" type="System.Configuration.ClientSettingsSection, System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" allowExeDefinition="MachineToLocalUser" requirePermission="false" />
        </sectionGroup>
    </configSections>
    <userSettings>
        <Telerik.ReportDesigner.Settings>
            <setting name="Session" serializeAs="Xml">
                <value>
                    <UserSession />
                </value>
            </setting>
            <setting name="ConnectionStrings" serializeAs="Xml">
                <value>
                    <UserConnectionStringCollection />
                </value>
            </setting>
            <setting name="RecentFolders" serializeAs="Xml">
                <value>
                    <RecentFoldersList MaxSize="10">
                        <Item Time="Mon, 11 May 2020 20:18:27 GMT" Path="C:\Program Files (x86)\Progress\Telerik Reporting R1 2020\Report Designer\Examples\" />
                        <Item Time="Mon, 11 May 2020 20:11:25 GMT" Path="C:\Program Files (x86)\Progress\Telerik Report Server\Telerik.ReportServer.Web\SampleReports\" />
                    </RecentFoldersList>
                </value>
            </setting>
            <setting name="RecentDocuments" serializeAs="Xml">
                <value>
                    <RecentDocumentList MaxSize="10">
                        <Item Time="Mon, 11 May 2020 20:18:27 GMT" Path="C:\Program Files (x86)\Progress\Telerik Reporting R1 2020\Report Designer\Examples\Dashboard.trdp" />
                        <Item Time="Mon, 11 May 2020 20:11:25 GMT" Path="C:\Program Files (x86)\Progress\Telerik Report Server\Telerik.ReportServer.Web\SampleReports\Employee Sales Summary.trdp" />
                        <Item Time="Mon, 11 May 2020 19:44:43 GMT" Path="C:\Program Files (x86)\Progress\Telerik Report Server\Telerik.ReportServer.Web\SampleReports\Dashboard.trdp" />
                        <Item Time="Thu, 07 May 2020 23:53:42 GMT" Path="C:\Users\[USER_NAME]\Downloads\Report1.trdp" />
                        <Item Time="Wed, 06 May 2020 21:37:54 GMT" Path="D:\dev\repos\support\reporting\tickets\1464699\src\TWA.SaveReportOnLoad\Reports\Products.trdp" />
                        <Item Time="Wed, 06 May 2020 14:40:36 GMT" Path="D:\dev\repos\support\reporting\tickets\1464699\src\TWA.SaveReportOnLoad\Reports\Dashboard.trdp" />
                        <Item Time="Tue, 05 May 2020 18:56:01 GMT" Path="D:\dev\repos\support\reporting\tickets\1464693\src\MSWA.AngularReportViewer\wwwroot\Reports\Dashboard.trdp" />
                        <Item Time="Tue, 05 May 2020 16:48:04 GMT" Path="D:\dev\repos\support\reporting\tickets\1464677\src\CandleStickGraph.trdp" />
                        <Item Time="Fri, 01 May 2020 13:02:32 GMT" Path="C:\Users\[USER_NAME]\Downloads\SupportSample\src\MainReport.trdp" />
                    </RecentDocumentList>
                </value>
            </setting>
            <setting name="KnownServers" serializeAs="Xml">
                <value>
                    <KnownServersList MaxSize="10" />
                </value>
            </setting>
            <setting name="PersistSession" serializeAs="String">
                <value>Never</value>
            </setting>
            <setting name="UpgradeRequired" serializeAs="String">
                <value>False</value>
            </setting>
            <setting name="PerspectiveDefault" serializeAs="String">
                <value>IVByb3BlcnR5QnJvd3NlclRvb2xXaW5kb3cuVmlzaWJsZQMAAAAAIFJlcG9ydEV4cGxvcmVyVG9vbFdpbmRvdy5WaXNpYmxlAwAAAAAeRGF0YUV4cGxvcmVyVG9vbFdpbmRvdy5WaXNpYmxlAwAAAAAfR3JvdXBFeHBsb3JlclRvb2xXaW5kb3cuVmlzaWJsZQMAAAAA</value>
            </setting>
            <setting name="TelerikReportingDesignQueryDesignerFormSqlQueryDesignerView" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBlTcWxRdWVyeURlc2lnbmVyVmlldy5MZWZ0CQAAAPcEAAAYU3FsUXVlcnlEZXNpZ25lclZpZXcuVG9wCQAAAF0CAAAaU3FsUXVlcnlEZXNpZ25lclZpZXcuV2lkdGgJAAAAGAcAABtTcWxRdWVyeURlc2lnbmVyVmlldy5IZWlnaHQJAAAABAUAAA==</value>
            </setting>
            <setting name="TelerikReportingDataDesignSqlWizardSqlDataSourceWizardForm" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBhTcWxEYXRhU291cmNlV2l6YXJkLkxlZnQJAAAACAUAABdTcWxEYXRhU291cmNlV2l6YXJkLlRvcAkAAAA1AgAAGVNxbERhdGFTb3VyY2VXaXphcmQuV2lkdGgJAAAA1AkAABpTcWxEYXRhU291cmNlV2l6YXJkLkhlaWdodAkAAADrBAAA</value>
            </setting>
            <setting name="TelerikReportingDesignReportWizardLabelReportWizardForm" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBZMYWJlbFJlcG9ydFdpemFyZC5MZWZ0CQAAAAgFAAAVTGFiZWxSZXBvcnRXaXphcmQuVG9wCQAAADUCAAAXTGFiZWxSZXBvcnRXaXphcmQuV2lkdGgJAAAA8AQAABhMYWJlbFJlcG9ydFdpemFyZC5IZWlnaHQJAAAAzwQAAA==</value>
            </setting>
            <setting name="PerspectiveReportDesign" serializeAs="String">
                <value>IVByb3BlcnR5QnJvd3NlclRvb2xXaW5kb3cuVmlzaWJsZQMAAAABIFJlcG9ydEV4cGxvcmVyVG9vbFdpbmRvdy5WaXNpYmxlAwAAAAEeRGF0YUV4cGxvcmVyVG9vbFdpbmRvdy5WaXNpYmxlAwAAAAEfR3JvdXBFeHBsb3JlclRvb2xXaW5kb3cuVmlzaWJsZQMAAAAB</value>
            </setting>
            <setting name="PerspectiveReportPreview" serializeAs="String">
                <value />
            </setting>
            <setting name="TelerikReportingDesignGraphWizardScatterGraphWizardForm" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBdTY2F0dGVyR3JhcGhXaXphcmQuTGVmdAkAAAC1BwAAFlNjYXR0ZXJHcmFwaFdpemFyZC5Ub3AJAAAAhgEAABhTY2F0dGVyR3JhcGhXaXphcmQuV2lkdGgJAAAA8AQAABlTY2F0dGVyR3JhcGhXaXphcmQuSGVpZ2h0CQAAAA4FAAA=</value>
            </setting>
            <setting name="TelerikReportingGroupingCollectionEditor" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBNDb2xsZWN0aW9uRm9ybS5MZWZ0CQAAAOQAAAASQ29sbGVjdGlvbkZvcm0uVG9wCQAAAOQAAAAUQ29sbGVjdGlvbkZvcm0uV2lkdGgJAAAA1wIAABVDb2xsZWN0aW9uRm9ybS5IZWlnaHQJAAAAvwEAABZFeHByZXNzaW9uQ29sdW1uLldpZHRoCQAAALACAAA=</value>
            </setting>
            <setting name="TelerikReportingDesignCommonExpressionBuilderExpressionBuilderDialog" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBxFeHByZXNzaW9uQnVpbGRlckRpYWxvZy5MZWZ0CQAAABIFAAAbRXhwcmVzc2lvbkJ1aWxkZXJEaWFsb2cuVG9wCQAAAGABAAAdRXhwcmVzc2lvbkJ1aWxkZXJEaWFsb2cuV2lkdGgJAAAAygMAAB5FeHByZXNzaW9uQnVpbGRlckRpYWxvZy5IZWlnaHQJAAAAywMAABRzZWxlY3Rpb25QYW5lbC5XaWR0aAkAAACkAwAAFXNlbGVjdGlvblBhbmVsLkhlaWdodAkAAACQAQAAFmNhdGVnb3J5VHJlZVZpZXcuV2lkdGgJAAAADwEAABdjYXRlZ29yeVRyZWVWaWV3LkhlaWdodAkAAACQAQAAGGRlc2NyaXB0aW9uVGV4dEJveC5XaWR0aAkAAAAqAQAAGWRlc2NyaXB0aW9uVGV4dEJveC5IZWlnaHQJAAAAkAEAAA==</value>
            </setting>
            <setting name="TelerikReportingDesignStyleBuilderUI" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBVTdHlsZUJ1aWxkZXJGb3JtLkxlZnQJAAAA+QUAABRTdHlsZUJ1aWxkZXJGb3JtLlRvcAkAAADJAgAAFlN0eWxlQnVpbGRlckZvcm0uV2lkdGgJAAAADQMAABdTdHlsZUJ1aWxkZXJGb3JtLkhlaWdodAkAAACiAgAAC0luaXRpYWxQYWdlEgAAAAtMYXlvdXRQYW5lbBZVc2VyRGVmaW5lZENvbG9yVmFsdWVzEgAAAAA=</value>
            </setting>
            <setting name="TelerikReportingDesignBindingCollectionForm" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBxCaW5kaW5nQ29sbGVjdGlvbkVkaXRvci5MZWZ0CQAAAAoBAAAbQmluZGluZ0NvbGxlY3Rpb25FZGl0b3IuVG9wCQAAAAoBAAAdQmluZGluZ0NvbGxlY3Rpb25FZGl0b3IuV2lkdGgJAAAA1wIAAB5CaW5kaW5nQ29sbGVjdGlvbkVkaXRvci5IZWlnaHQJAAAAvwEAABlQcm9wZXJ0eSBwYXRoQ29sdW1uLldpZHRoCQAAALQAAAAWRXhwcmVzc2lvbkNvbHVtbi5XaWR0aAkAAAD8AQAA</value>
            </setting>
            <setting name="TelerikReportingSqlDataSourceParameterCollectionEditor" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBNDb2xsZWN0aW9uRm9ybS5MZWZ0CQAAAFYBAAASQ29sbGVjdGlvbkZvcm0uVG9wCQAAAFYBAAAUQ29sbGVjdGlvbkZvcm0uV2lkdGgJAAAA1wIAABVDb2xsZWN0aW9uRm9ybS5IZWlnaHQJAAAAvwEAABBOYW1lQ29sdW1uLldpZHRoCQAAAGQAAAASRGJUeXBlQ29sdW1uLldpZHRoCQAAAGQAAAARVmFsdWVDb2x1bW4uV2lkdGgJAAAA6AEAAA==</value>
            </setting>
            <setting name="TelerikReportingDataDesignCsvWizardCsvDataSourceWizardForm" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBhDc3ZEYXRhU291cmNlV2l6YXJkLkxlZnQJAAAAWwEAABdDc3ZEYXRhU291cmNlV2l6YXJkLlRvcAkAAAA7AgAAGUNzdkRhdGFTb3VyY2VXaXphcmQuV2lkdGgJAAAA8AQAABpDc3ZEYXRhU291cmNlV2l6YXJkLkhlaWdodAkAAACwBAAA</value>
            </setting>
            <setting name="TelerikReportingDesignControlsEditReportSourceDialog" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQB9FZGl0UmVwb3J0U291cmNlRGlhbG9nQmFzZS5MZWZ0CQAAAKIBAAAeRWRpdFJlcG9ydFNvdXJjZURpYWxvZ0Jhc2UuVG9wCQAAAKIBAAAgRWRpdFJlcG9ydFNvdXJjZURpYWxvZ0Jhc2UuV2lkdGgJAAAArAMAACFFZGl0UmVwb3J0U291cmNlRGlhbG9nQmFzZS5IZWlnaHQJAAAAzwIAAA==</value>
            </setting>
            <setting name="PerspectiveReportBook" serializeAs="String">
                <value />
            </setting>
            <setting name="TelerikReportingCalculatedFieldCollectionEditor" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBNDb2xsZWN0aW9uRm9ybS5MZWZ0CQAAAF4CAAASQ29sbGVjdGlvbkZvcm0uVG9wCQAAADUCAAAUQ29sbGVjdGlvbkZvcm0uV2lkdGgJAAAApgUAABVDb2xsZWN0aW9uRm9ybS5IZWlnaHQJAAAAvwEAABBOYW1lQ29sdW1uLldpZHRoCQAAAO4AAAAURGF0YVR5cGVDb2x1bW4uV2lkdGgJAAAAZAAAABZFeHByZXNzaW9uQ29sdW1uLldpZHRoCQAAAC0EAAA=</value>
            </setting>
            <setting name="TelerikReportingParameterCollectionEditor" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBNDb2xsZWN0aW9uRm9ybS5MZWZ0CQAAABsCAAASQ29sbGVjdGlvbkZvcm0uVG9wCQAAACkDAAAUQ29sbGVjdGlvbkZvcm0uV2lkdGgJAAAAjgIAABVDb2xsZWN0aW9uRm9ybS5IZWlnaHQJAAAAcAEAABpQYXJhbWV0ZXIgTmFtZUNvbHVtbi5XaWR0aAkAAAAQAQAAG1BhcmFtZXRlciBWYWx1ZUNvbHVtbi5XaWR0aAkAAABXAQAA</value>
            </setting>
            <setting name="TelerikReportingDesignQueryDesignerFormEditorsConditionsView" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBNDb25kaXRpb25zVmlldy5MZWZ0CQAAAN8GAAASQ29uZGl0aW9uc1ZpZXcuVG9wCQAAAPoDAAAUQ29uZGl0aW9uc1ZpZXcuV2lkdGgJAAAASAMAABVDb25kaXRpb25zVmlldy5IZWlnaHQJAAAAygEAAA==</value>
            </setting>
            <setting name="TelerikReportingFilterCollectionEditor" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBNDb2xsZWN0aW9uRm9ybS5MZWZ0CQAAAOQAAAASQ29sbGVjdGlvbkZvcm0uVG9wCQAAAOQAAAAUQ29sbGVjdGlvbkZvcm0uV2lkdGgJAAAA9wMAABVDb2xsZWN0aW9uRm9ybS5IZWlnaHQJAAAACAMAAAxDb2x1bW4uV2lkdGgJAAAAMgAAABZFeHByZXNzaW9uQ29sdW1uLldpZHRoCQAAAH0BAAAUT3BlcmF0b3JDb2x1bW4uV2lkdGgJAAAAUAAAABFWYWx1ZUNvbHVtbi5XaWR0aAkAAADRAQAA</value>
            </setting>
            <setting name="TelerikReportingDesignConditionalFormattingEditor+ConditionalFormattingEditorForm" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQCRDb25kaXRpb25hbEZvcm1hdHRpbmdFZGl0b3JGb3JtLkxlZnQJAAAAbQEAACNDb25kaXRpb25hbEZvcm1hdHRpbmdFZGl0b3JGb3JtLlRvcAkAAACSAgAAJUNvbmRpdGlvbmFsRm9ybWF0dGluZ0VkaXRvckZvcm0uV2lkdGgJAAAAjgMAACZDb25kaXRpb25hbEZvcm1hdHRpbmdFZGl0b3JGb3JtLkhlaWdodAkAAADcAQAA</value>
            </setting>
            <setting name="TelerikReportingDesignGraphWizardOhlcGraphWizardForm" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBRPSExDR3JhcGhXaXphcmQuTGVmdAkAAABIAQAAE09ITENHcmFwaFdpemFyZC5Ub3AJAAAAOgIAABVPSExDR3JhcGhXaXphcmQuV2lkdGgJAAAAhAUAABZPSExDR3JhcGhXaXphcmQuSGVpZ2h0CQAAAE4FAAA=</value>
            </setting>
            <setting name="TelerikReportingDesignGraphWizardCategoryGraphWizardForm" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBhDYXRlZ29yeUdyYXBoV2l6YXJkLkxlZnQJAAAACAUAABdDYXRlZ29yeUdyYXBoV2l6YXJkLlRvcAkAAAA1AgAAGUNhdGVnb3J5R3JhcGhXaXphcmQuV2lkdGgJAAAA8AQAABpDYXRlZ29yeUdyYXBoV2l6YXJkLkhlaWdodAkAAADKAwAA</value>
            </setting>
            <setting name="TelerikReportingDesignTableWizardTableWizardForm" serializeAs="String">
                <value>A0RQSQ4AAAAAAAAAAABiQBBUYWJsZVdpemFyZC5MZWZ0CQAAAMgIAAAPVGFibGVXaXphcmQuVG9wCQAAADUCAAARVGFibGVXaXphcmQuV2lkdGgJAAAA8AQAABJUYWJsZVdpemFyZC5IZWlnaHQJAAAAygMAAA==</value>
            </setting>
            <setting name="DefaultWorkingDir" serializeAs="String">
                <value>C:\Program Files (x86)\Progress\Telerik Reporting R1 2020\Report Designer\Examples\</value>
            </setting>
            <setting name="AllowMultipleInstances" serializeAs="String">
                <value>True</value>
            </setting>
        </Telerik.ReportDesigner.Settings>
    </userSettings>
</configuration>
````

## Notes

* There may be a UI available in future releases.
* The folder name and location may change in future releases.
