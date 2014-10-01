require 'csv'


class Run
	attr_reader :printer, 
							:queue,
							:parser,
							:loaded_attendees

	def initialize
		@printer = MessagePrinter.new
		@parser ||= AttendeeParser.new
		@queue ||= Queue.new
	end

	def load(filename)
		parser.parse_file(filename)
		@loaded_attendees = parser.attendees
		printer.loaded_count(@loaded_attendees)
	end

	def find(attribute, criteria)
		selected_attendees = @loaded_attendees.select do |attendee| 
			attendee.send(attribute.to_sym) == criteria
		end
		queue.add_item(selected_attendees)
	end

	def queue_commands(attribute,criteria)
		case attribute
		when 'clear'    then @queue = []
		when 'count'    then queue_count
		when 'print'    then queue_print
		when 'save to'  then queue_save_to(criteria)
		when 'print by' then queue_print_by(criteria)
		end
	end

	def queue_count
		queue.count
	end

	def queue_print
		output = []
		queue.data.each do |attendee|
			output << {:first_name => attendee.first_name, :last_name => attendee.last_name, :zipcode => attendee.zipcode, :city => attendee.city, :state => attendee.state, :homephone => attendee.phone, :street => attendee.street}
		end
		puts "#{output}"
	end

	def queue_print_by(attribute)

	end

	def queue_save_to(file)
		CSV.open(file, "w") do |csv|
			csv << ["first_Name", "last_Name", "Email_Address", "HomePhone", "Street", "City", "State", "Zipcode"]
			queue.data.each do |attendee|
				csv << [attendee.first_name, attendee.last_name, attendee.zipcode, attendee.city, attendee.state, attendee.email, attendee.phone, attendee.street]
		  end
  	end
	end
end