---
title: Algorithms
kind: documentation
disable_toc: true
---

## Anomalies

| Function      | Description                                                                                | Example                                                    |
| :----         | :-------                                                                                   | :---------                                                 |
| `anomalies()` | Overlay a gray band on the metric showing the expected behavior of a series based on past. | `anomalies(avg:<METRIC_NAME>{*}, '<ALGORITHM>', <BOUNDS>)` |

The `anomalies()` function has 2 parameters:

* `ALGORITHM` : Methodology used to detect anomalies.
* `BOUNDS`    : Width of the gray band. `bounds` can be interpreted as the standard deviations for your algorithm; a value of 2 or 3 should be large enough to include most "normal" points.

See our [Anomaly Monitor][1] page for more info.

## Outliers

| Function     | Description                | Example                                                                    |
| :----        | :-------                   | :---------                                                                 |
| `outliers()` | Highlight outliers series. | `outliers(avg:<METRIC_NAME>{*}, '<ALGORITHM>', <TOLERANCE>, <PERCENTAGE>)` |

The `outliers()` function has 3 parameters:

* `ALGORITHM`  : The outliers algorithm to use.
* `TOLERANCE`  : The tolerance of the outliers algorithm.
* `PERCENTAGE` : The percentage of outlying points required to mark a series as an outlier (available only for MAD and scaledMAD algorithms)

{{< img src="graphing/functions/algorithms/outlier.gif" alt="outlier detection" responsive="true" style="width:70%;">}}

See our [Outlier Monitor][2] page for more info.

Two-minute video walkthrough of Anomalies:

{{< vimeo 188833506 >}}
[1]: /monitors/monitor_types/anomaly
[2]: /monitors/monitor_types/outlier
