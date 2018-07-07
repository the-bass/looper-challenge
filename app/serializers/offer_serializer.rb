require "#{Rails.root}/lib/json_api_serializer" 

class OfferSerializer < JSONAPISerializer

  def type
    'offer'
  end

  def attributes
    %i(format license price)
  end

  def many_relationships
    []
  end
end
