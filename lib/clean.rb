class Clean

	def clean_first_name(first_name)
		first_name.strip.downcase if first_name
	end

	def clean_last_name(last_name)
		last_name.strip.downcase if last_name
	end

	def clean_phone(phone_number)
		phone_number.to_s.scan(/\d/).join.rjust(10, "0")[0..9] if phone_number
	end

	def clean_city(city)
		# city.to_s.strip.split.map(&:downcase)*' '
		city.downcase if city
	end

	def clean_state(state)
		state.to_s.strip.upcase[0..1] if state
	end

	def clean_zipcode(zipcode)
		zipcode.to_s.rjust(5, "0")[0..4] if zipcode
	end
	
end