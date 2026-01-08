---
title: Clearing the Redis Storage of the Telerik Reporting REST Service
description: Learn how to clear the Telerik Reporting REST Service cache from Redis storage when redeploying or restarting your application.
type: how-to
page_title: Cleaning up the Redis Storage of the Telerik Reporting REST Service on Redeploy or Restart
slug: clear-redis-storage-telerik-reporting-rest-service
tags: progress® telerik® report server, redis, cache, rest service, redeploy, restart
res_type: kb
ticketid: 1609460
---

## Environment

| Product | Progress® Telerik® Report Server |
| ------- | -------------------------------- |
| Version | Current                          |

## Description

When redeploying or restarting an application that uses the Telerik Reporting REST Service, it might be necessary to clear the Reporting REST Service cache stored in Redis.

This task can be accomplished through the [Redis CLI](https://redis.io/docs/latest/develop/connect/cli/) by deleting all keys associated with the Reporting service. Keys can be identified by the Reporting version used or the [HostAppId](/api/telerik.reporting.services.reportserviceconfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_HostAppId) set in the report service configuration.

This KB article also answers the following questions:

- How do I remove the Reporting REST Service cache from Redis on application restart?
- What is the method to delete Telerik Reporting cache keys in Redis?
- How can I ensure a clean Reporting cache in Redis for a new deployment?

## Solution

To clear the Reporting REST Service cache from the Redis database, follow these steps:

1. Open the Redis CLI.
2. Use the `KEYS` command to find all keys related to Telerik Reporting. Replace `18.1.24.514` with the version of Telerik Reporting used in your application or a pattern that matches your application's HostAppId.

   ```shell
   redis-cli KEYS "*18.1.24.514*"
   ```

3. Delete the identified keys by passing them to the `DEL` command.

   ```shell
   redis-cli KEYS "*18.1.24.514*" | xargs redis-cli DEL
   ```

4. If the command from step 3 does not work for you, examine the output of the command from step 2 and make sure the keys are returned correctly. For example, if they contain spaces you may need to wrap them in quotes:

   ```shell
   redis-cli KEYS "*18.1.24.514*" | sed 's/\(.*\)/"\1"/' | xargs redis-cli DEL
   ```

By following these steps, you can ensure that the Telerik Reporting REST Service cache in Redis is cleared whenever your application is redeployed or restarted.

## See Also

- [How to atomically delete keys matching a pattern using Redis](https://stackoverflow.com/questions/4006324/how-to-atomically-delete-keys-matching-a-pattern-using-redis/4006575)
- [Report Service Configuration HostAppId Property](https://docs.telerik.com/reporting/api/telerik.reporting.services.reportserviceconfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_HostAppId)
- [Redis KEYS command documentation](https://redis.io/docs/latest/commands/keys/)
- [Redis DEL command documentation](https://redis.io/docs/latest/commands/del/)
