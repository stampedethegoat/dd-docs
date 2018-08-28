---
title: Timeshift
kind: documentation
---

Here is a set of functions of the pattern `<TIMEPERIOD>_before()`. 

These functions display the values from the corresponding time period on the graph. 

On their own, they may not be of high value, but together with the current values they may provide useful insight into the performance of your application.

## Hour before

| Function        | Description                                                            | Example                         |
| :----           | :-------                                                               | :---------                      |
| `hour_before()` | Graph values from an hour before the current timestamp for the metric. | `hour_before(<METRIC_NAME>{*})` |

Here is an example of `system.load.1` with the `hour_before()` value shown as a dotted line. 

In this particular example, you can see the machine was started at 6:30am and the `hour_before()` values show up at the 7:30 mark. 

Of course, this example was created specifically so that you can see the `hour_before()` values match up with the actual values.

{{< img src="graphing/functions/timeshift/simple_hour_before_example.png" alt="simple hour before example" responsive="true" style="width:80%;">}}

## Day before

| Function       | Description                                                          | Example                        |
| :----          | :-------                                                             | :---------                     |
| `day_before()` | Graph values from a day before the current timestamp for the metric. | `day_before(<METRIC_NAME>{*})` |

Here is an example of `nginx.net.connections` with the `day_before()` value shown as a lighter, thinner line. 

In this example, you can see a week's worth of data, which makes the `day_before()` data easy to identify.

{{< img src="graphing/functions/timeshift/simple_day_before_example.png" alt="simple day before example" responsive="true" style="width:80%;">}}

## Week before

| Function        | Description                                                                    | Example                         |
| :----           | :-------                                                                       | :---------                      |
| `week_before()` | Graph values from a week (7 days) before the current timestamp for the metric. | `week_before(<METRIC_NAME>{*})` |

Here is an example of `cassandra.db.read_count` with the `week_before()` value shown as a dotted line. 

In this example, you can see about three weeks' worth of data, which makes the `week_before()` data easy to identify.

{{< img src="graphing/functions/timeshift/simple_week_before_example.png" alt="simple week before example" responsive="true" style="width:80%;">}}

## Month before

| Function         | Description                                                                                | Example                          |
| :----            | :-------                                                                                   | :---------                       |
| `month_before()` | Graph values from a month (28 days / 4 weeks) before the current timestamp for the metric. | `month_before(<METRIC_NAME>{*})` |

Here is an example of `aws.ec2.cpuutilization` with the `month_before()` value shown as a thin, solid line.

{{< img src="graphing/functions/timeshift/simple_month_before_example.png" alt="simple month before example" responsive="true" style="width:80%;">}}

