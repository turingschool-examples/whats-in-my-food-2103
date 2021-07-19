class Foods
  attr_reader :foods, :total_hits

  def initialize(foods)
    @foods = foods['foods'].map do |food|
      Food.new(food)
    end
    @total_hits = foods['totalHits']
  end
end