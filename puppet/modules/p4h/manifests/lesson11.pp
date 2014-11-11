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

class p4h::lesson11() {

	file { '/root/README':
		content => "##lesson11
For this lesson, please do the following:
* Create a `type` that will cause a duplicate error even if the $name is unique
** Preferably, try to think about a logical reason to do this
*** Remember, that if what you want is a singleton, then use a class instead!
* Ensure that all puppet environments that you've built complete in one run
** There are some exceptions to this rule, but they are rare and more advanced
*** We'll look at them, and the tools that are needed for these uses later...
**** Write a somewhat practical example using a chain of exec statements...
***** When waiting for progress, it is useful to provide debug statements...
****** This can be done with notice/notify (if possible) or exec /bin/echo msg

Bonus:
* Are there scenarios where the duplicate alias technique is used in a class?

Happy hacking!\n",
	}

	$message_1 = "Copyrighted Message 1"
	$message_2 = "Copyrighted Message 2"

	file { "/home/vagrant/message_1.txt":
		ensure => file,
		content => $message_1,
		alias => $message_1,
	}

	file { "/home/vagrant/message_2.txt":
		ensure => file,
		content => $message_2,
		alias => $message_2,
	}

	# This one isn't allowed since it's copyrighted material
	file { "/home/vagrant/message_3.txt":
		ensure => file,
		content => $message_2,
		alias => $message_2,
	}
}

# vim: ts=8
