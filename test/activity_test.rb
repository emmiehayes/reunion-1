require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new('climbing', 50)
    assert_instance_of Activity, activity
  end

  def test_it_has_attributes
    activity = Activity.new('climbing', 50)
    assert_equal "climbing", activity.name
    assert_equal ({}), activity.participants
    assert_equal 50, activity.total_cost
  end

  def test_it_can_add_a_participant
    activity = Activity.new('climbing', 50)
    activity.add_participant('emmie', 25)
    assert_equal 1, activity.participants.count
    assert 'emmie', activity.participants.keys[0]
  end

# An Activity has two costs:
# a base cost
# a cost per participant
# You can evaluate the total cost of an activity

end
