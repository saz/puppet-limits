require 'spec_helper'
describe 'limits::limits', :type => :define do
  let :title do
    'username_nofile'
  end

  let :facts do
    {
      :osfamily => 'Debian'
    }
  end

  let :params do
      {
      :user       => 'username',
      :limit_type => 'nofile',
      :ensure     => 'present',
      :hard       => '16384',
      :soft       => '16384'
      }
  end

  describe "when creating an limits entry" do

    let :filename do
      '/etc/security/limits.d/username_nofile'
    end

    it { should contain_limits__limits('username_nofile').with({
        :user       => 'username',
        :limit_type => 'nofile',
        :ensure     => 'present',
        :hard       => '16384',
        :soft       => '16384'
      })
    }

    it { should contain_file(filename).with({
        'ensure'    => 'present',
        'content'   => "username hard nofile 16384\n\nusername soft nofile 16384\n",
        'owner'     => 'root',
        'group'     => 'root',
      })
    }

  end

  describe "when removing an limits entry" do
    let :params do
      {
      :user       => 'username',
      :limit_type => 'nofile',
      :ensure     => 'absent',
      :hard       => '16384',
      :soft       => '16384'
      }
    end

    let :filename do
      '/etc/security/limits.d/username_nofile'
    end

    it { should contain_file(filename).with({
        'ensure'    => 'absent',
        'content'   => "username hard nofile 16384\n\nusername soft nofile 16384\n",
        'owner'     => 'root',
        'group'     => 'root',
      })
    }
  end
end
