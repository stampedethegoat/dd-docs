---
title: Count
kind: documentation
---

## Count non zero

| Function          | Description                           | Example                           |
| :----             | :-------                              | :---------                        |
| `count_nonzero()` | Compute count of all non-zero values. | `count_nonzero(<METRIC_NAME>{*})` |


For a query grouped by one or more [tag keys][1], count the number of tag values with non-zero metric values at each point. 

Example: `count_nonzero(system.cpu.user{*} by {host})` returns a timeseries representing the number of hosts with non-zero system load at each point.

{{< img src="graphing/functions/count/count_nonzero.png" alt="count non zero" responsive="true" style="width:80%;">}}

## Count not null

| Function           | Description                           | Example                            |
| :----              | :-------                              | :---------                         |
| `count_not_null()` | Compute count of all not null values. | `count_not_null(<METRIC_NAME>{*})` |

For a query grouped by one or more [tag keys][1], count the number of tag values with non-null metric values at each point. A null metric value is when there is no finite value.

Example: `count_not_null(system.cpu.user{*} by {host})` returns a timeseries representing the number of hosts with non-null system load at each point.

{{< img src="graphing/functions/count/count_not_null.png" alt="count not null" responsive="true" style="width:80%;">}}

[1]: /tagging
