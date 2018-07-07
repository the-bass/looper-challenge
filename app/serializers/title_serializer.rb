require "#{Rails.root}/lib/json_api_serializer" 

class TitleSerializer < JSONAPISerializer

  def type
    'title'
  end

  def attributes
    %i(name platform)
  end

  def many_relationships
    [
      [:offers, :offer]
    ]
  end
end
