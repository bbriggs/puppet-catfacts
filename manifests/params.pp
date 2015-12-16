class catfacts::params (
    ){
    case $::osfamily {
        'RedHat': { $fortune_location = '/usr/bin/forune'
                    $mailer_location  = '/usr/sbin/sendmail'
            }
        'Debian': { $fortune_location = '/usr/games/fortune'
                    $mailer_location  = '/usr/sbin/sendmail'
            }
    }
}