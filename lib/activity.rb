class Activity
  attr_reader :name, :participants, :total_cost

  def initialize(name, total_cost)
    @name = name
    @participants = {}
    @total_cost = total_cost
  end

  def add_participant(person_name, person_cost)
    @participants[person_name] = person_cost
  end

  def evaluate_total_cost

  end


end
