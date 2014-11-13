# Puppet for Hackers course module by James
# Copyright (C) 2013-2014+ James Shubin
# Written by James Shubin <james@shubin.ca>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# README: this is a module built for use with: Oh My Vagrant!

class p4h::lesson23() {

	file { '/root/README':
		content => "##lesson22
For this lesson, please do the following:
* Fact exchange between two machines

Bonus:
* Add a third machine and see it also participate

Happy hacking!\n",
	}

	include common::again

	$some_path = "/home/vagrant/facts/${::hostname}-exec_time.txt"

	exec { "/usr/bin/date > ${some_path}":
		unless => "/usr/bin/ls ${some_path}",
		require => File["/home/vagrant/facts/"],
	}

	file { "/home/vagrant/facts/":
		ensure => directory,
	}

	@@file { "/home/vagrant/${::hostname}-exported_time.txt":
		content => "$::approximate_start_date",
		ensure => present,
		tag => "$::hostname",
	}

	File <<| tag != "$::hostname" |>> {
	}

}

# vim: ts=8
