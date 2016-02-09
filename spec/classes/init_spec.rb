require 'spec_helper'

describe 'catfacts', :type => :class do

    context 'Debian with default params' do
        let(:facts) { {
          :osfamily => 'Debian',
        } }
        it { should create_class('catfacts') }
        it { should create_file('/etc/catfacts/catfacts') }
        it { should create_file('etc/catfacts/catfacts.dat') }
        it { should create_package('fortune') }
    end

    context 'RedHat with default params' do
        let(:facts) { {
          :osfamily => 'RedHat',
        } }
        it { should create_class('catfacts') }
        it { should create_file('/etc/catfacts/catfacts') }
        it { should create_file('etc/catfacts/catfacts.dat') }
        it { should create_package('fortune') }
    end

    context 'Unsupported with default params' do
        let(:facts) { {
          :osfamily => 'BSD',
        } }
        it { is_expected.to raise_error(Puppet::Error) }
    end
end
