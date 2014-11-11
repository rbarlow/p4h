Facter.add('root_stuff') do
	setcode do
		Facter::Core::Execution.exec('ls /')
	end
end
