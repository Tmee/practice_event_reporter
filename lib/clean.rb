class Clean

	def clean_first_name(first_name)
		first_name.strip.downcase if first_name
	end

	def clean_last_name(last_name)
		last_name.strip.downcase if last_name
	end

	def clean_phone(phone_number)
		number = phone_number.to_s.scan(/\d/)
		if number.nil? || number.length != 10
			"000-000-0000"
		else
		"(#{number[0..2].join})" + " #{number[3..5].join} " + "- #{number[6..9].join}"
		end
	end

	def clean_state(state)
		state.to_s.strip.downcase[0..1] if state
	end

	def clean_city(city)
		city.to_s.strip.downcase[0..-1] if city
	end

	def clean_zipcode(zipcode)
		zipcode.to_s.rjust(5, "0")[0..4] if zipcode
	end

	def clean_id(id)
    id.to_s
  end

  def clean_regdate(regdate)
    regdate.to_s
  end
	
end