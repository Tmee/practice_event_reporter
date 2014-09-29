class MessagePrinter

	def is_initialized
		puts "Event Reporter is initialized"
	end

	def ending
		puts "Good Bye"
	end

	def invalid_command
		puts "Invalid command"
	end

	def help_load
		puts "This command loads a specific data field"
	end

	def help_queue_clear
		puts "This command empties out the queue"
	end

	def help_print_queue
		puts "This command prints the number of attendees in the queue"
	end

	def help_save_to
		puts "This command saves the current queue at a specified location"
	end

	def help_find
		puts "This command finds a specific attribute"
	end

	def help_print_by
		puts "This command prints a specific attribute"
	end

	def help_queue_count
		puts "This command counts all the items in the queue"
	end

	def loaded_count(attendees)
		puts "Loaded #{attendees.count} attendees"
	end

end