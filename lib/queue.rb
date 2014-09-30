require "csv"

class Queue
  attr_reader :data

  def initialize
    @data = []
  end

  def count
    data.count
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

end