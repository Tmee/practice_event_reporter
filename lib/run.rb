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

	def queue_clear
		queue.clear
	end

	def find(attribute, criteria)
		selected_attendees = @loaded_attendees.select do |attendee| 
			attendee.send(attribute.to_sym) == criteria
		end
		queue.add_item(selected_attendees)
	end

	def queue_count
		puts queue.count
	end

	def print_queue
		queue.print
	end

	def print_by(attribute)
	end

	def save_to(file)
	end
end