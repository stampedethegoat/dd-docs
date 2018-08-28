---
title: Smoothing
kind: documentation
---

## Exponentially weighted moving average

### Ewma 3

| Function   | Description                                                         | Example                    |
| :----      | :-------                                                            | :---------                 |
| `ewma_3()` | Compute the exponentially weighted moving average over a span of 3. | `ewma_3(<METRIC_NAME>{*})` |

Note: The span value is the number of data points. So `ewma_3()` uses the last 3 data points to calculate the average.

Example: 

If we have a metric `10 + x%10 {*}` that just increments itself by 1 starting from 10 until it drops back to 10 after 10 data points, then `ewma3(10 + x%10 {*})` has the following shape: 

{{< img src="graphing/functions/smoothing/ewma3.png" alt="EWMA3" responsive="true" style="width:80%;">}}

### Ewma 5

| Function   | Description                                                         | Example                    |
| :----      | :-------                                                            | :---------                 |
| `ewma_5()` | Compute the exponentially weighted moving average over a span of 5. | `ewma_5(<METRIC_NAME>{*})` |

Note: The span value is the number of data points. So `ewma_5()` uses the last 5 data points to calculate the average.

Example: 

If we have a metric `10 + x%10 {*}` that just increments itself by 1 starting from 10 until it drops back to 10 after 10 data points, then `ewma5(10 + x%10 {*})` has the following shape: 

{{< img src="graphing/functions/smoothing/ewma5.png" alt="EWMA5" responsive="true" style="width:80%;">}}

### Ewma 10

| Function    | Description                                                          | Example                     |
| :----       | :-------                                                             | :---------                  |
| `ewma_10()` | Compute the exponentially weighted moving average over a span of 10. | `ewma_10(<METRIC_NAME>{*})` |

Note: The span value is the number of data points. So `ewma_10()` uses the last 10 data points to calculate the average.

Example: 

If we have a metric `10 + x%10 {*}` that just increments itself by 1 starting from 10 until it drops back to 10 after 10 data points, then `ewma10(10 + x%10 {*})` has the following shape: 

{{< img src="graphing/functions/smoothing/ewma10.png" alt="EWMA10" responsive="true" style="width:80%;">}}

### Ewma 20

| Function    | Description                                                          | Example                     |
| :----       | :-------                                                             | :---------                  |
| `ewma_20()` | Compute the exponentially weighted moving average over a span of 20. | `ewma_20(<METRIC_NAME>{*})` |

Note: The span value is the number of data points. So `ewma_20()` uses the last 20 data points to calculate the average.

Example: 

If we have a metric `10 + x%10 {*}` that just increments itself by 1 starting from 10 until it drops back to 10 after 10 data points, then `ewma20(10 + x%10 {*})` has the following shape: 

{{< img src="graphing/functions/smoothing/ewma20.png" alt="EWMA20" responsive="true" style="width:80%;">}}

## Median 

### Median 3

| Function     | Description                      | Example                      |
| :----        | :-------                         | :---------                   |
| `median_3()` | Rolling median with a span of 3. | `median_3(<METRIC_NAME>{*})` |

Note: The span value is the number of data points. So `median_3()` uses the last 3 data points to calculate the median.

### Median 5

| Function     | Description                      | Example                      |
| :----        | :-------                         | :---------                   |
| `median_5()` | Rolling median with a span of 5. | `median_5(<METRIC_NAME>{*})` |

Note: The span value is the number of data points. So `median_5()` uses the last 5 data points to calculate the median.

### Median 7

| Function     | Description                      | Example                      |
| :----        | :-------                         | :---------                   |
| `median_7()` | Rolling median with a span of 7. | `median_7(<METRIC_NAME>{*})` |

Note: The span value is the number of data points. So `median_7()` uses the last 7 data points to calculate the median.

### Median 9

| Function     | Description                      | Example                      |
| :----        | :-------                         | :---------                   |
| `median_9()` | Rolling median with a span of 9. | `median_3(<METRIC_NAME>{*})` |

Note: The span value is the number of data points. So `median_9()` uses the last 9 data points to calculate the median.

