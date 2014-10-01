require 'csv'
require 'pry'


class Run
	attr_reader :printer,
							:queue,
							:parser,
							:loaded_attendees,
							:criteria

	def initialize
		@printer            = MessagePrinter.new
		@parser           ||= AttendeeParser.new
		@queue            ||= Queue.new
	end

	def load(filename)
		parser.parse_file(filename)
		@loaded_attendees = parser.attendees
		printer.loaded_count(@loaded_attendees)
	end

	def find(attribute, criteria)
		@selected_attendees = @loaded_attendees.select do |attendee|
			attendee.send(attribute.to_sym) == criteria
		end
		queue.add_item(@selected_attendees)
	end

	def queue_commands(attribute,criteria)
		case attribute
		when nil        then puts "Error\nTo see a list of commands type 'help'".light_red
		when 'clear'    then queue.clear
		when 'count'    then queue.count
		when 'print'    then queue.print
		when 'saveto'  then queue.save_to(criteria)
		when 'printby' then queue.print_by(criteria)
		end
	end

end