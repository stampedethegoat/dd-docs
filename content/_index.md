---
title: Datadog Docs
kind: documentation
aliases:
  - /basic_agent_usage/
  - /guides/
  - /faq/
disable_toc: true
---

# Docs Homepage

[//]: <> ({{< partial name="tile-nav/tile-nav.html" >}})

Your application stack is trying to tell a story.

Exceptions; DB queries; cache misses; upstream services flapping; error logs growing. 

Each of these tells a part of the story but it's hard to understand them when they are separate.

Datadog lets you collect metrics, events, and service states in one place. 

Visualize the data with graphs and set alerts on it all from the Datadog app.

## Collect Everything

[Install the Agent][1] on servers, instances, VMs, nodes, [container-running host][2]. 

Configure 200+ [integrations][3] to start the metrics flowing to Datadog's backend.

Use [DogStatsD][4] to instrument custom metrics like gauges, counters, timers, histograms 

Use [APM][5] to trace execution time of code paths and see how it impacts req-resp times. 

The [client libraries][6] send your [custom metrics][7] to the Agent which then ships them off to Datadog.

Datadog can [poll many services](/integrations) without having to install the Agent.

## Visualize It
Use the Metrics Explorer to search and observe a given metric. 

Use the Dashboard to get an overall picture of how a given service is running.

Use the [Event Stream][8] to view and comment on events, such as app deployment. 

Use the [Infrastructure Map][9] to filter for a group of hosts. 

Use the [Screenboard][10] to combine all graphs, events, service states to discover patterns.

Apply an [anomaly][11], [outlier][12], or [forecast][13] to skew metric values using other metrics.

## Monitor It
Use the [Monitors][14] to set up alerting conditions on your metrics.

You can get [Emails][15], [Slack][16] or [HipChat][17] notifications when the alerts fire.

You can [silence][18] the alerts if you are aware of an ongoing problem.

You can [schedule a downtime][19] if you're about to bring a service down for maintenance.

You can create a [composite monitor][20] when you want to define alerts for multiple hosts.

<!--{{< partial name="support/support.html" >}}-->

[1]: /agent
[2]: https://github.com/DataDog/datadog-agent/tree/master/Dockerfiles/agent
[3]: /integrations
[4]: /developers/dogstatsd
[5]: /tracing
[6]: /developers/libraries
[7]: /developers/metrics/custom_metrics/
[8]: /graphing/event_stream/
[9]: /graphing/infrastructure
[10]: /graphing/dashboards/screenboard
[11]: /monitors/monitor_types/anomaly
[12]: /monitors/monitor_types/outlier
[13]: /monitors/monitor_types/forecasts
[14]: /monitors
[15]: /monitors/notifications
[16]: /integrations/slack
[17]: /integrations/hipchat
[18]: /monitors/downtimes
[19]: /monitors/downtimes/
[20]: /monitors/monitor_types/composite/
