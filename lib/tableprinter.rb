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
    rows << ["#{a.id}".cyan,
             "#{a.regdate}".cyan,
             "#{a.last_name.capitalize}".cyan,
             "#{a.first_name.capitalize}".cyan,
             "#{a.email}".cyan,
             "#{a.zipcode}".cyan,
             "#{a.city.capitalize}".cyan,
             "#{a.state.upcase}".cyan,
             "#{a.street}".cyan,
             "#{a.homephone}".cyan]
    end

    table = Terminal::Table.new :title => "Queue".blink, :headings => ['ID'.green.bold,
                                                                      'REGDATE'.green.bold,
                                                                      'LAST NAME'.green.bold,
                                                                      'FIRST NAME'.green.bold,
                                                                      'EMAIL'.green.bold,
                                                                      'ZIPCODE'.green.bold,
                                                                      'CITY'.green.bold,
                                                                      'STATE'.green.bold,
                                                                      'ADDRESS'.green.bold,
                                                                      'PHONE'.green.bold],
                                                                      :rows => rows
    puts table
  end

end