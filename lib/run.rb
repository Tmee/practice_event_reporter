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
		puts queue.count
	end

	def queue_print
		puts queue
	end

	def queue_print_by(attribute)

	end

	def queue_save_to(file)

	end
end