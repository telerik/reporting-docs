---
title: Date and Time Functions
page_title: Date and Time Functions | for Telerik Reporting Documentation
description: Date and Time Functions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/date-and-time-functions
tags: date,and,time,functions
published: True
position: 4
---

# Date and Time Functions



This document lists the built-in date and time functions that are available in Telerik Reporting.       

Use these functions to calculate date and time values. Their default format is determined by your local computer locale settings. To change the format, you can       use the [Format Builder]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/format-builder-dialog%}) in the Report Designer of your choice.

## Other functions

The following table lists the available date and time functions with sample output.         


| Function | Description | Example | Sample Output |
| ------ | ------ | ------ | ------ |
| __Now()__ |Returns the current date and time on the computer processing the report, expressed as the local time.| [=Now()]|24-Sep-20 11:10|
| __Quarter(date)__ |Returns the quarter of the month component of a specified date.| [=Quarter (Now())]|3|
| __Today()__ |Returns the current date on this computer, expressed as the local time.| [=Today()]|24-Sep-20|
| __Date(year, month, day)__ |Returns the date specified by the given year, month and day.| [=Date (2020, 10, 1)]|01-Oct-20|
| __IsLeapYear(year)__ |Returns an indication whether the specified year is a leap year.| [=IsLeapYear(2020)]|True|
| __DaysInMonth(year, month)__ |Returns the number of days in the specified month and year.| [=DaysInMonth(2020, 9)]|30|
| __AddYears(date, years)__ |Returns a new DateTime that adds the specified number of years to the value of the specified date.| [=AddYears(Now(), 3)]|24-Sep-23|
| __AddMonths(date, months)__ |Returns a new DateTime that adds the specified number of months to the value of the specified date.| [=AddMonths(Now(), 3)]|24-Dec-20|
| __AddDays(date, days)__ |Returns a new DateTime that adds the specified number of days to the value of the specified date.| [=AddDays(Now(), 5)]|29-Sep-20|
| __AddHours(date, hours)__ |Returns a new DateTime that adds the specified number of hours to the value of the specified date.| [=AddHours(Now(), 1)]|24-Sep-20 12:52|
| __AddMinutes(date, minutes)__ |Returns a new DateTime that adds the specified number of minutes to the value of the specified date.| [=AddMinutes(Now(), 8)]|24-Sep-20 12:01|
| __AddSeconds(date, seconds)__ |Returns a new DateTime that adds the specified number of seconds to the value of the specified date.| [=AddSeconds(Now(), 50)]|24-Sep-20 11:55:48|
| __AddMilliseconds(date, milliseconds)__ |Returns a new DateTime that adds the specified number of milliseconds to the value of the specified date.| [=AddMilliseconds(Now(), 50)]|24-Sep-20 11:57:1|




# See Also

