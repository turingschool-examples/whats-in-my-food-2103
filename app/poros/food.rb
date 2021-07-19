class Food
  attr_reader :total_hits, :foods_hash

  def initialize(search_results)
    @foods_list = search_results[:foods]
    @total_hits = search_results[:totalHits]
  end
end