require 'pry'
class Activity
  attr_reader :name, :total_cost, :participants

  def initialize(name, total_cost = 0)
    @name         = name
    @total_cost   = total_cost.to_f
    @participants = {}
  end

  def add_participant(person_name, person_paid)
    @participants[person_name] = person_paid
  end

  def price_per_person
    (@total_cost/@participants.length if @participants.length >= 1).round(2)
  end

  def calculate_participant_debt
    participants_that_owe_money = @participants.group_by do |participant|
      participant[1] <= price_per_person
    end
    participants_that_owe_money[true]
  end

  def calculate_participant_payback
    participants_who_overpaid = @participants.group_by do |participant|
      participant[1] >= price_per_person
    end
    participants_who_overpaid[true]
  end
end
