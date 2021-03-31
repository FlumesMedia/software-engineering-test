require_relative 'consecutive_logins'
require 'test/unit'

class ConsecutiveLoginTest < Test::Unit::TestCase
  def setup
    @obj = ConsecutiveLogin.new
  end

  def test_matching_input
    assert_equal(@obj.static_input_dates, ['2021-03-13 15:13:05', '2021-03-13 23:13:05', '2021-03-16 15:13:05', '2021-03-16 23:13:05',
                                           '2021-03-17 07:13:05', '2021-03-17 15:13:05', '2021-03-17 23:13:05', '2021-03-18 07:13:05', '2021-03-18 15:13:05'])
  end

  def test_matching_output
    assert_equal(@obj.output, [{ start_date: '2021-03-16', end_date: '2021-03-18', length: 3 },
                               { start_date: '2021-03-13', end_date: '2021-03-13', length: 1 }])
  end
end
