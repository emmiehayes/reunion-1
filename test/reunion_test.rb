require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new('Smith Rock')
    assert_instance_of Reunion, reunion
  end

  def test_it_has_attributes
    reunion = Reunion.new('Smith Rock')
    assert_equal 'Smith Rock', reunion.location
    assert_equal [], reunion.activities
  end

  def test_it_can_add_an_activity
    reunion = Reunion.new('Smith Rock')
    activity = Activity.new('Climbing', 50)
    reunion.add_activity(activity)
    assert reunion.activities.include?(activity)
  end

  def test_it_can_calculate_total_cost_of_reunion
    reunion = Reunion.new('Smith Rock')
    activity_1 = Activity.new('Climbing', 50)
    activity_2 = Activity.new('Hiking', 25)
    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    assert_equal 75, reunion.total_cost
  end

  def test_it_can_total_all_balances_owed
    reunion = Reunion.new('Smith Rock')
    activity_1 = Activity.new('Climbing', 50)
      activity_1.add_participant('emmie', 25)
      activity_1.add_participant('margo', 25)
      activity_1.add_participant('alex', 10)
    activity_2 = Activity.new('Hiking', 25)
      reunion.add_activity(activity_1)
      reunion.add_activity(activity_2)
    assert_equal ({}), reunion.breakdown
  end

end
