require "csv"

class AttendeeParser
	attr_reader :attendees, :contents

	def open_file(filename)
		@contents = CSV.open(filename, headers: true, header_converters: :symbol)
	end

	def parse_file(filename)
		open_file(filename)
		@attendees = contents.collect { |line| build_attendee(line) }
		@attendees.count
	end

	def parse_queue(queue)
    queue.collect { |line| build_attendee(line) }
    Queue.print
  end

	def build_attendee(row)
		Attendee.new(:first_name => row[:first_name],
								 :last_name => row[:last_name],
								 :email_address => row[:email_address],
								 :phone => row[:phone],
								 :street => row[:street],
								 :city => row[:city],
								 :state => row[:state],
								 :zipcode => row[:zipcode])
	end

end
