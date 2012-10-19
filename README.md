Description
===========
A simple cookbook to install auditd and provided rulesets. Rulesets
included in the auditd package as examples are based on 4 established
standards:

* [Controlled Access Protection Profile (CAPP)](http://www.commoncriteriaportal.org/files/ppfiles/capp.pdf)
* [Labeled Security Protection Profile (LSPP)](http://www.commoncriteriaportal.org/files/ppfiles/lspp.pdf)
* [National Industrial Security Program Operating Manual (NISPOM)](http://www.fas.org/sgp/library/nispom.htm)
* [Security Technical Implementation Guides](http://iase.disa.mil/stigs/stig/index.html)

The auditd package provides the client side tools for working with the
linux kernel audit framework

Requirements
============
linux - any distro, only ubuntu has been tested

Attributes
==========
* node['auditd']['ruleset'] - ruleset to use, either default or one of
  the provided examples
* node['auditd']['backlog'] - backlog size, default is 320 should be
larger for busy systems

Usage
=====
Set the correct attribute based on the rulesset desired, one of:

* "capp" : Controlled Access Protection Profile
* "lspp" : Labeled Security Protection Profile
* "nispom" : National Industrial Security Program Operating Manual (NISPOM) 
* "stig" : Security Technical Implementation Guides 

TODO
====
Ideally the auditd_rulset resource should make use of a data bag
search to build the data driven ruleset
