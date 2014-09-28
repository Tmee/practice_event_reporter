class CLI
	attr_reader :command, :printer

	def initialize
		@command = []
		@printer = MessagePrinter.new
	end

	def start
		printer.is_initialized
		until finished?
			@command = gets.strip.downcase.join(" ")
			process_initial_commands
		end
		printer.ending
	end

	private

	def process_initial_commands
		case command[0]
		when 
			
		end

	def finished?
		@command == 'q' || @command == 'quit'
	end

end