require "csv"  # => true
require "pry"

class Queue
  attr_reader :data  # => nil

  def initialize
    @data = []
  end

  def count
    if data == []
      puts "need to search for something first"
    else
      puts "Queue currently has #{@data.count} attendees."
    end
  end

  def add_item(item)
    @data += item
  end

  def clear
    @data = []
    puts "Queue currently has #{@data.count} attendees."
  end

  def replace(data)
    clear && add(data)
  end

  def print
    if data == []
      puts "you need to search first, queue is empty!"
    else
      QueueTablePrinter.new(data).print
    end
  end

  def print_by(criteria)
    if data == []
      puts "you need to search for something first, the queue is empty"
    else
      data.sort_by! {|entry| entry.send(criteria.to_sym)}
      print
    end
  end

  def save_to(file)
    CSV.open(file, "w") do |csv|
      csv << ["first_Name", "last_Name", "Email_Address", "HomePhone", "Street", "City", "State", "Zipcode"]
      data.each do |attendee|
        csv << [attendee.first_name, attendee.last_name, attendee.zipcode, attendee.city, attendee.state, attendee.email, attendee.phone, attendee.street]
      end
    end
  end
end