# frozen_string_literal: true

require 'spec_helper'

describe 'limits::limits', type: :define do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      let(:filename) { '/etc/security/limits.d/username_nofile.conf' }

      context 'default' do
        let(:title) { 'username_nofile' }
        let :params do
          {
            user: 'username',
            limit_type: 'nofile',
            ensure: 'present',
            hard: 16_384,
            soft: 16_384
          }
        end

        describe 'when creating a limits entry not ending in .conf' do
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('limits') }

          it {
            is_expected.to contain_limits__limits('username_nofile').with(
              user: 'username',
              limit_type: 'nofile',
              ensure: 'present',
              hard: 16_384,
              soft: 16_384
            )
          }

          it {
            is_expected.to contain_file('/etc/security/limits.d').with(
              path: '/etc/security/limits.d',
              ensure: 'directory',
              owner: 'root',
              group: 'root',
              force: true,
              purge: true,
              recurse: true
            )
          }

          it {
            is_expected.to contain_concat(filename).with(
              name: filename,
              path: filename
            )
          }

          it {
            is_expected.to contain_concat__fragment('top_/etc/security/limits.d/username_nofile.conf').with(
              name: 'top_/etc/security/limits.d/username_nofile.conf',
              target: filename,
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>",
              order: '01'
            )
          }

          it {
            is_expected.to contain_concat__fragment('username_nofile').with(
              name: 'username_nofile',
              target: filename,
              content: "username      hard  nofile          16384\nusername      soft  nofile          16384\n",
              order: '10'
            )
          }

          it {
            is_expected.to contain_concat_fragment('top_/etc/security/limits.d/username_nofile.conf').with(
              name: 'top_/etc/security/limits.d/username_nofile.conf',
              target: filename,
              order: '01',
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>"
            )
          }

          it {
            is_expected.to contain_concat_fragment('username_nofile').with(
              name: 'username_nofile',
              target: filename,
              order: '10',
              content: "username      hard  nofile          16384\nusername      soft  nofile          16384\n"
            )
          }

          it {
            is_expected.to contain_concat_file(filename).with(
              path: filename,
              owner: 'root',
              group: 'root'
            )
          }
        end

        describe 'when creating a limits entry ending in .conf' do
          let(:title) { 'username_nofile.conf' }

          it {
            is_expected.to contain_limits__limits('username_nofile.conf').with(
              user: 'username',
              limit_type: 'nofile',
              ensure: 'present',
              hard: 16_384,
              soft: 16_384
            )
          }

          it {
            is_expected.to contain_file('/etc/security/limits.d').with(
              path: '/etc/security/limits.d',
              ensure: 'directory',
              owner: 'root',
              group: 'root',
              force: true,
              purge: true,
              recurse: true
            )
          }

          it {
            is_expected.to contain_concat(filename).with(
              name: filename,
              path: filename
            )
          }

          it {
            is_expected.to contain_concat__fragment('top_/etc/security/limits.d/username_nofile.conf').with(
              name: 'top_/etc/security/limits.d/username_nofile.conf',
              target: filename,
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>",
              order: '01'
            )
          }

          it {
            is_expected.to contain_concat__fragment('username_nofile').with(
              name: 'username_nofile',
              target: filename,
              content: "username      hard  nofile          16384\nusername      soft  nofile          16384\n",
              order: '10'
            )
          }

          it {
            is_expected.to contain_concat_fragment('top_/etc/security/limits.d/username_nofile.conf').with(
              name: 'top_/etc/security/limits.d/username_nofile.conf',
              target: filename,
              order: '01',
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>"
            )
          }

          it {
            is_expected.to contain_concat_fragment('username_nofile').with(
              name: 'username_nofile',
              target: filename,
              order: '10',
              content: "username      hard  nofile          16384\nusername      soft  nofile          16384\n"
            )
          }

          it {
            is_expected.to contain_concat_file(filename).with(
              path: filename,
              owner: 'root',
              group: 'root'
            )
          }
        end

        describe 'when removing an limits entry' do
          let :params do
            {
              user: 'username',
              limit_type: 'nofile',
              ensure: 'absent',
              hard: 16_384,
              soft: 16_384
            }
          end

          it {
            is_expected.to contain_concat_file(filename).with(
              path: filename,
              ensure: 'absent'
            )
          }
        end

        describe 'when removing an limits entry without hard or soft set' do
          let :params do
            {
              user: 'username',
              limit_type: 'nofile',
              ensure: 'absent'
            }
          end

          it {
            is_expected.to contain_concat_file(filename).with(
              path: filename,
              ensure: 'absent'
            )
          }
        end

        context 'when creating a limits entry setting both limits' do
          let(:title) { 'username_nofile.conf' }
          let :params do
            {
              user: 'username',
              limit_type: 'nofile',
              ensure: 'present',
              both: 16_384
            }
          end

          it {
            is_expected.to contain_limits__limits('username_nofile.conf').with(
              user: 'username',
              limit_type: 'nofile',
              ensure: 'present',
              both: 16_384
            )
          }

          it {
            is_expected.to contain_file('/etc/security/limits.d').with(
              path: '/etc/security/limits.d',
              ensure: 'directory',
              owner: 'root',
              group: 'root',
              force: true,
              purge: true,
              recurse: true
            )
          }

          it {
            is_expected.to contain_concat(filename).with(
              name: filename,
              path: filename
            )
          }

          it {
            is_expected.to contain_concat__fragment('top_/etc/security/limits.d/username_nofile.conf').with(
              name: 'top_/etc/security/limits.d/username_nofile.conf',
              target: filename,
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>",
              order: '01'
            )
          }

          it {
            is_expected.to contain_concat__fragment('username_nofile').with(
              name: 'username_nofile',
              target: filename,
              content: "username      -     nofile          16384\n",
              order: '10'
            )
          }

          it {
            is_expected.to contain_concat_fragment('top_/etc/security/limits.d/username_nofile.conf').with(
              name: 'top_/etc/security/limits.d/username_nofile.conf',
              target: filename,
              order: '01',
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>"
            )
          }

          it {
            is_expected.to contain_concat_fragment('username_nofile').with(
              name: 'username_nofile',
              target: filename,
              order: '10',
              content: "username      -     nofile          16384\n"
            )
          }

          it {
            is_expected.to contain_concat_file(filename).with(
              path: filename,
              owner: 'root',
              group: 'root'
            )
          }
        end

        context 'when creating a limits entry with target file name specified' do
          let(:title) { 'username_nofile.conf' }
          let :params do
            {
              user: 'username',
              limit_type: 'nofile',
              ensure: 'present',
              both: 16_384,
              target: '99-service.conf'
            }
          end

          it {
            is_expected.to contain_limits__limits('username_nofile.conf').with(
              user: 'username',
              limit_type: 'nofile',
              ensure: 'present',
              both: 16_384,
              target: '99-service.conf'
            )
          }

          it {
            is_expected.to contain_file('/etc/security/limits.d').with(
              path: '/etc/security/limits.d',
              ensure: 'directory',
              owner: 'root',
              group: 'root',
              force: true,
              purge: true,
              recurse: true
            )
          }

          it {
            is_expected.to contain_concat('/etc/security/limits.d/99-service.conf').with(
              name: '/etc/security/limits.d/99-service.conf',
              path: '/etc/security/limits.d/99-service.conf'
            )
          }

          it {
            is_expected.to contain_concat__fragment('top_/etc/security/limits.d/99-service.conf').with(
              name: 'top_/etc/security/limits.d/99-service.conf',
              target: '/etc/security/limits.d/99-service.conf',
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>",
              order: '01'
            )
          }

          it {
            is_expected.to contain_concat__fragment('username_nofile').with(
              name: 'username_nofile',
              target: '/etc/security/limits.d/99-service.conf',
              content: "username      -     nofile          16384\n",
              order: '10'
            )
          }

          it {
            is_expected.to contain_concat_fragment('top_/etc/security/limits.d/99-service.conf').with(
              name: 'top_/etc/security/limits.d/99-service.conf',
              target: '/etc/security/limits.d/99-service.conf',
              order: '01',
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>"
            )
          }

          it {
            is_expected.to contain_concat_fragment('username_nofile').with(
              name: 'username_nofile',
              target: '/etc/security/limits.d/99-service.conf',
              order: '10',
              content: "username      -     nofile          16384\n"
            )
          }

          it {
            is_expected.to contain_concat_file('/etc/security/limits.d/99-service.conf').with(
              path: '/etc/security/limits.d/99-service.conf',
              owner: 'root',
              group: 'root'
            )
          }
        end
      end

      context 'title pattern' do
        describe 'default/nofile' do
          let(:title) { '*/nofile' }
          let :params do
            {
              both: 16_384
            }
          end

          it { is_expected.to compile.with_all_deps }

          it {
            is_expected.to contain_file('/etc/security/limits.d').with(
              path: '/etc/security/limits.d',
              ensure: 'directory',
              owner: 'root',
              group: 'root',
              force: true,
              purge: true,
              recurse: true
            )
          }

          it {
            is_expected.to contain_concat('/etc/security/limits.d/default_nofile.conf').with(
              name: '/etc/security/limits.d/default_nofile.conf',
              path: '/etc/security/limits.d/default_nofile.conf'
            )
          }

          it {
            is_expected.to contain_concat__fragment('top_/etc/security/limits.d/default_nofile.conf').with(
              name: 'top_/etc/security/limits.d/default_nofile.conf',
              target: '/etc/security/limits.d/default_nofile.conf',
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>",
              order: '01'
            )
          }

          it {
            is_expected.to contain_concat__fragment('*_nofile').with(
              name: '*_nofile',
              target: '/etc/security/limits.d/default_nofile.conf',
              content: "*             -     nofile          16384\n",
              order: '10'
            )
          }

          it {
            is_expected.to contain_concat_fragment('top_/etc/security/limits.d/default_nofile.conf').with(
              name: 'top_/etc/security/limits.d/default_nofile.conf',
              target: '/etc/security/limits.d/default_nofile.conf',
              order: '01',
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>"
            )
          }

          it {
            is_expected.to contain_concat_fragment('*_nofile').with(
              name: '*_nofile',
              target: '/etc/security/limits.d/default_nofile.conf',
              order: '10',
              content: "*             -     nofile          16384\n"
            )
          }

          it {
            is_expected.to contain_concat_file('/etc/security/limits.d/default_nofile.conf').with(
              path: '/etc/security/limits.d/default_nofile.conf',
              owner: 'root',
              group: 'root'
            )
          }
        end

        describe 'root/nofile' do
          let(:title) { 'root/nofile' }
          let :params do
            {
              hard: 12_345
            }
          end

          it {
            is_expected.to contain_file('/etc/security/limits.d').with(
              path: '/etc/security/limits.d',
              ensure: 'directory',
              owner: 'root',
              group: 'root',
              force: true,
              purge: true,
              recurse: true
            )
          }

          it {
            is_expected.to contain_concat('/etc/security/limits.d/root_nofile.conf').with(
              name: '/etc/security/limits.d/root_nofile.conf',
              path: '/etc/security/limits.d/root_nofile.conf'
            )
          }

          it {
            is_expected.to contain_concat__fragment('top_/etc/security/limits.d/root_nofile.conf').with(
              name: 'top_/etc/security/limits.d/root_nofile.conf',
              target: '/etc/security/limits.d/root_nofile.conf',
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>",
              order: '01'
            )
          }

          it {
            is_expected.to contain_concat__fragment('root_nofile').with(
              name: 'root_nofile',
              target: '/etc/security/limits.d/root_nofile.conf',
              content: "root          hard  nofile          12345\n",
              order: '10'
            )
          }

          it {
            is_expected.to contain_concat_fragment('top_/etc/security/limits.d/root_nofile.conf').with(
              name: 'top_/etc/security/limits.d/root_nofile.conf',
              target: '/etc/security/limits.d/root_nofile.conf',
              order: '01',
              content: "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>"
            )
          }

          it {
            is_expected.to contain_concat_fragment('root_nofile').with(
              name: 'root_nofile',
              target: '/etc/security/limits.d/root_nofile.conf',
              order: '10',
              content: "root          hard  nofile          12345\n"
            )
          }

          it {
            is_expected.to contain_concat_file('/etc/security/limits.d/root_nofile.conf').with(
              path: '/etc/security/limits.d/root_nofile.conf',
              owner: 'root',
              group: 'root'
            )
          }
        end
      end

      context 'validation' do
        describe 'missing user' do
          let(:title) { 'nofile' }
          let :params do
            {
              limit_type: 'nofile',
              both: 16_384
            }
          end

          it { is_expected.to compile.and_raise_error(%r{when not using the title pattern}) }
        end

        describe 'missing type' do
          let(:title) { 'nofile.conf' }
          let :params do
            {
              user: 'foo',
              both: 16_384
            }
          end

          it { is_expected.to compile.and_raise_error(%r{when not using the title pattern}) }
        end

        describe 'missing limit' do
          let(:title) { 'root/nofile' }

          it { is_expected.to compile.and_raise_error(%r{\$hard, \$soft or \$both is required}) }
        end
      end
    end
  end
end
