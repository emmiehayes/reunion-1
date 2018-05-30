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

  def test_it_can_find_participants_who_underpaid
    activity = Activity.new('climbing', 50)
    activity.add_participant('emmie', 25)
    activity.add_participant('margo', 25)
    activity.add_participant('alex', 10)
    assert_equal [["alex", 10]], activity.participants_who_underpaid
  end

  def test_it_can_find_participants_who_overpaid
    activity = Activity.new('climbing', 50)
    activity.add_participant('emmie', 25)
    activity.add_participant('margo', 25)
    activity.add_participant('alex', 10)
    assert_equal [["emmie", 25], ["margo", 25]], activity.participants_who_overpaid
  end

  def test_it_can_calculate_money_due_from_underpaying_participants
    activity = Activity.new('climbing', 50)
    activity.add_participant('emmie', 25)
    activity.add_participant('margo', 25)
    activity.add_participant('alex', 10)
    assert_equal [["alex", 6.67]], activity.calculate_balance
  end

  def test_it_can_calculate_payback_for_overpaying_participants
    activity = Activity.new('climbing', 50)
    activity.add_participant('emmie', 25)
    activity.add_participant('margo', 25)
    activity.add_participant('alex', 10)
    assert_equal [["emmie", 8.33], ["margo", 8.33]], activity.calculate_refunds
  end


end
