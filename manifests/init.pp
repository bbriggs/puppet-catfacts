# == Class: catfacts
#
# Send cat facts to your friends using the power of cron, fortune, and sendmail!
#
# === Parameters
#
# The main class has no parameters. The module is designed to be used
# via the type catfacts::schedule.  
#
# [*target*]
#	String. Required. Email address of person with whom you just cannot wait to share 
#   the joy of CAT FACTS!
# 
# [*sender*]
#   String. Required. Email address you want displayed as the sender, so everyone
#   knows exactly who sent them the cat facts, right?
#
# [*user*]
#   String. Defaults to "root". Do you really want this running as root? Probably not.
#   I don't know what users are running on your box, though, so I had to default to something
#
# [*minute*] and [*hour*]
#   String. Defaults to "0" and "*" respectively. These are inputs to the cron job.
#   I did not provide other cron options because people should receive cat facts at least daily. 
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*catfacts::params::fortune_location*]
#	Location of the fortune binary
#
# [*catfacts::params::mailer_location*]
#	Location of the sendmail binary
#
# === Examples
#
#  include catfacts
#  catfacts::schedule{'cat_facts_for_dad':
#		target		=> '5558675309@vtext.com',
#		sender      => mailer@catfacts.com,
#		user        => 'notroot',
#		minute      => '*/5',
#		hour		=> '*',
#	}
#
# === Authors
#
# Bren Briggs <briggs.brenton@gmail.com>
#
# === Copyright
#
# Copyright 2015 Bren Briggs, unless otherwise noted.
#
class catfacts (
    ) inherits catfacts::params {

    package {'fortune':
        ensure => 'installed',
    }

}

