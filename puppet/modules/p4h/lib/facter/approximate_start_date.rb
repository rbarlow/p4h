Facter.add('approximate_start_date') do
	setcode do
		`/usr/bin/cat /home/vagrant/facts/*`
	end
end
