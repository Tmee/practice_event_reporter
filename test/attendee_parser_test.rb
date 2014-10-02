gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/attendee_parser'
require_relative '../lib/attendee'


class AttendeeParserTest < Minitest::Test
	def test_it_opens_a_given_csv_file
		parser = AttendeeParser.new
		parser.open_file("data/test_data.csv")
		assert parser.contents
	end

	def test_it_parses_a_file
		parser = AttendeeParser.new
		assert_equal 4, parser.parse_file("data/test_data.csv")
	end

	def test_it_builds_attendee
		parser = AttendeeParser.new
		attendee = parser.build_attendee({:first_name => "Billy"})
		assert_equal Attendee, attendee.class
	end
end