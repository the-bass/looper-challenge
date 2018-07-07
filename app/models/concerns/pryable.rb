module Pryable
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_id(id)
      id = id.to_i if id.instance_of?(String)

      self::DATA.each do |data_hash|
        return data_hash if data_hash[:id] == id
      end

      nil
    end
  end
end
