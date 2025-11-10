---
title: Date and Time Functions
page_title: Date and Time Functions Explained
description: "Find out what are the built-in Date and Time Functions in Telerik Reporting and how to use them in expressions in reports."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/date-and-time-functions
tags: date,and,time,functions,expressions,report
published: True
position: 4
previous_url: /expressions-date-time-functions
reportingArea: General
---

# Date and Time Functions Overview

This document lists the built-in date and time functions that are available in Telerik Reporting.

Use these functions to calculate date and time values. Their default format is determined by your local computer locale settings. To change the format, you can use the [Format Builder]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/format-builder-dialog%}) in the Report Designer of your choice.

All DateTime functions return a [DateTime](https://learn.microsoft.com/en-us/dotnet/api/system.datetime) instance. For example, the Expression `= Date(2024, 7, 29)` returns `7/29/2024 12:00:00 AM`. When you need to display only the Date part, you may use one of the following approaches:

* Set the `Format` property of the corresponding report item (e.g. `{0:d}`), for example, through the _Format Builder_ as suggested above;
* Wrap the DateTime function in the [Text Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions%}) `Format` or `FormatWithCulture`. In the context of the above example, the Expression should be changed to `= Format('{0:d}', Date(2024, 7, 29))`, and the result would be `7/29/2024`.

The following table lists the available date and time functions with sample output taken on `7/29/2024` at `2:22:22 PM`.

| Function | Description | Example | Sample Output |
| ------ | ------ | ------ | ------ |
| `Now()` |Returns the current date and time on the computer processing the report, expressed as the local time.| [=Now()]|7/29/2024 2:22:22 PM|
| `Quarter(date)` |Returns the quarter of the month component of a specified date.| [=Quarter (Now())]|3|
| `Today()` |Returns the current date on this computer, expressed as the local time.| [=Today()]|7/29/2024 12:00:00 AM|
| `Date(year, month, day)` |Returns the date specified by the given year, month and day.| [=Date(2023, 5, 19)]|5/19/2023 12:00:00 AM|
| `IsLeapYear(year)` |Returns an indication of whether the specified year is a leap year.| [=IsLeapYear(2020)]|True|
| `DaysInMonth(year, month)` |Returns the number of days in the specified month and year.| [=DaysInMonth(2020, 9)]|30|
| `AddYears(date, years)` |Returns a new DateTime that adds the specified number of years to the value of the specified date.| [=AddYears(Now(), 3)]|7/29/2027 2:22:22 PM|
| `AddMonths(date, months)` |Returns a new DateTime that adds the specified number of months to the value of the specified date.| [=AddMonths(Now(), 3)]|10/29/2024 2:22:22 PM|
| `AddDays(date, days)` |Returns a new DateTime that adds the specified number of days to the value of the specified date.| [=AddDays(Now(), 3)]|8/1/2024 2:22:22 PM|
| `AddHours(date, hours)` |Returns a new DateTime that adds the specified number of hours to the value of the specified date.| [=AddHours(Now(), 3)]|7/29/2024 5:22:22 PM|
| `AddMinutes(date, minutes)` |Returns a new DateTime that adds the specified number of minutes to the value of the specified date.| [=AddMinutes(Now(), 3)]|7/29/2024 2:25:22 PM|
| `AddSeconds(date, seconds)` |Returns a new DateTime that adds the specified number of seconds to the value of the specified date.| [=AddSeconds(Now(), 33)]|7/29/2024 2:22:55 PM|
| `AddMilliseconds(date, milliseconds)` |Returns a new DateTime that adds the specified number of milliseconds to the value of the specified date.| [=AddMilliseconds(Now(), 3333)]|7/29/2024 2:22:25 PM|
