class Food
  attr_reader :gtin_upc, :description, :brand_owner, :ingredients

  def initialize(info_hash)
    @gtin_upc = info_hash[:gtinUpc]
    @description = info_hash[:description]
    @brand_owner = info_hash[:brandOwner]
    @ingredients = info_hash[:ingredients]
  end

end