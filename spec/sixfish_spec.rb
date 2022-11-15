# -*- ruby -*-
#encoding: utf-8

require 'helpers'
require 'rspec'
require 'sixfish'

describe Sixfish do

	describe "version methods" do

		it "returns a version string if asked" do
			expect( described_class.version_string ).to match( /\w+ [\d.]+/ )
		end

	end

end

