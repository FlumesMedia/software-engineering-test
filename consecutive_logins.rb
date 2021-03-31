require 'date'
require 'active_support/time'
require 'pp'

class ConsecutiveLogin
  def initialize(*inputs)
    @input_dates = (inputs.presence || static_input_dates).compact.uniq
    @result = []
  end

  # retuen result array of hash
  # with associated keys start_date, end_date, length
  # sorted by consecutive logins, sorted by descending length
  def output
    consecutive_dates.each do |dates|
      @result << {
        start_date: dates.first.to_s,
        end_date: dates.last.to_s,
        length: dates.length
      }
    end

    @result.sort_by { |h| h[:length] }.reverse
  end

  # default input
  def static_input_dates
    ['2021-03-13 15:13:05', '2021-03-13 23:13:05', '2021-03-16 15:13:05', '2021-03-16 23:13:05',
     '2021-03-17 07:13:05', '2021-03-17 15:13:05', '2021-03-17 23:13:05', '2021-03-18 07:13:05', '2021-03-18 15:13:05']
  end

  private

  # return sorted and parsed input array
  def sorting_dates
    @input_dates.sort.map { |login_time| Date.parse(login_time) }.uniq
  rescue ArgumentError => e
    puts "Invalid date #{e.full_message}"
    exit(true)
  end

  # return consecutive logins dates array of array
  def consecutive_dates
    prev = sorting_dates.first
    @consecutive_dates =
      sorting_dates.slice_before do |date|
        prev2 = prev
        prev = date
        prev2 + 1.day != date
      end
  end
end
