# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v6.0.0](https://github.com/saz/puppet-limits/tree/v6.0.0) (2025-10-17)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v5.0.0...v6.0.0)

**Breaking changes:**

- set manage\_limits\_file to true by default, fixes \#64 [\#69](https://github.com/saz/puppet-limits/pull/69) ([saz](https://github.com/saz))
- replace puppet requirement by openvox [\#66](https://github.com/saz/puppet-limits/pull/66) ([saz](https://github.com/saz))

**Implemented enhancements:**

- add Debian Trixie as supported OS [\#68](https://github.com/saz/puppet-limits/pull/68) ([saz](https://github.com/saz))

**Closed issues:**

- `purge_limits_d_dir` default: true, `manage_limits_file` default: false [\#64](https://github.com/saz/puppet-limits/issues/64)
- Missing REFERENCE.md file [\#62](https://github.com/saz/puppet-limits/issues/62)

**Merged pull requests:**

- Add REFERENCE and update param strings [\#63](https://github.com/saz/puppet-limits/pull/63) ([bwitt](https://github.com/bwitt))

## [v5.0.0](https://github.com/saz/puppet-limits/tree/v5.0.0) (2024-10-28)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v4.0.1...v5.0.0)

**Closed issues:**

- outdated module dependencies/requirements [\#55](https://github.com/saz/puppet-limits/issues/55)

**Merged pull requests:**

- Fix limits\_template on Debian [\#59](https://github.com/saz/puppet-limits/pull/59) ([jay7x](https://github.com/jay7x))
- Update to module template files [\#58](https://github.com/saz/puppet-limits/pull/58) ([saz](https://github.com/saz))
- little code modernization [\#57](https://github.com/saz/puppet-limits/pull/57) ([Lightning-](https://github.com/Lightning-))

## [v4.0.1](https://github.com/saz/puppet-limits/tree/v4.0.1) (2024-06-10)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v4.0.0...v4.0.1)

**Merged pull requests:**

- release: v4.0.1 [\#56](https://github.com/saz/puppet-limits/pull/56) ([saz](https://github.com/saz))
- update module dependencies/requirements [\#54](https://github.com/saz/puppet-limits/pull/54) ([Lightning-](https://github.com/Lightning-))

## [v4.0.0](https://github.com/saz/puppet-limits/tree/v4.0.0) (2024-05-22)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v3.1.0...v4.0.0)

**Closed issues:**

- Missing newline [\#48](https://github.com/saz/puppet-limits/issues/48)
- Add an "empty" limits\_template [\#47](https://github.com/saz/puppet-limits/issues/47)
- README.md indicates that this module does not manage /etc/security/limits.conf.  Why doesn't it? [\#43](https://github.com/saz/puppet-limits/issues/43)
- How do you set more than one limit type in a single file? [\#42](https://github.com/saz/puppet-limits/issues/42)
- Can we support prefix configuration for limits ? [\#39](https://github.com/saz/puppet-limits/issues/39)

**Merged pull requests:**

- release: v4.0.0 [\#53](https://github.com/saz/puppet-limits/pull/53) ([saz](https://github.com/saz))
- add empty template, fixes \#47 [\#52](https://github.com/saz/puppet-limits/pull/52) ([saz](https://github.com/saz))
- allow puppetlabs/concat \< 10, drop puppet 6, update supported OS [\#51](https://github.com/saz/puppet-limits/pull/51) ([saz](https://github.com/saz))
- Update to module template files [\#50](https://github.com/saz/puppet-limits/pull/50) ([saz](https://github.com/saz))
- Add line end character for top comment in limits::limits [\#49](https://github.com/saz/puppet-limits/pull/49) ([bond-os](https://github.com/bond-os))
- Update from modulesync\_config [\#46](https://github.com/saz/puppet-limits/pull/46) ([saz](https://github.com/saz))
- Allow managing multiple settings in one file [\#45](https://github.com/saz/puppet-limits/pull/45) ([bond-os](https://github.com/bond-os))
- Add the management of limits.conf file. [\#44](https://github.com/saz/puppet-limits/pull/44) ([bschonec](https://github.com/bschonec))

## [v3.1.0](https://github.com/saz/puppet-limits/tree/v3.1.0) (2022-07-14)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v3.0.4...v3.1.0)

**Closed issues:**

- Compatibility with Puppet 7 ? [\#38](https://github.com/saz/puppet-limits/issues/38)
- Add support for puppet6 [\#36](https://github.com/saz/puppet-limits/issues/36)
- New release [\#35](https://github.com/saz/puppet-limits/issues/35)

**Merged pull requests:**

- Update from modulesync\_config [\#41](https://github.com/saz/puppet-limits/pull/41) ([saz](https://github.com/saz))
- Allow Puppet 7 [\#40](https://github.com/saz/puppet-limits/pull/40) ([deric](https://github.com/deric))
- Use Hiera for Default-Values [\#37](https://github.com/saz/puppet-limits/pull/37) ([cocker-cc](https://github.com/cocker-cc))

## [v3.0.4](https://github.com/saz/puppet-limits/tree/v3.0.4) (2019-10-28)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v3.0.3...v3.0.4)

**Closed issues:**

- Support Puppet 6 [\#34](https://github.com/saz/puppet-limits/issues/34)

## [v3.0.3](https://github.com/saz/puppet-limits/tree/v3.0.3) (2018-07-17)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v3.0.2...v3.0.3)

**Closed issues:**

- Hard, soft or both is required when ensure is absent [\#33](https://github.com/saz/puppet-limits/issues/33)
- Unclear documentation language [\#32](https://github.com/saz/puppet-limits/issues/32)

## [v3.0.2](https://github.com/saz/puppet-limits/tree/v3.0.2) (2018-01-11)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v3.0.1...v3.0.2)

**Closed issues:**

- type error with 3.0.x release [\#31](https://github.com/saz/puppet-limits/issues/31)

## [v3.0.1](https://github.com/saz/puppet-limits/tree/v3.0.1) (2018-01-11)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v3.0.0...v3.0.1)

## [v3.0.0](https://github.com/saz/puppet-limits/tree/v3.0.0) (2018-01-09)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v2.5.0...v3.0.0)

**Closed issues:**

- this does not work for 2 different users in same file? [\#27](https://github.com/saz/puppet-limits/issues/27)
- new release [\#24](https://github.com/saz/puppet-limits/issues/24)

**Merged pull requests:**

- refactored for Puppet 4 / Hiera 5 [\#30](https://github.com/saz/puppet-limits/pull/30) ([crayfishx](https://github.com/crayfishx))

## [v2.5.0](https://github.com/saz/puppet-limits/tree/v2.5.0) (2016-11-17)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v2.3.0...v2.5.0)

**Closed issues:**

- How do we make this puppet 4 ready? [\#20](https://github.com/saz/puppet-limits/issues/20)
- create new major versions when changing parameters [\#19](https://github.com/saz/puppet-limits/issues/19)

**Merged pull requests:**

- title pattern for simpler definition [\#28](https://github.com/saz/puppet-limits/pull/28) ([pgassmann](https://github.com/pgassmann))
- Add manage\_limits\_d\_dir bool class param [\#26](https://github.com/saz/puppet-limits/pull/26) ([jeffmccune](https://github.com/jeffmccune))
- Add SUSE Support. [\#25](https://github.com/saz/puppet-limits/pull/25) ([aschaber1](https://github.com/aschaber1))
- path should not have a trailing slash [\#23](https://github.com/saz/puppet-limits/pull/23) ([jfroche](https://github.com/jfroche))
- Support Puppet v4 [\#22](https://github.com/saz/puppet-limits/pull/22) ([ghoneycutt](https://github.com/ghoneycutt))
- Update metadata.json [\#21](https://github.com/saz/puppet-limits/pull/21) ([HoogWater](https://github.com/HoogWater))
- Added support for the Gentoo operating system family. [\#18](https://github.com/saz/puppet-limits/pull/18) ([paraenggu](https://github.com/paraenggu))

## [v2.3.0](https://github.com/saz/puppet-limits/tree/v2.3.0) (2015-05-24)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v2.2.2...v2.3.0)

**Closed issues:**

- Use of entries as variable name in init.pp seems to force native merging [\#17](https://github.com/saz/puppet-limits/issues/17)

## [v2.2.2](https://github.com/saz/puppet-limits/tree/v2.2.2) (2015-03-29)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v2.2.1...v2.2.2)

## [v2.2.1](https://github.com/saz/puppet-limits/tree/v2.2.1) (2015-03-29)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v2.1.0...v2.2.1)

**Closed issues:**

- Symlinks in archive [\#14](https://github.com/saz/puppet-limits/issues/14)
- Tag released version [\#13](https://github.com/saz/puppet-limits/issues/13)

**Merged pull requests:**

- Add a "Managed by Puppet" comment. [\#16](https://github.com/saz/puppet-limits/pull/16) ([Farzy](https://github.com/Farzy))
- integrate with hiera [\#15](https://github.com/saz/puppet-limits/pull/15) ([mburger](https://github.com/mburger))

## [v2.1.0](https://github.com/saz/puppet-limits/tree/v2.1.0) (2014-09-14)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v2.0.1...v2.1.0)

**Closed issues:**

- Mention PAM and pam\_limits in description [\#7](https://github.com/saz/puppet-limits/issues/7)
- both-type not supported [\#6](https://github.com/saz/puppet-limits/issues/6)
- Rename limits::limits to something else? [\#5](https://github.com/saz/puppet-limits/issues/5)

**Merged pull requests:**

- remove double case [\#12](https://github.com/saz/puppet-limits/pull/12) ([dwerder](https://github.com/dwerder))
- fix docu about pruging behavior [\#11](https://github.com/saz/puppet-limits/pull/11) ([dwerder](https://github.com/dwerder))
- fix regex. so it does not match files like blaconf [\#10](https://github.com/saz/puppet-limits/pull/10) ([dwerder](https://github.com/dwerder))
- Remove symlinks in favor of .fixtures.yml [\#9](https://github.com/saz/puppet-limits/pull/9) ([treydock](https://github.com/treydock))

## [v2.0.1](https://github.com/saz/puppet-limits/tree/v2.0.1) (2012-10-13)

[Full Changelog](https://github.com/saz/puppet-limits/compare/v2.0.0...v2.0.1)

**Merged pull requests:**

- Make sure created limits files end in .conf [\#4](https://github.com/saz/puppet-limits/pull/4) ([robsweet](https://github.com/robsweet))
- Added RedHat to the list of acceptable OS families [\#3](https://github.com/saz/puppet-limits/pull/3) ([robsweet](https://github.com/robsweet))

## [v2.0.0](https://github.com/saz/puppet-limits/tree/v2.0.0) (2012-10-03)

[Full Changelog](https://github.com/saz/puppet-limits/compare/aee968a10e781fd013f9f8df4cbb4face0e3b075...v2.0.0)

**Merged pull requests:**

- CentOS 5/6 both use the same default. [\#1](https://github.com/saz/puppet-limits/pull/1) ([metcalfc](https://github.com/metcalfc))

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

[v5.0.0]

### Changed

- little code modernization (#57)
- Fix limits_template on Debian (#59)
- drop some EOL operating system releases (#58) => Debian 10, CentOS 7/8, RedHat 7

[v4.0.1]

### Changed

- drop explicit version requirements in .fixtures.yml (#54)

[v4.0.0]

### Added

- add empty template, fixes #47 (#52)
- Add the management of limits.conf file. (#44)
- Allow managing multiple settings in one file (#45)
- Allow Puppet 8 (#51)
- Add Ubuntu 24.04 and Debian 12 as supported OS (#51)

### Changed

- allow puppetlabs/concat < 10 (#51)

### Fixed

- Add line end character for top comment and use proper matchers for acceptance tests (#49)

### Removed

- remove Debian 9 as supported OS
- drop Puppet 6 support (#51)
- remove Ubuntu 18.04 as supported OS (#51)

[v3.1.0]

### Changed

- Update Puppet version requirement to include version 7 (< 8.0.0) (#40)
- Switch to GitHub Actions and add basic acceptance tests (#41)
- Use hiera for default values (#37)

[v3.0.4]

### Added

- CHANGELOG.md added

### Changed

- Update Puppet version requirement to include version 6 (< 7.0.0)


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
