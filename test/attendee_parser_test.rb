gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/attendee_parser.rb'

class AttendeeParserTest < Minitest::Test
	def it_opens_a_given_csv_file
	end

	def it_parses_the_same_file_it_opened_in_the_method_above
	end

	def it_parses_the_queue
	end
end