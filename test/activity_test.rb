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

  def test_it_can_evaluate_cost_with_even_split
    activity = Activity.new('climbing', 50)
    activity.add_participant('emmie', 25)
    activity.add_participant('margo', 25)
    assert_equal 2, activity.participants.length
    assert_equal 50, activity.total_cost
    assert_equal 25, activity.price_per_person
  end

  def test_it_can_evaluate_total_cost_with_odd_split
    activity = Activity.new('climbing', 50)
    activity.add_participant('emmie', 25)
    activity.add_participant('margo', 25)
    activity.add_participant('alex', 10)
    assert_equal 3, activity.participants.length
    assert_equal 50, activity.total_cost
    assert_equal 16.67, activity.price_per_person
  end

  def test_it_can_calculate_owed_for_overpaying_participant
    activity = Activity.new('climbing', 50)
    activity.add_participant('emmie', 25)
    activity.add_participant('margo', 25)
    activity.add_participant('alex', 10)
    assert_equal [["alex", 10]], activity.calculate_participant_debt

  end

  def test_it_can_calcualte_owes_for_underpaying_participant
    activity = Activity.new('climbing', 50)
    activity.add_participant('emmie', 25)
    activity.add_participant('margo', 25)
    activity.add_participant('alex', 10)
    assert_equal [["emmie", 25], ["margo", 25]], activity.calculate_participant_payback
  end
end
