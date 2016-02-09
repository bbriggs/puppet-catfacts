require 'spec_helper'
describe 'schedule', :type => :define do
  let (:title) { 'test_case' }
  let (:params) do
    {
      :target => '5558675309@vtext.com',
      :sender => 'mailer@catfacts.com',
      :user   => 'root',
      :minute => '*/5',
      :hour   => '*'
    }
  context 'Debian' do
    let(:facts) { {
      :osfamily => 'Debian',
    } }

    it { is_expected.to create_cron('test_case').with({
      :command          => '/usr/games/fortune /etc/catfacts/catfacts -s -n 140 | /usr/sbin/sendmail -f mailer@catfacts.com 5558675309@vtext.com',
      :minute           => '*/5',
      :hour             => '*',
    }) }
end

  context 'RedHat' do
    let(:facts) { {
      :osfamily => 'RedHat',
    } }

    it { is_expected.to create_cron('test_case').with({
      :command          => '/usr/bin/forune /etc/catfacts/catfacts -s -n 140 | /usr/sbin/sendmail -f mailer@catfacts.com 5558675309@vtext.com',
      :minute           => '*/5',
      :hour             => '*',
    }) }
end


#  catfacts::schedule{'cat_facts_for_dad':
#   target    => '5558675309@vtext.com',
#   sender      => mailer@catfacts.com,
#   user        => 'notroot',
#   minute      => '*/5',
#   hour    => '*',
# }

 cron {$name:
            command => "${catfacts::params::fortune_location} /etc/catfacts/catfacts -s -n 140 | ${catfacts::params::mailer_location} -f ${sender} ${target}",
            minute  => $minute,
            hour    => $hour,
            user    => $user