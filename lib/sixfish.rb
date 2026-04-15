# -*- mode: ruby; ruby-indent-level: 4; tab-width: 4 -*-

# :title: Sixfish RDoc
#
# Toplevel namespace for Sixfish. The main goods are in RDoc::Generator::Sixfish.
module Sixfish

	# Library version constant
	VERSION = '0.4.0'

	# Fivefish project URL
	PROJECT_URL = 'https://hg.sr.ht/~ged/Sixfish'


	### Get the library version. If +include_buildnum+ is true, the version string will
	### include the VCS rev ID.
	def self::version_string( include_buildnum=false )
		vstring = "Sixfish RDoc %s" % [ VERSION ]
		return vstring
	end


	autoload :Patches, 'sixfish/patches'

end # module Sixfish

require 'rdoc/rdoc'
require 'rdoc/generator/sixfish'

RDoc::Markup::ToHtml.prepend( Sixfish::Patches )

