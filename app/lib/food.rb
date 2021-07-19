class Food
  attr_reader :gtin_upc, :brand_owner, :description, :ingredients

  def initialize(args)
    @gtin_upc = args['gtinUpc']
    @brand_owner = args['brandOwner']
    @description = args['description']
    @ingredients = args['ingredients']
  end
end