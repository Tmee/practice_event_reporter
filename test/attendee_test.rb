gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/attendee_parser'
require_relative '../lib/attendee'

class AttendeeTest < Minitest::Test
  def test_it_initializes_with_all_the_attendee_keys
    parser = AttendeeParser.new
    attendee = parser.build_attendee({:first_name => "Billy", :last_name => "Sanchez", :id => "01", :regdate => "00",
      :zipcode => "19083", :city => "Philadelphia", :state => "PA", :homephone => "6107158819",
      :email_address => "wordball@hotmail.com", :street => "Bad Street Lane"})
    assert_equal "billy", attendee.first_name
    assert_equal "sanchez", attendee.last_name
    assert_equal "01", attendee.id
    assert_equal "00", attendee.regdate
    assert_equal "19083", attendee.zipcode
    assert_equal "philadelphia", attendee.city
    assert_equal "pa", attendee.state
    assert_equal "(610) 715 - 8819", attendee.homephone
    assert_equal "wordball@hotmail.com", attendee.email_address
    assert_equal "Bad Street Lane", attendee.street
  end
end