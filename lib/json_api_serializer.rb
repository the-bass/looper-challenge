class JSONAPISerializer

  attr_reader :object

  def initialize(object)
    @object = object
  end

  def data
    data = {
      type: type,
      id: object[:id]
    }

    attributes.each do |attribute|
      data[:attributes] ||= {}
      data[:attributes][attribute] = object[attribute]
    end

    many_relationships.each do |key, type|
      data[:relationships] ||= {}
      data[:relationships][key] = {}
      data[:relationships][key][:data] = relationships_hash(object[key], type)
    end

    data
  end

  def self.serialize(object, includes)
    serializer = new(object)

    hash = {
      data: serializer.data
    }

    includes.each do |type, objects_to_include|
      hash[:included] ||= []
      serializer_class = "#{type.capitalize}Serializer".constantize

      objects_to_include.each do |object_to_include|
        hash[:included] << serializer_class.new(object_to_include).data
      end
    end

    hash
  end

  private

  def relationships_hash(related_object_ids, type)
    data = []

    related_object_ids.each do |object_id|
      data << { id: object_id, type: type }
    end

    data
  end
end
