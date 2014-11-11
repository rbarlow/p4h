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

class p4h::lesson10() {

	file { '/root/README':
		content => "##lesson10
For this lesson, please do the following:
* Build a file with whole/frag
* Name at least one piece of software that requires this technique

Bonus:
* File a bug against a piece of software that would require this technique
** (it's usually a bug or iow, the lack of an include.d/ style feature)

Happy hacking!\n",
	}

	concat { '/home/vagrant/example.txt':
		ensure => present,
	}

	concat::fragment { 'example1':
		target  => '/home/vagrant/example.txt',
		content => "First content\n",
		order   => '01'
	}

	concat::fragment { 'example2':
		target  => '/home/vagrant/example.txt',
		content => "Second content\n",
		order   => '02'
	}

}

# vim: ts=8
