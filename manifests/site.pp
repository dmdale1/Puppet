file { "testfile":
	ensure => present,
        path => '/etc/testfile',
	content => "I'm a test file",
}
user { 'dylan':
	ensure => present,
	home => '/home/dylan',
}
