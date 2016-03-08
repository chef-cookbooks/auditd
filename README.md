# auditd Cookbook
[![Cookbook Version](https://img.shields.io/cookbook/v/auditd.svg)](https://supermarket.chef.io/cookbooks/auditd)

A simple cookbook to install auditd and provided rulesets. Rulesets
included in the OS auditd/audit package as examples are based on 4
established standards:

* [Controlled Access Protection Profile (CAPP)](http://www.commoncriteriaportal.org/files/ppfiles/capp.pdf)
* [Labeled Security Protection Profile (LSPP)](http://www.commoncriteriaportal.org/files/ppfiles/lspp.pdf)
* [National Industrial Security Program Operating Manual (NISPOM)](http://www.fas.org/sgp/library/nispom.htm)
* [Security Technical Implementation Guides](http://iase.disa.mil/stigs/stig/index.html)

The OS package provides the client side tools for working with the
linux kernel audit framework.

Requirements
============
Linux : any distribution in theory, but only Ubuntu and RHEL 6 have been tested.

Attributes
==========
* node['auditd']['ruleset'] - ruleset to use, either "default" (the default if
  unset) or one of the provided examples
* node['auditd']['backlog'] - backlog size, default is 320 should be
larger for busy systems

Usage
=====
If you're using one of the default rulesets set the correct attribute
based on the ruleset desired, one of:

* "capp" : Controlled Access Protection Profile
* "lspp" : Labeled Security Protection Profile
* "nispom" : National Industrial Security Program Operating Manual (NISPOM)
* "stig" : Security Technical Implementation Guides
* "cis"  : Center for Internet Security auditd recommendations

And include `recipe[auditd::rules]` in your run list. You can also set
the attribute `node['auditd']['ruleset']` to the name of a custom rule
template to be used instead of one of the default rules.

If you are using the recipe from a wrapper cookbook, include the
default recipe `recipe[auditd]` to setup the service and use the
`auditd_ruleset` resource to place your rule template of choice.

If you are not satisfied with any of the provided templates, you can
specify the `cookbook` attribute in `auditd_ruleset` to use your own
set of rules. In this case, do not include `recipe[auditd::rules]`.

TODO
====
Ideally the auditd_ruleset resource could make use of a data bag
search to build the data driven ruleset

Make builtins an array attribute to allow user updates without
cookbook release.
