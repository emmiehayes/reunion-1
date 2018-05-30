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
end
