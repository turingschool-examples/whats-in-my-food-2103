class Food
  attr_reader :total_items,
              :ten_foods

  def initialize(data)
    @total_items = data[:totalHits]
    @ten_foods = # fill this in
    @GTIN_UPC_code
    @description
    @brand_owner
    @ingredients
  end
end
