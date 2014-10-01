require 'terminal-table'
require 'pry'

class QueueTablePrinter
attr_reader :data

  def initialize(data)
    @data = data
  end

  def print
    rows = []
    @data.each do |a|
    rows << ["#{a.id}",
             "#{a.regdate}",
             "#{a.last_name.capitalize}",
             "#{a.first_name.capitalize}",
             "#{a.email}",
             "#{a.zipcode}",
             "#{a.city.capitalize}",
             "#{a.state.upcase}",
             "#{a.street}",
             "#{a.homephone}"]
    end
    # binding.pry
    table = Terminal::Table.new :title => "Queue", :headings => ['ID'.bold,
                                              'REGDATE'.bold,
                                              'LAST NAME'.bold,
                                              'FIRST NAME'.bold,
                                              'EMAIL'.bold,
                                              'ZIPCODE'.bold,
                                              'CITY'.bold,
                                              'STATE'.bold,
                                              'ADDRESS'.bold,
                                              'PHONE'.bold],
                                              :rows => rows
    puts table
  end

end