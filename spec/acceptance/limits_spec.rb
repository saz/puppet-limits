# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'limits::limits class' do
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
    describe command('touch /etc/sudoers.d/file-from-rpm') do
      its(:exit_status) { is_expected.to eq 0 }
    end

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
      it { is_expected.to contain 'user          -     nofile          12345' }
    end
  end
end
