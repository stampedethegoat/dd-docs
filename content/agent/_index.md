---
title: The Agent 101
kind: documentation
description: Install & configure the Agent to collect data
further_reading:
- link: "logs/"
  tag: "Documentation"
  text: Collect your logs
- link: "graphing/infrastructure/process"
  tag: "Documentation"
  text: Collect your processes
- link: "tracing"
  tag: "Documentation"
  text: Collect your traces
aliases:
  - /agent/faq/agent-check-directory-structure
  - /agent/faq/install-core-extra/
---

<!--<div class="alert alert-info">-->
<!--Agent v6 is now available, <a href="https://github.com/DataDog/datadog-agent/blob/master/docs/agent/upgrade.md">upgrade to the newest version</a> to benefit from all new functionality.-->
<!--</div>-->

## What is the Agent?

The Datadog Agent is software that runs on your hosts. 

Its job is to collect events and metrics so that you can visualize and monitor your data. 

The Datadog Agent is open source. [Changelog Docs][3]

## Agent v5
[Agent v5 github][1] 

Agent v5 has 3 main parts: the collector, DogStatsD, and the forwarder:

* **Collector**: Runs checks on the machine for [integrations][4] and captures system metrics such as memory and CPU.
* **DogStatsD**: A backend server that you can send [custom metrics][5] to from your own applications.
* **Forwarder**: Retrieves data from both DogStatsD and Collector, then queues it up to be sent to Datadog.

This is all controlled by one supervisor process. We keep this separate so you don't have to deal with the overhead of each application.

## Agent v6
[Agent v6 github][2]

Agent 6 is the latest version of the Datadog Agent. The agent is completely rewritten in Golang.

In place of the 3 processes of Agent v5 (*Forwarder*, *Collector*, and *DogStatsD*) there is now only one process: *the Agent*. 

It also comes with a number of other core improvements:

* Decreased CPU and Memory usage
* Has fewer file descriptors
* Has an all around decreased footprint
* [Distributions metrics][17] can be performed on the server to calculate global percentiles. (in BETA)
* [DogStatsD][6] can be used over a Unix socket instead of over UDP.
* Custom build your Agent v6 and [DogStatsD][6] much easier with more config options (include/exclude)
* There is a "puppy" Agent, which is a truly minimal installation.
* Agent 6 uses ports `5000` & `5001`. Specify different ports for `expvar_port` and `cmd_port` in `datadog.yaml`.

## Import Agent 5 Configuration files to Agent 6

To transition Agent configuration paths and formats from v5 to v6, use the `import` command:

`sudo -u dd-agent -- datadog-agent import`

The command parses an existing v5 `datadog.conf` and converts config options to the new v6 `datadog.yaml` format. 

It also copies configuration files for checks that are currently enabled.

For Mac and Windows environments, use:

`datadog-agent import <old_configuration_dir> <destination_dir>`

* `<old_configuration_dir>` directory containing `datadog.conf`
* `<destination_dir>` directory where the imported `datadog.yaml` is written

**Note**: On Windows, `datadog.conf` is automatically upgraded to `datadog.yaml` on upgrade.

## Resource overhead (Agent v5 vs Agent v6)

* CPU               : \~ 0.12% vs \~ 0.35%
* Memory            : \~ 55Mo vs \~ 115Mo of RAM used
* Network bandwidth : \~ 86 B/s &#9660; | 260 B/s &#9650; vs \~ 1900 B/s &#9660; | 800 B/s &#9650;
* Disk              : 0MB vs Linux 120MB | Windows 60MB

Caveats:

* Enabling integrations may increase the Agent's resource consumption.
* Enabling JVM checks forces the Agent to use more memory, depending on the number of beans exposed by the monitored JVMs.
* Enabling the trace/process/logging Agents may increase resource consumption.

## CLI
To run a sub-command, the Agent binary must be invoked like this:
```
<path_to_agent_bin> <sub_command> <options>
```

Some options have their own set of flags and options detailed in a help message. 

For example, to see how to use the `check` sub-command, run:
```
<agent_binary> check --help
```

The new command line interface for the Agent is sub-command based:

