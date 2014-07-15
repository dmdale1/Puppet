#Needs more comments, what does this do?

file {"text.txt":
	path => "/etc/puppet/manifests",
	content => "This is a test document",
}
