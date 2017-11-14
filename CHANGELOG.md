# CHANGELOG for auditd

This file is used to list changes made in each version of auditd.

## 2.2.0 (2017-11-14)

- Resolve FC108 warnings
- Allow specifying the cookbook where the template is in the builtins resource
- Require Chef 12.7+ due to bugs in 12.5/12.6 custom resources

## 2.1.1 (2017-07-13)

- Install "audit" package for Amazon Linux on Chef 13

## 2.1.0 (2017-05-03)

- Add support for RHEL 7

## 2.0.0 (2017-04-26)

- Convert the existing LWRPs to custom resources, which raises the requires chef version to 12.5+
- Expand testing to cover the custom resources
- Let Chef can determine the proper restart command instead of hardcoding logic into the recipe
- Test with local delivery and not Rake
- Update apache2 license string
- Update copyrights

## 1.0.2 (2017-01-18)

- Add ChefSpec matchers

## 1.0.1 (2016-11-25)

- Enable use_inline_resources in the LWRPs
- Run integration testing in Travis

## 1.0.0 (2016-09-08)

- Testing updates
- Require Chef 12.0 or later

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
