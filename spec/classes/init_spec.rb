require 'spec_helper'

describe 'catfacts', :type => :class do
  context 'Debian systems' do
    let(:facts) { {
      :osfamily => 'Debian',
    } }

    it { should create_class('catfacts') }
  end
end