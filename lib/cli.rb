require "pry"

class CLI
	attr_reader :command, :printer

	def initialize
		@command = ""
		@printer = MessagePrinter.new
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
		case command
		when load?
			run = Run.new(printer)
			run.load(command[1])
		when help?
			run = Run.new(printer)
			run.help(command[1..-1])
		when queue_count?
			run = Run.new(printer)
			run.queue_count
		when queue_clear?
			run = Run.new(printer)
			run.queue_clear
		when queue_print?
			run = Run.new(printer)
			run.queue_print
		when print_by?
			run = Run.new(printer)
			run.print_by(command[2])
		when save_to?
			run = Run.new(printer)
			run.save_to(command[2])
		when find?
			run = Run.new(printer)
			run.find(command[1], command[2])
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
end