require "csv"  # => true
require "pry"

class Queue
  attr_reader :data, :printer  # => nil

  def initialize
    @data = []
    @printer = MessagePrinter.new
  end

  def count
    if data == []
      printer.queue_count_error(data.count)
    else
      printer.queue_count(data.count)
    end
  end

  def add_item(item)
    @data += item
  end

  def clear
    @data = []
    printer.queue_clear(data.count)
  end

  def replace(data)
    clear && add(data)
  end

  def print
    if data == []
      printer.queue_count_error(data.count)
    else
      QueueTablePrinter.new(data).print
    end
  end

  def print_by(criteria)
    if data == []
      printer.queue_count_error(data.count)
    else
      data.sort_by! {|entry| entry.send(criteria.to_sym)}
      print
    end
  end

  def save_to(file)
    if data == []
     printer.queue_count_error(data.count)
    else
    CSV.open(file, "w") do |csv|
      csv << ["first_Name", "last_Name", "Email_Address", "HomePhone", "Street", "City", "State", "Zipcode"]
      data.each do |attendee|
        csv << [attendee.first_name, attendee.last_name, attendee.zipcode, attendee.city, attendee.state, attendee.email, attendee.phone, attendee.street]
        end
      end
    end
  end
end