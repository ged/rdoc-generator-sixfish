# -*- ruby -*-

# SimpleCov test coverage reporting; enable this using the :coverage rake task
if ENV['COVERAGE']
	$stderr.puts "\n\n>>> Enabling coverage report.\n\n"
	require 'simplecov'
	SimpleCov.start do
		add_filter 'spec'
		add_group "Needing tests" do |file|
			file.covered_percent < 90
		end
	end
end


require 'loggability'
require 'loggability/spechelpers'

require 'rspec'
require 'sixfish'

Loggability.format_with( :color ) if $stdout.tty?


### RSpec helper functions.
module Sixfish::SpecHelpers
end


### Mock with RSpec
RSpec.configure do |config|
	config.mock_with( :rspec ) do |mock|
		mock.syntax = :expect
	end

	config.disable_monkey_patching!
	config.example_status_persistence_file_path = "spec/.status"
	config.filter_run :focus
	config.filter_run_when_matching :focus
	config.order = :random
	config.profile_examples = 5
	config.run_all_when_everything_filtered = true
	config.shared_context_metadata_behavior = :apply_to_host_groups
	# config.warnings = true

	config.include( Loggability::SpecHelpers )
	config.include( Sixfish::SpecHelpers )
end

# vim: set nosta noet ts=4 sw=4:

