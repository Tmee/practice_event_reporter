require "pry"  # => true
# require 'colorize'

class CLI
	attr_reader :command,             # => :command
							:printer,                   # => :printer
							:run,                       # => :run
							:attribute,                 # => :attribute
							:criteria                   # => nil

	def initialize
		@command   = ""
		@attribute = ""
		@criteria  = ""
		@printer   = MessagePrinter.new
		@run       = Run.new
	end

	def start
		printer.is_initialized
		until finished?
			printer.get_command
			@command   = gets.strip.downcase.split
			@attribute = command[1]
			if command.length != 1
				@criteria  = command[2..-1].join(' ')
		 	end
		 	process_initial_commands
		end
		printer.ending
	end

	def process_initial_commands
		case @command[0]
		when 'load'  then run.load(attribute ||= default_filename)
		when 'help'  then help(@attribute, @criteria)
		when 'queue' then run.queue_commands(@attribute, @criteria)
		when 'find'  then run.find(@attribute, criteria)
		when 'q'     then finished?
		when 'quit'  then finished?
		when 'save'	 then run.queue_save_to("data/new_file.csv")
		else
			printer.invalid_command
		end
	end

	def help(attribute, criteria)
		case attribute
		when nil     then printer.list_help_commands
		when 'load'  then printer.help_load_message
		when 'find'  then printer.help_find_message
		when 'queue' then queue_help(@criteria)
		else
			puts "Sorry, not a command!!\nType 'help' for a list of all commands".light_red
		end
	end

	def queue_help(criteria)
		case criteria
		when 'count'    then printer.queue_count_help
		when 'clear'    then printer.queue_clear_help
		when 'print'    then printer.queue_print_help
		when 'save to'  then printer.queue_save_to_help
		when 'print by' then printer.queue_print_by_help
		end
	end

	def finished?
		command.length == 1 &&
		command[0] == 'q' || command[0] == 'quit'
	end

	def default_filename
    './data/event_attendees.csv'
  end
end
