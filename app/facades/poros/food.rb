class Poros::Food
  attr_reader :gtin_upc ,:description, :brand_owner, :ingredients

  def initialize(attrs)
    @gtin_upc = attrs[:gtin_upc]
    @description = attrs[:description]
    @brand_owner = attrs[:brand_owner]
    @ingredients = attrs[:ingredients]
  end
end


# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients
