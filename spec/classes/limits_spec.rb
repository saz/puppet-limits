require 'spec_helper'
describe 'limits' do

  let :default_params do
    {
      :purge_limits_d_dir => true
    }
  end

  [ {},
    {
      :purge_limits_d_dir => false
    }
  ].each do |param_set|
    describe "when #{param_set == {} ? "using default" : "specifying"} class parameters" do

      let :param_hash do
        default_params.merge(param_set)
      end

      let :params do
        param_set
      end

      ['Debian', 'RedHat'].each do |osfamily|

        let :facts do
          {
            :osfamily => osfamily,
          }
        end

        describe "on supported osfamily: #{osfamily}" do

          it { should contain_class('limits::params') }

          it { should contain_file('/etc/security/limits.d/').with(
            'ensure'  => 'directory',
            'owner'   => 'root',
            'group'   => 'root',
            'force'   => true,
            'recurse' => true,
            'purge'   => param_hash[:purge_limits_d_dir]
          )}
        end
      end
    end
  end
end
