# -*- ruby -*-
# frozen_string_literal: true

require 'rdoc/markup/to_html'

require 'sixfish' unless defined?( Sixfish )


module Sixfish::Patches

	LIST_TYPE_TO_HTML = {
		:BULLET => ['<ul>',                                      '</ul>'],
		:LABEL  => ['<dl class="rdoc-list label-list">',         '</dl>'],
		:LALPHA => ['<ol style="list-style-type: lower-alpha">', '</ol>'],
		:NOTE   => [
			'<table class="rdoc-list note-list table box"><tbody>',
			'</tbody></table>'
		],
		:NUMBER => ['<ol>',                                      '</ol>'],
		:UALPHA => ['<ol style="list-style-type: upper-alpha">', '</ol>'],
	}


	def html_list_name(list_type, open_tag)
		tags = Sixfish::Patches::LIST_TYPE_TO_HTML[list_type]
		raise RDoc::Error, "Invalid list type: #{list_type.inspect}" unless tags
		tags[open_tag ? 0 : 1]
	end


	def list_item_start(list_item, list_type)
		case list_type
		when :BULLET, :LALPHA, :NUMBER, :UALPHA then
			"<li>"
		when :LABEL, :NOTE then
			Array(list_item.label).map do |label|
				"<tr><td>#{to_html label}\n"
			end.join << "</td><td>"
		else
			raise RDoc::Error, "Invalid list type: #{list_type.inspect}"
		end
	end


	def list_end_for(list_type)
		case list_type
		when :BULLET, :LALPHA, :NUMBER, :UALPHA then
			"</li>"
		when :LABEL, :NOTE then
			"</td></tr>"
		else
			raise RDoc::Error, "Invalid list type: #{list_type.inspect}"
		end
	end


	def accept_heading( heading )
		level = [6, heading.level].min
		label = heading.label @code_object

		@res << if @options.output_decoration
			"\n<h#{level} id=\"#{label}\">"
		else
			"\n<h#{level}>"
		end

		@res << to_html(heading.text)
		@res << "</h#{level}>\n"
	end

end # module Sixfish::Patches


