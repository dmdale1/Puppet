define accounts::virtual ($uid,$realname,$pass, $title) {

	user {$title:
		ensure => 'present',
		uid => $uid,
		gid => $title,
		shell => '/bin/bash',
		#home => "/home/$title",
		comment => $realname,
		password => $pass,
		managehome => true,
		require => Group[$title],
	}
	
	group {$titel:
		gid => $uid,
	}

	file {"/home/name":
		ensure => directory,
		owner => $title,
		group => $title,
		mode => 0750,
		require => [ User[$title], Group[$title] ],
	}
}

class accounts {

	@accounts::virtual { 'johndoe':
		title => 'johndoe',
		uid => 1001,
		realname => 'John Doe',
		pass => '<password hash here>',
	}
}

node default {
}

node 'puppet.poc.apparatus.net {
	include accounts
	realize (Accounts::Virtual['johndoe'])
}











file { "testfile":
	ensure => absent,
        path => '/etc/testfile',
	content => "I'm a test file",
}
user { 'dylan':
	ensure => absent,
	home => '/home/dylan',
}

file { '/home/dylan':
	ensure => absent,
}
