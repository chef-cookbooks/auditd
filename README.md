Description
===========
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
	* NOTE: When using this recipe on RHEL systems, you're restricted to the "default" or "cis" rulesets, as RHEL uses version-specific paths for the .rules which we can't programatically determine at this time.
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
`auditd_ruleset` resource to place your custom rule template.

TODO
====
Ideally the auditd_ruleset resource could make use of a data bag
search to build the data driven ruleset

Make builtins an array attribute to allow user updates without
cookbook release.
