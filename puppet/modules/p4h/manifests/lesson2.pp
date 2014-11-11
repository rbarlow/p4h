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

class p4h::lesson2() {

	file { '/root/README':
		content => "##lesson2
For this lesson, please do the following:
* Use the `inline_template` function	# optional, as it was covered in prep!
* Use the `notice` function -- what is the difference between this and notify ?
* Use the `regsubst` function -- highly useful for simple transformations
* Use the `sha1` function -- useful for occasionally transforming / hashing
* Use the `split` function -- highly useful -- why ?
* Use the `sprintf` function -- very useful
* Use the `template` function -- used most often with the file `type`

Bonus:
* Use the `shellquote` function -- occasionally it is useful
* Use the `versioncmp` function -- has been quite useful for certain modules

Happy hacking!\n",
	}

	file { "/home/vagrant/some_file.txt":
		ensure => file,
		content => inline_template("Holy craaaaaap!
My hostname is <=% hostname %>.
		"),
	}

	$machine_number = regsubst($hostname, '([a-z]+)(\d)+', '\2')
	$message = "The lesson number is $machine_number."
	notice($message)
	$checksum = sha1($message)
	notice("Just in case you were wondering, the sha1 of that last message is $checksum.")

	$octets = split("192.168.25.1", ".")
	$second_octet = $octets[1]
	notice("192.168.25.1's second octet is $second_octet.")
}

# vim: ts=8
