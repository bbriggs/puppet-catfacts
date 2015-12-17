# CAT FACTS!

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with catfacts](#setup)
    * [What catfacts affects](#what-catfacts-affects)
    * [Beginning with catfacts](#beginning-with-catfacts)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Send cat facts to your friends!

## Module Description

Have you ever wanted to send cat facts to your friends? Of course, because you love them so much. Who doesn't?
Share your enthusiasm for Linux, Puppet, and cats all at once by sending your friend cat facts with this module. 


## Setup

### What catfacts affects

Catfacts installs `fortune` and expects sendmail to be present, but doesn't manage it. 
Catfacts installs a cron job in the specified user's crontab. 
Catfacts installs two small files full of cat fact-y goodness to `/etc/catfacts`. 


### Beginning with catfacts

`include catfacts` to have it install fortune and the two small files needed to pull cat facts. 
Declare a resource using the `catfacts::schedule` resource to start sending your friends cat facts throughout the day!

## Usage

Example:
```puppet
    include catfacts

    catfacts::schedule{'catfacts_for_dad':
        target  => '5558675309@txt.att.net',
        sender  => 'facts@catfacts.com',
        user    => 'not_root',
        minute  => '*/5',
        hour    => '*'
    }
```
### Parameters

The main class has no parameters. The module is designed to be used via the type catfacts::schedule.  
 [*target*]
    String. Required. Email address of person with whom you just cannot wait to share the joy of CAT FACTS!

 [*sender*]
    String. Required. Email address you want displayed as the sender, so everyone knows exactly who sent them the cat facts, right?

 [*user*]
    String. Defaults to "root". Do you really want this running as root? Probably not. I don't know what users are running on your box, though, so I had to default to something

 [*minute*] and [*hour*]
    String. Defaults to "0" and "*" respectively. These are inputs to the cron job. I did not provide other cron options because people should receive cat facts at least daily. 

## Reference

See above

## Limitations

This module has been ever so slightly tested on Ubuntu 14.04 and CentOS/RHEL 6.x

## Development

Pull requests to the development branch are welcome. Find this code on Github:
https://github.com/bbriggs/puppet-catfacts