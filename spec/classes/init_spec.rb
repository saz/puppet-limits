# frozen_string_literal: true

require 'spec_helper'

describe 'limits' do
  let :node do
    'rspec.puppet.com'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'with all defaults' do
        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_file('/etc/security/limits.d').with(
            'ensure'  => 'directory',
            'owner'   => 'root',
            'group'   => 'root',
            'force'   => true,
            'recurse' => true,
            'purge'   => true
          )
        end
      end

      describe 'with purge_limits_d_dir set to false' do
        let :params do
          {
            purge_limits_d_dir: false
          }
        end

        it do
          is_expected.to contain_file('/etc/security/limits.d').with(
            'ensure'  => 'directory',
            'owner'   => 'root',
            'group'   => 'root',
            'force'   => true,
            'recurse' => true,
            'purge'   => false
          )
        end
      end

      describe 'with manage_limits_d_dir set to false' do
        let :params do
          {
            manage_limits_d_dir: false
          }
        end

        it { is_expected.not_to contain_file('/etc/security/limits.d') }
      end
    end
  end
end
