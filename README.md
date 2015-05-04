# lita-lookup-host

[![Build Status](https://travis-ci.org/justintime/lita-lookup-host.png?branch=master)](https://travis-ci.org/justintime/lita-lookup-host)
[![Coverage Status](https://coveralls.io/repos/justintime/lita-lookup-host/badge.png)](https://coveralls.io/r/justintime/lita-lookup-host)

A handler for lita that gives folks in chat an easy way to perform both forward and reverse lookups for hosts via DNS.

This module was inspired by the [lita-dig](https://github.com/esigler/lita-dig) handler, but aims to serve an audience
that might not want to learn ```dig```.

## Installation

Add lita-lookup-host to your Lita instance's Gemfile:

``` ruby
gem "lita-lookup-host"
```

## Configuration

None.

## Usage

### Perform a forward lookup:
```[You] lita: lookup host www.google.com
[Lita] 216.58.216.68
```

### Perform a reverse lookup:
```[You] lita: lookup host 127.0.0.1
[Lita] localhost
```

This handler uses Ruby's [resolv](http://ruby-doc.org/stdlib-1.9.3/libdoc/resolv/rdoc/Resolv/DNS.html) class included in
stdlib to perform lookups.  It uses whatever resolvers have been configured on the system running Lita to answer
queries.


