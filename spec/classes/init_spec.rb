require 'spec_helper'

describe 'catfacts', :type => :class do
  context 'Debian systems' do
    let(:facts) { {
      :osfamily => 'Debian',
    } }

    it { is_expected.to create_package('fortune') }
    it { is_expected.to create_file('/etc/catfacts') }
    it { is_expected.to create_file('/etc/catfacts/catfacts') }
    it { is_expected.to create_file('/etc/catfacts/catfacts.dat') }
  end
end