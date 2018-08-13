---
title: Getting started with tags
kind: documentation
aliases:
    - /getting_started/getting_started_with_tags
    - /guides/tagging/
    - /developers/tagging/
    - /getting_started/tagging
further_reading:
- link: "tagging/assigning_tags"
  tag: "Documentation"
  text: Learn how to assign tags
- link: "tagging/using_tags"
  tag: "Documentation"
  text: Learn how to use tags in Datadog
---

## Introduction

Tags are a way of adding dimensions to metrics, so they can be sliced, diced, aggregated, and compared on the front end. [Using tags][1] enables you to observe aggregate performance across a number of hosts and (optionally) narrow the set further based on specific elements. In a nutshell, tagging is a method to scope aggregated data.

## Why It Matters

Typically, it's helpful to look at containers, VMs and cloud infrastructure at the "service" level in aggregate. For example, it's more helpful to look at CPU across a collection of hosts that represents a service, rather than CPU for server A or server B separately.

Containers and cloud environments regularly churn through hosts, so it is critical to tag these to allow for aggregation of the metrics you're getting.

## Tags best practices

A few best practices on tags:

1. Tags must **start with a letter**, and after that may contain:

    * Alphanumerics
    * Underscores
    * Minuses
    * Colons
    * Periods
    * Slashes

    Other special characters get converted to underscores.
    **Note**: A tag cannot end with a colon (e.g., `tag:`)
2. Tags can be **up to 200 characters** long and support unicode.
3. Tags are converted to lowercase.
4. A tag can have a `value` or a `key:value` syntax:
    **For optimal functionality, we recommend constructing tags that use the `key:value` syntax.** The key is always what precedes the first colon of the global tag definition, e.g.:

    * `role:database:mysql` is parsed as **key**:`role` , **value**:`database:mysql`
    * `role_database:mysql` is parsed as **key**:`role_database` , **value**:`mysql`

    Examples of commonly used metric tag keys are `env`, `instance`, `name`, and `role`.

5. `device`, `host`, and `source` are **reserved tag keys** and cannot be specified in the standard way.

6. Tags shouldn't originate from unbounded sources, such as EPOCH timestamps or user IDs. These tags may impact platform performance and billing.

## Applying Tags

Tags may be added using any (or all) of the following methods:

* Agent Tags (`datadog.yaml`)
* [DogStatsD][2] Tags
* Integration/Check Tags (each check on the local host supports tags by editing the yaml)
* Tags generated by other services such as [AWS][3], [Azure][4], [GCE][5], etc.
* Tags in the [API][6] - note other endpoints support tags as well such as Events and Metrics
* [Chef Roles][7] and [Puppet][8] Tags (Chef and Puppet use the API - this may obviously be extended to other configuration management tools by you or Datadog)
* Manually adding tags using the [Infrastructure List][9] (hover over host->select "Inspect"->"Edit Tags")

## Examples

Here is an example of tags using the time-series chart editor. For the first screenshot, no tags have been applied, and we're observing average CPU across all hosts:

{{< img src="tagging/Tags_1.png" alt="Tags_1" responsive="true" style="width:75%;">}}

In this next example, we've applied a tag (region:eastus) that enables us to look at CPU across the US East Region. We've used region as an example, but you could use any arbitrary tag, including application, service, environment, etc.

{{< img src="tagging/Tags_2.png" alt="Tags_2" responsive="true" style="width:75%;">}}

In this last example, we've used the second empty field labeled as "everything" by option to show an individual timeseries line for each host. Now we're seeing server CPU for individual hosts running in the US East Region.

{{< img src="tagging/Tags_3.png" alt="Tags_3" responsive="true" style="width:75%;">}}

We can also add additional tags to narrow down our scope even further - for example, hosts in `region:eastus` and `env:production`. Tags are extremely powerful, and they are ubiquitous in Datadog. They can be applied to all core elements, including alerts and host maps.

### Further Reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: /tagging/using_tags
[2]: /developers/dogstatsd
[3]: /integrations/amazon_web_services
[4]: /integrations/azure
[5]: /integrations/google_app_engine
[6]: /api
[7]: /integrations/chef
[8]: /integrations/puppet
[9]: /graphing/infrastructure
[10]: /developers/metrics/custom_metrics