# -*- ruby -*-
# frozen_string_literal: true

require 'rdoc/task'
require 'rake/deveiate'
require 'rake/clean'

$LOAD_PATH.unshift('lib')
require 'sixfish'

SIXFISH_CSS = 'data/rdoc-generator-sixfish/css/sixfish.css'
SIXFISH_MIN_JS = 'data/rdoc-generator-sixfish/js/sixfish.min.js'

SIXFISH_SCSS = 'ui/sixfish.scss'
SIXFISH_JS = 'ui/sixfish.js'

task :gemspec => :assets
task :gem => :assets


tasks = Rake::DevEiate.setup( 'rdoc-generator-sixfish' ) do |project|
	project.version_from = 'lib/sixfish.rb'
	project.publish_to = 'deveiate:/usr/local/www/public/code'
	project.rdoc_generator = :sixfish
end


CLEAN.add( '*.gem' )

Rake::Task['docs'].clear
task :docs => :assets

RDoc::Task.new( 'docs' ) do |rdoc|
	rdoc.main = tasks.readme_file.to_s
	rdoc.rdoc_files = tasks.rdoc_files
	rdoc.generator = :sixfish
	rdoc.title = tasks.title
	rdoc.rdoc_dir = Rake::DevEiate::DOCS_DIR.to_s
end


desc "Build page assets"
task :assets => [ SIXFISH_CSS, SIXFISH_MIN_JS ]

file SIXFISH_CSS
task SIXFISH_CSS => SIXFISH_SCSS do |task|
	sh 'yarn', 'parcel', 'build', task.prerequisites.first,
		'--dist-dir', File.dirname(task.name)
end
CLEAN.add( SIXFISH_CSS.to_s )


file SIXFISH_MIN_JS
task SIXFISH_MIN_JS => SIXFISH_JS do |task|
	sh 'yarn', 'parcel', 'build', task.prerequisites.first,
		'--dist-dir', File.dirname(task.name)
end
CLEAN.add( SIXFISH_MIN_JS.to_s )

task :setup do
	sh 'yarn'
end