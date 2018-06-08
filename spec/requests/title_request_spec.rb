require "rails_helper"

RSpec.describe 'Requesting a Title', type: :request do
  context 'With a valid Title ID' do
    let(:title_id) { '101' }

    it 'should respond with an HTTP 200 Status' do
      get "/titles/#{title_id}"
      expect(response).to be_successful
    end
  end
end
