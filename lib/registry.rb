require "pry"

class Registry
	attr_accessor :attendees

	%w(first_name last_name email phone_number street city state zipcode).each do |var|
		define_method "find_all_by_#{var}" do |value|
			attendees.select { |attendee| attendee.send(var).downcase == value.downcase }
		end
	end
end