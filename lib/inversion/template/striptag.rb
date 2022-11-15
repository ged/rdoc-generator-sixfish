# -*- ruby -*-
# frozen_string_literal: true
# vim: set noet nosta sw=4 ts=4 :

require 'uri'
require 'inversion/template' unless defined?( Inversion::Template )
require 'inversion/template/attrtag'

# Inversion strip tag.
#
# This tag strips markup from a template attribute.
#
# == Syntax
#
#   <?strip foo.bar ?>
#
class Inversion::Template::StripTag < Inversion::Template::AttrTag
	include Inversion::Escaping


	HTML_TAG = %r{
		<
			/?
			\p{Alnum}+
			(
				\s+
				\S+="[^\"]*"
			)*
			\s*
		>
	}xi


	### Render the method chains against the attributes of the specified +render_state+
	### and return them.
	def render( render_state )
		raw = super or return nil
		return raw.gsub(HTML_TAG, '')
	end

end # class Inversion::Template::StripTag

