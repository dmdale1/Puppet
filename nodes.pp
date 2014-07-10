node 'agent.poc.apparatus.net' {
	user { 'bob':
		ensure => present,
		home => '/home/bob',
	}
}
