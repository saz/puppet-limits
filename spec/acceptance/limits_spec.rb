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
      its(:content) { is_expected.to match "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>\nuser          -     nofile          12345" }
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
      its(:content) { is_expected.to match "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>\nuser          -     nofile          12345" }
    end
  end

  context 'with multiple target specified managed limit' do
    it 'create a puppet managed file' do
      pp = <<-PP
      limits::limits { 'item':
        user       => 'user',
        limit_type => 'nofile',
        both       => 12345,
        target     => '01-item.conf'
      }

      limits::limits { 'item2':
        user       => 'other_user',
        limit_type => 'nproc',
        both       => 54321,
        target     => '01-item.conf'
      }

      limits::limits { 'item3':
        user       => 'zlast_user',
        limit_type => 'nproc',
        hard       => 16384,
        target     => '01-item.conf'
      }

      limits::limits { 'item4':
        user       => 'another_user',
        limit_type => 'nproc',
        soft       => 16384,
        target     => '01-item.conf'
      }
      PP

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      expect(apply_manifest(pp, catch_failures: true).exit_code).to be_zero
    end

    describe file('/etc/security/limits.d/01-item.conf') do
      it { is_expected.to be_file }
      its(:content) { is_expected.to match "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>\nanother_user  soft  nproc           16384\nother_user    -     nproc           54321\nuser          -     nofile          12345\nzlast_user    hard  nproc           16384\n" }
    end
  end
end
