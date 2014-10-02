require_relative 'clean'
# this is to see a change
class Attendee
	attr_reader :first_name, :last_name,            
							:zipcode, :city,
							:state, :phone,
							:email, :street,
							:cleaner, :homephone, 
							:id, :regdate

	def initialize(row)
		@cleaner    = Clean.new
		@id   			= cleaner.clean_id(row[:id])
		@regdate   	= cleaner.clean_regdate(row[:regdate])
		@first_name = cleaner.clean_first_name(row[:first_name])
		@last_name  = cleaner.clean_last_name(row[:last_name])
		@zipcode    = cleaner.clean_zipcode(row[:zipcode])
		@city       = cleaner.clean_city(row[:city])
		@state      = cleaner.clean_state(row[:state])
		@phone      = cleaner.clean_phone(row[:phone])
		@email      = row[:email_address]
		@street     = row[:street]
		@homephone  = cleaner.clean_phone(row[:homephone])
	end

end