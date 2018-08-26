---
title: Datadog 101
kind: documentation
aliases:
  - /overview
  - /guides/overview/
---
## Events

<!--{{< img src="getting_started/event_stream.png" alt="Event stream" responsive="true" >}}-->

* [The Event Stream](/graphing/event_stream) can be [filtered][8] by `user`, `src`, `tag`, `host`, `status`, `priority`, `incident`
* Great for [teams](/account_management/team) and maintain the focus of an investigation.

For each incident, users can:  
* Claim it, +/- priority, comment, see similar incidents, [@ notify team members](/graphing/event_stream/#@-notifications), who receive emails  
* `@support-datadog` to ask for [help](/help)

{{< img src="getting_started/event_stream_event.png" alt="event stream event" responsive="true" style="width:70%;">}}

## Host Map

[The Host Map](/graphing/infrastructure/hostmap) offers the ability to:  
  * Visualize your entire environment   
  * Identify outliers  
  * Detect usage patterns  
  * Optimize resources  

{{< img src="getting_started/hostmap-overview.png" alt="hostmap overview" responsive="true" >}}

## Infrastructure List

* [Documentation](/graphing/infrastructure)  
* See all hosts and tags applied to each machine.
* [Tagging][15] allows you to indicate machines have a certain purpose.

{{< img src="getting_started/infrastructure.png" alt="infrastructure" responsive="true" >}}

## Dashboards
Dashboards contain [graphs][11] with real-time performance metrics

* Synchronous mousing across all graphs in a [screenboard](/graphing/dashboards/screenboard).
* Vertical bars are events in the context of the metric.
* Click & drag on a graph to zoom-in on a particular time-frame.
* As you hover over the graph the event stream moves with you.
* Display by zone, host, or total usage.
* The JSON editor of the graph is exposed to allow for [arithmetic][12] & [functions][13] to be applied.
* Share a snapshot that appears in the stream; clicking on
that snapshot returns you to the original dashboard
* Graphs can be embedded in an iframe, giving 3rd parties a live graph
w/o access to your data

{{< img src="getting_started/dashboard.png" alt="dashboard" responsive="true" >}}

## Monitors
[Monitors][14] gives you the ability to be notified if a specific
metric is above or below a certain threshold:

* Across your entire infrastructure
* Per machine (average, max, min, or sum)
* Applies to any metric you want
* Multi alerts (by device, host, etc.)
* Set alert notification message, including @ capabilities

{{< img src="getting_started/monitor.png" alt="monitor" responsive="true" >}}
{{< img src="getting_started/alert_setup.png" alt="alert setup" responsive="true" >}}

## Integrations
* 200+ [integrations][3]
* Custom integrations are available [via our API][4]
* The Agent is [open source][5]
* Data living in a datacenter or an online service is treated the same throughout Datadog.

{{< img src="getting_started/integrations.png" alt="integrations" responsive="true" >}}

[1]: /agent/
[2]: http://www.datadoghq.com/product/
[3]: http://www.datadoghq.com/integrations/
[4]: /api/
[5]: https://github.com/DataDog/dd-agent/
[8]: https://www.datadoghq.com/blog/filter-datadog-events-stream-pinpoint-events-infrastructure/
[10]: /graphing/infrastructure/hostmap/
[11]: /graphing/
[12]: /graphing/functions/
[13]: https://www.datadoghq.com/blog/rank-filter-performance-monitoring-metrics-top-function/
[14]: /monitors/
[15]: /tagging
