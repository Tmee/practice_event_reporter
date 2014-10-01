require "csv"  # => true

class Queue
  attr_reader :data  # => nil

  def initialize
    @data = []
  end

  def count
    puts "Queue currently has #{@data.count} attendees."
  end

  def add_item(item)
    @data += item
  end

  def clear
    @data.clear
  end

  def replace(data)
    clear && add(data)
  end

  def print(data)
    QueueTablePrinter.new(data).print
  end

  def print_by(attribute)
    QueueTablePrinter.new(data).print
  end

  def save_to(file)
    CSV.open(file, "w") do |csv|
      csv << ["first_Name", "last_Name", "Email_Address", "HomePhone", "Street", "City", "State", "Zipcode"]
      @data.each do |attendee|
        csv << [attendee.first_name, attendee.last_name, attendee.zipcode, attendee.city, attendee.state, attendee.email, attendee.phone, attendee.street]
      end
    end
  end
end