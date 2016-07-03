define catfacts::schedule (
  $target,
  $sender,
  $user = 'root',
  $minute = '0',
  $hour = '*',
  ) {
    include ::catfacts
    include ::catfacts::params
    cron { $name:
      command => "${catfacts::params::fortune_location} \
      /etc/catfacts/catfacts -s -n 140 | \
      ${catfacts::params::mailer_location} \
      -f ${sender} ${target}",
      minute  => $minute,
      hour    => $hour,
      user    => $user,
    }
}
