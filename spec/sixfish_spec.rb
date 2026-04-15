# -*- ruby -*-

require_relative 'helpers'

require 'rspec'
require 'sixfish'

RSpec.describe( Sixfish ) do

	describe "version methods" do

		it "returns a version string if asked" do
			expect( described_class.version_string ).to match( /\w+ [\d.]+/ )
		end

	end

end

