require 'spec_helper'
describe 'catfacts::schedule', :type => :define do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end
      let(:title) { 'foo' }
      let(:params) do
        {
          :target => '5558675309@vtext.com',
          :sender => 'foo@bar.com'
        }
      end

      context 'using minimum params' do
        it 'creates the cron job' do
          case facts[:osfamily]
          when 'redhat'
            is_expected.to create_cron('foo').with({
                                                      :user => 'root',
                                                      :minute => '0',
                                                      :hour => '*',
                                                      :command => '/usr/bin/fortune \
/etc/catfacts/catfacts -s -n 140 | \
/usr/sbin/sendmail -f foo@bar.com 5558575309@vtext.com'
                                                    })
          when 'debian'
            is_expected.to create_cron('foo').with({
                                                     :user => 'root',
                                                     :minute => '0',
                                                     :hour => '*',
                                                     :command => '/usr/games/fortune \
/etc/catfacts/catfacts -s -n 140 | \
/usr/sbin/sendmail -f foo@bar.com 5558575309@vtext.com'
                                                   })
          end
        end
      end
    end
  end
end
