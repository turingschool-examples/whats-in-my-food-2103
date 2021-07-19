class Foods
  attr_reader :total_hits

  def initialize(foods)
    @foods = foods['foods'].map do |food|
      Food.new(food)
    end
    @total_hits = foods['totalHits']
  end

  def foods(num = 10)
    @foods.first(num)
  end
end