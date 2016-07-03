require 'spec_helper'
describe 'catfacts', type: :class do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end
      it { is_expected.to compile }
      it { is_expected.to contain_class('catfacts') }

      it 'contains dependent classes' do
        is_expected.to contain_class('catfacts::params')
      end

      it 'creates files' do
        is_expected.to create_file('/etc/catfacts').with(owner: 'root',
                                                         group: 'root',
                                                         mode: '0755',
                                                         ensure: 'directory')
        is_expected.to create_file('/etc/catfacts/catfacts').with(owner: 'root',
                                                                  group: 'root',
                                                                  mode: '0555',
                                                                  ensure: 'file')
        is_expected.to create_file('/etc/catfacts/catfacts.dat').with(owner: 'root',
                                                                      group: 'root',
                                                                      mode: '0555',
                                                                      ensure: 'file')
      end

      it 'installs fortune' do
        is_expected.to create_package('fortune')
      end
    end
  end
end
