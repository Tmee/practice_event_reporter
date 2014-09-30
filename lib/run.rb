require 'csv'

class Run
	attr_reader :printer

	def initialize
		@printer = MessagePrinter.new
	end

	def parser
		@parser ||= AttendeeParser.new
	end

	def queue
		@queue ||= Queue.new
	end

	def queue
		@queue ||= Queue.new
	end

	def load(filename)
		parser.parse_file(filename)
		@loaded_attendees = parser.attendees
		registry.attendees = parser.attendees
		printer.loaded_count(@loaded_attendees)
	end

	def help(topic)
		case
		when topic[0] == 'load'
			printer.help_load
		when topic[0] == 'queue' && topic[1] == 'clear'
			printer.help_queue_clear
		when topic[0] == 'queue' && topic[1] == 'count'
			printer.help_queue_count
		when topic[0] == 'print' && topic[1] == 'queue'
			printer.help_print_queue
		when topic[0].downcase == 'find'
			printer.help_find
		when topic[0] == 'print' && topic[1] == 'by'
			printer.help_print_by
		when topic[0] == 'save' && topic[1] == 'to'
			printer.help_save_to
		end
	end

	def queue_clear
		queue.clear
	end

	def find(attribute, criteria)
		case attribute
		when "first_name"
			@queue.add_item(@loaded_attendees.select { |a| a.first_name.downcase == criteria })
		end
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