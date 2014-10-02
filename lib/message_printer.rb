require 'colorize'
class MessagePrinter

	def is_initialized
		clear_screen
				puts "███████╗██╗   ██╗███████╗███╗   ██╗████████╗    ██████╗ ███████╗██████╗  ██████╗ ██████╗ ████████╗███████╗██████╗
██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝    ██╔══██╗██╔════╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
█████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║       ██████╔╝█████╗  ██████╔╝██║   ██║██████╔╝   ██║   █████╗  ██████╔╝
██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║       ██╔══██╗██╔══╝  ██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══╝  ██╔══██╗
███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║       ██║  ██║███████╗██║     ╚██████╔╝██║  ██║   ██║   ███████╗██║  ██║
╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚═╝  ╚═╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝".light_black

	end

	def ending
		clear_screen
		puts ["███████╗██╗   ██╗███████╗███╗   ██╗████████╗    ██████╗ ███████╗██████╗  ██████╗ ██████╗ ████████╗███████╗██████╗
██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝    ██╔══██╗██╔════╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
█████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║       ██████╔╝█████╗  ██████╔╝██║   ██║██████╔╝   ██║   █████╗  ██████╔╝
██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║       ██╔══██╗██╔══╝  ██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══╝  ██╔══██╗
███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║       ██║  ██║███████╗██║     ╚██████╔╝██║  ██║   ██║   ███████╗██║  ██║
╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚═╝  ╚═╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝".light_red]
		puts ["████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ████████╗███████╗██████╗
╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║   ██║   █████╗  ██║  ██║
   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║   ██║   ██╔══╝  ██║  ██║
   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║   ██║   ███████╗██████╔╝
   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝
                                                                                  ".light_red]
	end

	def invalid_command
		puts "***** Invalid command *****".rjust(34).light_red
		puts "To see a list of valid commands type 'help'".light_red
	end

	def list_help_commands
		clear_screen
		puts "Welcome to Event Reporter!".rjust(40).light_green
		puts "Below is a list of all commands availabe in Event Reporter:\n".light_green
		puts "load\nfind\nqueue count\nqueue clear\nqueue print\nqueue save to\nqueue print by\n".light_green
		puts "To learn more about what each one does, use the following prompt:\n".light_green
		print "Enter Command:   ".light_green
		puts "help <command>\n\n".yellow
	end

	def help_load_message
		clear_screen
		puts "Command Information:   Load\n\n".light_green
		puts "This command allows the user to load any .csv file into the Event Reporter.\n".light_green
		print "Enter Command:   ".light_green
		puts "load <filename>\n\n".yellow
	end

	def help_find_message
		clear_screen
		puts "Command Information:   Find\n\n".light_green
		puts "This command allows the user to look-up data in the loaded file by any key in the header.\nThe user can also select a specific value under the header row\n\n".light_green
		print "Enter Command:   ".light_green
		puts "find <key> <value> \n\n".yellow

	end

	def queue_count_help
		clear_screen
		puts "Command Information:   Queue Count\n\n".light_green
		puts "This command counts all the items in the queue\n\n".light_green
		print "Enter Command   :".light_green
		puts "queue count\n\n".yellow
	end

	def queue_clear_help
		clear_screen
		puts "Command Information:   Queue Clear\n\n".light_green
		puts "This command will emtpy out all information in the current queue\n\n".light_green
		print"Enter Command:   ".light_green
		puts "queue clear\n\n".yellow
	end

	def queue_print_help
		clear_screen
		puts "Command Information:   Queue Print\n\n".light_green
		puts "This command will print out a table of all attendees currently in the queue\n\n".light_green
		print "Enter Command:   ".light_green
		puts "queue print\n\n".yellow
	end

	def queue_save_to_help
		clear_screen
		puts "Command Information:   Queue Save To\n\n".light_green
		puts "This command will save the current queue to a specified location\n\n".light_green
		print "Enter Command:   ".light_green
		puts "queue save to <filename>\n\n".yellow
	end

	def queue_print_by_help
		clear_screen
		puts "Command Information:   Queue Print By\n\n".light_green
		puts "This command will print a table of attendees noted by a specific attribute.\n\n".light_green
		print "Enter Command:   ".light_green
		puts  "queue print by <criteria>\n\n".yellow
	end

	def get_command
		print "Enter Command:   ".light_cyan
	end

	def loaded_count(attendees)
		puts "Loaded #{attendees.count} attendees".green
	end

	def queue_count_error(count)
		 puts "Queue is empty, count is #{count}. Please, search first to add data into your queue.\n".light_red + ":: Type".light_green.rjust(39) + " 'help' ".light_red.rjust(22) + "for a list of commands ::".light_green.rjust(38)
	end

	def load_file
		puts "No file loaded.  Please load a file into Event Reporter or type 'load' to use the default file\n".light_red + ":: Type".light_green.rjust(39) + " 'help' ".light_red.rjust(22) + "for a list of commands ::".light_green.rjust(38)
	end

	def queue_clear(count)
		puts "Queue currently has been cleared.\n".light_red + "#{count} attendees.".light_red.rjust(36)
	end

	def queue_count(count)
		puts "Your queue currently has #{count} attendees.".light_red
	end

	def clear_screen
    print "\e[2J\e[f"
  end

end