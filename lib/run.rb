require 'csv'

class Run
	attr_reader :printer, :contents

	def initialize
		@printer = MessagePrinter.new
		@contents = CSV.open './data/event_attendees.csv', headers: true, header_converters: :symbol
	end

	def load(attribute)
	end

	def help(topic)
		case topic
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
	end

	def find(attribute, criteria)
	end

	def queue_count
	end

	def print_queue
	end

	def print_by(attribute)
	end

	def save_to(file)
	end

end