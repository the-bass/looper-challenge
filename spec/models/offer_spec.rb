require 'rails_helper'

RSpec.describe Offer do
  it 'should store the data in a DATA constant' do
    expect(Offer::DATA.length > 0).to eq true
  end
end
