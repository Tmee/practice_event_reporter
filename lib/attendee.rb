class Attendee
	attr_accessor :first_name, :last_name, :zipcode, :city,
								:state, :phone, :email, :street

	def initialize(row)
		@first_name = row[:first_name]
		@last_name = row[:last_name]
		@zipcode = row[:zipcode]
		@city = row[:city]
		@state = row[:state]
		@phone = row[:phone]
		@email = row[:email]
		@street = row[:street]
	end

	
end