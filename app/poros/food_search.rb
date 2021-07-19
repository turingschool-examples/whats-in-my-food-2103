class FoodSearch
  attr_reader :total_hits, :foods_hash

  def initialize(search_results)
    @total_hits = search_results[:totalHits]
    @foods_hash = search_results[:foods]
end