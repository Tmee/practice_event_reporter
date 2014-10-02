require "pry"  # => true

class CLI
	attr_reader :command,  # => :command
							:printer,        # => :printer
							:run,            # => :run
							:attribute,      # => :attribute
							:criteria,       # => :criteria
							:first_command   # => nil

	def initialize
		@command       = ""
		@first_command = ""
		@attribute     = ""
		@criteria      = ""
		@printer       = MessagePrinter.new
		@run           = Run.new
	end

	def start
		printer.is_initialized
		until finished?
			printer.get_command
			split_command_into_parts
		 	process_initial_commands
		end
		printer.ending
	end

	def split_command_into_parts
		@command       = gets.strip.downcase.split
		@first_command = command[0]
		if first_command == "find"
			@attribute = command[1]
			@criteria = command[2..-1].join(' ')
		elsif command.length == 4
 		  @attribute = command[1..2].join('')
			@criteria  = command[3]
 		elsif command.length == 3
 			@attribute = command[1]
			@criteria  = command[2..-1].join(' ')
		elsif command.length <=2
			@attribute = command[1]
		else
			@attribute = command[1]
			@criteria = command[2..-1].join(' ')
		end
	end

	def process_initial_commands
		case @first_command
		when 'load'  
			if attribute == nil
				run.load(default_filename)
			else
				run.load(attribute)
			end
		when 'help'  then help(@attribute, @criteria)
		when 'queue' then run.queue_commands(@attribute, @criteria)
		when 'find'  then run.find(@attribute, @criteria)
		when 'q'     then finished?
		when 'quit'  then finished?
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
		first_command == 'q' || first_command == 'quit'
	end

	def default_filename
    './data/event_attendees.csv'
  end
end
