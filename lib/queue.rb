require "csv"

class Queue
  attr_reader :data

  def initialize
    @data = []
  end

  def count
    puts data.count
  end

  def add_item(item)
    @data += item
  end

  def clear
    @data.clear
  end

  def print
    puts "#{@data}"
  end

  def replace(data)
    clear && add(data)
  end

end