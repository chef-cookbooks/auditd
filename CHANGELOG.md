# CHANGELOG for auditd

This file is used to list changes made in each version of auditd.


## 1.0.1 (2016-10-13)

- Add new array attribute to hold optional additional lines to add into ERB
- Fix issue where missing system directories on Ubuntu resulted in only half the CIS rulebase to load

## 1.0.0 (2016-09-08)

- Testing updates
- Require Chef 12

## 0.2.0 (2016-08-11)

- Add uninstall/remove support
- Update docs with testing and contributing process
- Use Berkshelf not Librarian for dependency management
- Add a travis config
- Add a license file
- Update the testing to use Rake and remove test deps from the Gemfile. We assume you're in ChefDK now
- Update the cookbook owner and add chef_version metadata
- Use the new notification syntax in templates
- Cookstyle fixes to the code
- Remove the utf encoding comments. There's no need for this
- Remove Chef 10 compatibility

## 0.1.8:

- add coc and contributing documents
- update gitignore list for some chef related files
- update supermarket uri
- use correct restart command when under systemd on rhel
- better rule definition support for rhel systems that no longer ship with examples
- add test suite for capp rules

## 0.1.2:

- excluded non-default rulesets for RedHat; they use a version-specific path that I can't find any easy way to determine programatically

## 0.1.1:

- added RedHat support

## 0.1.0:

- Initial release of auditd