| Command         | Notes                                                                      |
| --------------- | -------------------------------------------------------------------------- |
| check           | Run the specified check                                                    |
| configcheck     | Print all configurations loaded & resolved of a running Agent              |
| diagnose        | Execute some connectivity diagnosis on your system                         |
| flare           | Collect a flare and send it to Datadog                                     |
| health          | Print the current Agent health                                             |
| help            | Help about any command                                                     |
| hostname        | Print the hostname used by the Agent                                       |
| import          | Import and convert configuration files from previous versions of the Agent |
| installservice  | Installs the Agent within the service control manager                      |
| launch-gui      | Starts the Datadog Agent GUI                                               |
| regimport       | Import the registry settings into datadog.yaml                             |
| remove-service  | Removes the Agent from the service control manager                         |
| restart-service | Restarts the Agent within the service control manager                      |
| start           | Start the Agent                                                            |
| start-service   | Starts the Agent within the service control manager                        |
| status          | Print the current status                                                   |
| stopservice     | Stops the Agent within the service control manager                         |
| version         | Print the version info                                                     |


## Using the GUI

The port which the GUI runs on can be configured in your `datadog.yaml` file. 

Setting the port to `-1` disables the GUI all together. 

By default it is enabled on port `5002` on Windows and Mac, and is disabled on Linux.

Once the Agent is running, run `datadog-agent launch-gui` to launch the GUI on the browser.

**Note**: The agent GUI isn't supported on 32-bit Windows platforms.

### Requirements

1. **Cookies must be enabled.**
The GUI generates and saves a token in your browser which is used for authenticating all communications with the server.

2. Make sure the GUI has the **correct permissions**. If you are able to open `datadog.yaml`, you are able to use the GUI.

3. The GUI can **only** be accessed from the local network interface (```localhost```/```127.0.0.1```), so you must be on the same host that the Agent is running to use it. You can't run the Agent on a VM or a container and access it from the host machine.

## Supported OSs versions

### Agent v6

| OS                                 | Supported versions                                       |
| :----                              | :----                                                    |
| [Debian x86_64][7]                 | Debian 7 (wheezy) and above (we do not support SysVinit) |
| [Ubuntu x86_64][8]                 | Ubuntu 14.04 and above                                   |
| [RedHat/CentOS x86_64][9]          | RedHat/CentOS 6 and above                                |
| [Docker][14]                       | Version 1.12 and higher                                  |
| [Kubernetes][15]                   | Version 1.3 and higher                                   |
| [SUSE Enterprise Linux x86_64][10] | SUSE 11 SP4 and above (we do not support SysVinit)       |
| [Fedora x86_64][11]                | Fedora 26 and above                                      |
| [MacOS][12]                        | macOS 10.10 and above                                    |
| [Windows server 64-bit][13]        | Windows server 2008r2 or above                           |
| [Windows 64-bit][13]               | Windows 7 or above                                       |

**Note**: [Source][16] install may work on operating systems not listed here and is supported on a best effort basis.

### Agent v5

| OS                                 | Supported versions             |
| :----                              | :----                          |
| [Debian x86_64][7]                 | Debian 7 (wheezy) and above    |
| [Ubuntu x86_64][8]                 | Ubuntu 12.04 and above         |
| [RedHat/CentOS x86_64][9]          | RedHat/CentOS 5 and above      |
| [Docker][14]                       | Version 1.12 and higher        |
| [Kubernetes][15]                   | Version 1.3 and higher         |
| [SUSE Enterprise Linux x86_64][10] | SUSE 11 SP4 and above          |
| [Fedora x86_64][11]                | Fedora 26 and above            |
| [MacOS][12]                        | macOS 10.10 and above          |
| [Windows server 64-bit][13]        | Windows server 2008r2 or above |
| [Windows 64-bit][13]               | Windows 7 or above             |

**Note**: [Source][16] install may work on operating systems not listed here and is supported on a best effort basis.

## Further Reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: https://github.com/DataDog/dd-agent
[2]: https://github.com/DataDog/datadog-agent
[3]: https://github.com/DataDog/datadog-agent/blob/master/docs/agent/changes.md
[4]: /integrations
[5]: /developers/metrics/custom_metrics/
[6]: /developers/dogstatsd
[7]: /agent/basic_agent_usage/deb
[8]: /agent/basic_agent_usage/ubuntu
[9]: /agent/basic_agent_usage/redhat
[10]: /agent/basic_agent_usage/suse
[11]: /agent/basic_agent_usage/fedora
[12]: /agent/basic_agent_usage/osx
[13]: /agent/basic_agent_usage/windows
[14]: /agent/basic_agent_usage/docker
[15]: /agent/basic_agent_usage/kubernetes
[16]: /agent/basic_agent_usage/source
[17]: /developers/metrics/distributions 
