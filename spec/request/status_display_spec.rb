require 'rails_helper'

describe 'stats display' do
    context 'GET stats' do
      it 'should render stats information' do
        get '/api.pubg.com/shards/steam/players?filter[playerNames]=Conkers_Mrc'

        json_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(200)
      end
    end
end