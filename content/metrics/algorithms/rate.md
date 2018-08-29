---
title: Rate
kind: documentation
---

| Function       | Description                                                | Example                        |
| :----          | :-------                                                   | :---------                     |
| `per_second()` | Graph the rate at which the metric is changing per second. | `per_second(<METRIC_NAME>{*})` |
| `per_minute()` | Graph the rate at which the metric is changing per minute. | `per_minute(<METRIC_NAME>{*})` |
| `per_hour()`   | Graph the rate at which the metric is changing per hour.   | `per_hour(<METRIC_NAME>{*})`   |
| `dt()`         | Graph the time difference between submitted points.        | `dt(<METRIC_NAME>{*})`         |
| `diff()`       | Graph the delta of the metric.                             | `diff(<METRIC_NAME>{*})`       |
| `derivative()` | Graph the derivative (dt/diff) of the metric.              | `derivative(<METRIC_NAME>{*})` |
