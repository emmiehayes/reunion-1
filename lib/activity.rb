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

  def participants_who_underpaid
    participants_underpaid = @participants.group_by do |participant|
      participant[1] <= price_per_person
    end
    participants_underpaid[true]
  end

  def participants_who_overpaid
    participants_overpaid = @participants.group_by do |participant|
      participant[1] >= price_per_person
    end
    participants_overpaid[true]
  end

  def calculate_balance
    participants_who_underpaid.map do |participant|
      paid = participant.pop
      balance = (price_per_person - paid).round(2)
      participant.push(balance)
    end
  end

  def calculate_refunds
      participants_who_overpaid.map do |participant|
      paid = participant.pop
      refund = (paid - price_per_person).round(2)
      participant.push(refund)
    end
  end

end
