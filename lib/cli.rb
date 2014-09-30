require "pry"

class CLI
	attr_reader :command, :printer, :run

	def initialize
		@command = ""
		@printer = MessagePrinter.new
		@run = Run.new
	end

	def start
		printer.is_initialized
		until finished?
			@command = gets.chomp.downcase.split(" ")
			process_initial_commands
		end
		printer.ending
	end

	def process_initial_commands
		case 
		when load?
			run.load(command[1] ||= default_filename)
		when help?
			run.help(command[1..-1])
		when queue_count?
			run.queue_count
		when queue_clear?
			run.queue_clear
		when queue_print?
			run.queue_print
		when print_by?
			run.print_by(command[2])
		when save_to?
			run.save_to(command[2])
		when find?
			run.find(command[1], command[2..-1].join())
		when finished?
		else
			printer.invalid_command
		end
	end

	def finished?
		command[0] == 'q' || command[0] == 'quit'
	end

	def load?
		command[0] == 'load'
	end

	def help?
		command[0] == 'help'
	end

	def queue_count?
		command[0] == 'queue' && command[1] == 'count'
	end

	def queue_clear?
		command[0] == 'queue' && command[1] == 'clear'
	end

	def queue_print?
		command[0] == 'queue' && command[1] == 'print'
	end

	def print_by?
		command[0] == 'print' && command[1] == 'by'
	end

	def save_to?
		command[0] == 'save' && command[1] == 'to'
	end

	def find?
		command[0] == 'find'
	end

	def default_filename
    './data/event_attendees.csv'
  end

end