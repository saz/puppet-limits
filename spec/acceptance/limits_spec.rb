# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'limits::limits define' do
  context 'with default parameters' do
    it 'works with no errors' do
      pp = <<-PP
      limits::limits { '*/nofile':
        hard => 12345,
        soft => 1234,
      }
      PP

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_failures: true)
    end
  end

  context 'with ignore and suffix specified managed file' do
    it 'create a puppet managed file' do
      pp = <<-PP
      limits::limits { 'item':
        user       => 'user',
        limit_type => 'nofile',
        both       => 12345
      }
      PP

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      expect(apply_manifest(pp, catch_failures: true).exit_code).to be_zero
    end

    describe file('/etc/security/limits.d/user_nofile.conf') do
      it { is_expected.to be_file }
      it { is_expected.to contain "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>\nuser          -     nofile          12345" }
    end
  end

  context 'with target specified managed file' do
    it 'create a puppet managed file' do
      pp = <<-PP
      limits::limits { 'item':
        user       => 'user',
        limit_type => 'nofile',
        both       => 12345,
        target     => '00-item.conf'
      }
      PP

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      expect(apply_manifest(pp, catch_failures: true).exit_code).to be_zero
    end

    describe file('/etc/security/limits.d/00-item.conf') do
      it { is_expected.to be_file }
      it { is_expected.to contain "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>\nuser          -     nofile          12345" }
    end
  end

  context 'with multiple target specified managed limit' do
    it 'create a puppet managed file' do
      pp = <<-PP
      limits::limits { 'item':
        user       => 'user',
        limit_type => 'nofile',
        both       => 12345,
        target     => '00-item.conf'
      }

      limits::limits { 'item2':
        user       => 'other_user',
        limit_type => 'nproc',
        both       => 54321,
        target     => '00-item.conf'
      }
      PP

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      expect(apply_manifest(pp, catch_failures: true).exit_code).to be_zero
    end

    describe file('/etc/security/limits.d/00-item.conf') do
      it { is_expected.to be_file }
      it { is_expected.to contain "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>\nuser          -     nofile          12345\nother_user    -     nproc           54321\n" }
    end
  end
end
