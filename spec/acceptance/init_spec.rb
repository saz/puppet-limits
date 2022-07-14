# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'limits' do
  context 'with all defaults' do
    let(:pp) do
      'include limits'
    end

    it 'works idempotently with no errors' do
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end
end
