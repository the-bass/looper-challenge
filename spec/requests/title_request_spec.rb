require "rails_helper"

RSpec.describe 'Requesting a Title', type: :request do

  context 'With an existent Title ID' do
    let(:title_id) { '101' }

    before { get "/titles/#{title_id}" }

    it 'should respond with an HTTP 200 Status' do
      expect(response.status).to eq(200)
    end

    it 'should respond with the expected body' do
      expect(JSON.parse(response.body)).to eq(
        'data' => {
          'type' => 'title',
          'id' => 101,
          'attributes' => {
            'name' => '12 Strong',
            'platform' => 'itunes',
          },
          'relationships' => {
            'offers' => {
              'data' => [
                {'id' => 101, 'type' => "offer"},
                {'id' => 102, 'type' => "offer"},
                {'id' => 103, 'type' => "offer"},
                {'id' => 104, 'type' => "offer"}
              ]
            }
          }
        }
      )
    end
  end

  context 'With an existent Title ID including its offers' do
    let(:title_id) { '102' }

    before { get "/titles/#{title_id}?include=offers" }

    it 'should respond with an HTTP 200 Status' do
      expect(response.status).to eq(200)
    end

    it 'should respond with the expected body' do
      expect(JSON.parse(response.body)).to eq(
        'data' => {
          'type' => 'title',
          'id' => 102,
          'attributes' => {
            'name' => 'Jurassic World',
            'platform' => 'itunes',
          },
          'relationships' => {
            'offers' => {
              'data' => [
                {'id' => 105, 'type' => "offer"},
                {'id' => 106, 'type' => "offer"}
              ]
            }
          }
        },
        'included' => [
          {
            'type' => 'offer',
            'id' => 105,
            'attributes' => {
              'format' => 'hd',
              'license' => 'buy',
              'price' => 499,
            }
          },
          {
            'type' => 'offer',
            'id' => 106,
            'attributes' => {
              'format' => 'hd',
              'license' => 'buy',
              'price' => 499,
            }
          }
        ]
      )
    end
  end

  context 'With an existent Title ID trying to include an unknown relation' do
    let(:title_id) { '102' }

    before { get "/titles/#{title_id}?include=prices" }

    it 'should respond with an HTTP 400 Status' do
      expect(response.status).to eq(400)
    end

    it 'should respond with the expected body' do
      expect(JSON.parse(response.body)).to eq(
        'errors' => [
          {
            'id' => 'unknown_include',
            'status' => 400
          }
        ]
      )
    end
  end

  context 'With a non-existent Title ID' do
    let(:title_id) { '-1' }

    before { get "/titles/#{title_id}" }

    it 'should respond with an HTTP 404 Status' do
      expect(response.status).to eq(404)
    end

    it 'should respond with the expected body' do
      expect(JSON.parse(response.body)).to eq(
        'errors' => [
          {
            'id' => 'not_found',
            'status' => 404
          }
        ]
      )
    end
  end
end
