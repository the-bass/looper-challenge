require 'rails_helper'

RSpec.describe Title, type: :model do
  it 'should store the data in a DATA constant' do
    expect(Title::DATA.length > 0).to eq true
  end
end
