---
title: Distributions
kind: documentation
further_reading:
- link: "graphing/metrics/distributions"
  tag: "Documentation"
  text: Learn more about the dedicated UI for distribution metrics 
- link: "developers/libraries"
  tag: "Documentation"
  text: Official and Community-contributed API and DogStatsD client libraries
---

<div class="alert alert-warning">
This is documentation for a beta feature. Please <a href="https://docs.datadoghq.com/help/">contact support</a> to enable distribution metrics for your account.
</div>

## Overview
Distributions are a [metric type][1] that can be thought of as a global version of the [Histogram metric][2]. 

Histogram metric measures the statistical distribution of discrete values on a single host. 

Distributions observe values that are sent from multiple hosts to measure statistical distributions across your entire infrastructure.

This allows you to compute global percentiles across your entire dataset.

Global distributions are designed to instrument logical objects (services) independently from the underlying hosts and **provide insight into metric behavior across your infrastructure**.

Read on to learn how to manipulate and visualize Distributions in the interface.

Distributions measure the statistical distribution of a set of values across one or more hosts. In this way, Distributions are like a "global" version of [Histograms][2].

Because averages of percentile aggregations are not statistically valid, Distribution metrics work on the raw data across hosts. For each combination of tags, Datadog maintains a timeseries for `min`, `max`, `sum`, `average`, `count`, `p50`, `p75`, `p90`, `p95`, and `p99`.

For example, a given host `Foo` reports a metric with the values `[1,1,1,2,2,2,3,3]`, and another host `Bar` reports the same metric with the values `[1,1,2]` during a flush interval. Here, the `p50` (median) for `Foo` is 2 and the `p50` for `Bar` is 1. Aggregating by the average value in this case would result in 1.5. In reality, the global `p50` (median) is the median of the *combined* set `[1,1,1,1,1,2,2,2,2,3,3]`: *2*. This is what Distribution would report.

Under this model, the total number of timeseries created is based on the set of `tag:values` for tags applied to a metric. Since these aggregations are global in nature, by default, Datadog only applies custom metric-level tags to these metrics. This behavior can be modified if you need host-level tags as well.

## Submission

### DogStatsD

{{% table responsive="true" %}}
| Method | Overview |
| :----- | :------- |
| dog.distribution(...) | Track the statistical distribution of a set of values over one or more hosts.<ul><li>Required: metric name and value.</li><li>Optional: tag(s)</li></ul> |
{{% /table %}}

#### Example

See the [DogStatsD-specific documentation][1] for code examples.

## Aggregations 

The new tagging workflow for Distributions allows you to define which aggregations are available in queries.

Initially, Datadog maintains a single timeseries, for `*` (all points), and otherwise ignore all tags. 

Manually aggregate your metric based on sets of tags, chosen from the list of tags normally available. 

For convenience, Datadog also creates aggregations for every combination of the first 4 custom tags applied to each metric.

With the distribution UI, create additional aggregate timeseries by applying sets of tags to a metric for which a timeseries is created for every combination of tag values within the set. 

**Sets of tags are limited to groups of four.**

{{< img src="graphing/metrics/distributions/distribution_metric.png" alt="Distribution metric" responsive="true" >}}

When creating your own graph, Distribution metrics automatically have additional space aggregations available:

{{< img src="graphing/metrics/distributions/dogweb_latency_bis.png" alt="Distribution metric bis" responsive="true" >}}

## Case study

`my.service.latency` is a metric that is being submitted on 500 hosts.  

Each host is tagged with 1 of 3 `Availability Zones` (as tagged by the AWS integration) and 20 `Roles` by Chef, our provisioning system.  

This metric has been tagged with 

* `Status`, which has 2 values: `Status:Success` or `Status:Fail`

* `Result`, which has 2 values: `Result:Open` or `Result:Close`.

##### Scenario 1

By default, Datadog creates aggregations for `my.service.latency` for [each combination of custom metric][4] tags `Status` and `Result`.  

You could then query, for example `{my.service.latency for Status:success, Result:closed}`, but not `{my.service.latency for Availability-Zone: US-East-1a}`

This creates (2+1) * (2+1) * 10 = 90 timeseries.

##### Scenario 2

You aggregate on `{Status, Result, Host}` instead of the defaults.

Available queries include, eg,:

* `{my.service.latency for Status:success, Result:closed, Host: i-deadbeef}`
* `{my.service.latency for Status:fail, host: i-deadbeef}`

The following is unavailable: 

* `{my.service.latency for Availability-Zone: US-East-1a}`

This creates (2+1) * (2+1) * (500+1) * 10 = 45,090 timeseries. 

##### Scenario 3

You aggregate by `{Availability-Zone, Status}`, in addition to `{Status, Result, Host}`.

Available queries include:

* `{my.service.latency for AZ: US-East-1a}`
* `{my.service.latency for AZ: US-West-2b, Status: Success}`
*  any in the previous scenario.

The aggregate timeseries for `Availability-Zone` and `Host` has not been requested, so `{my.service.latency for AZ:US-East-1a, Host:i-deadbeef}` is unavailable.

This creates (3 + 1) * (2 + 1) * 10 = 120, in addition to the 45,090, above, for a total of 45,210 timeseries.  

As you can see, aggregating by multiple sets of tags increases the number of timeseries additively, limiting timeseries growth.

The following gif demonstrates inspecting the aggregations created for a metric, `intake.batch_api_keys_for_org`. You would query `{availability-zone, role}` or `{instance-type, role}`, but not `{availability-zone, instance-type}`.

{{< img src="graphing/metrics/distributions/Distros_Tagging.gif" alt="Distros_Tagging" responsive="true" >}}

## Further reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: /developers/dogstatsd/data_types#distributions
[2]: /developers/metrics/histograms
