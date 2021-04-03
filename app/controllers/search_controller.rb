class SearchController < ApplicationController
  def display
    url = "https://api.pubg.com/shards/steam/players"

    resp = Faraday.new(url) do |req|
      req.adapter :net_http_persistent, pool_size: 5 do |http|
        http.idle_timeout = 100
      end
      req.params['filter[playerNames]'] = 'Conkers_Mrc'
      req.headers['Authorization'] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyZDdlZGMxMC0yMDUyLTAxMzctNDU0Ni0wYjk1YTc3YTFhOGMiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTUxNjY2MTA0LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6Ii05MzI4MDE5Ni1iODFkLTQ3ZWUtOWQzZi1kZDFiYjBiZDQ1YWIifQ.qpS40hyaYayx2ceMfsVCZ-_QbCblW8rwXscCLGeSysM'
      req.headers['Accept'] = 'application/vnd.api+json'
      req.headers['User-Agent'] = 'My Team'
    end

    response = resp.get
    json_response = JSON.parse(response.body, symbolize_names: true)
    id_player = json_response[:data][0][:id]

    url_2 = "https://api.pubg.com/shards/steam/players/#{id_player}/seasons/lifetime"

    resp = Faraday.new(url_2) do |req|
      req.adapter :net_http_persistent, pool_size: 5 do |http|
        http.idle_timeout = 100
      end
      req.headers['Authorization'] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyZDdlZGMxMC0yMDUyLTAxMzctNDU0Ni0wYjk1YTc3YTFhOGMiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTUxNjY2MTA0LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6Ii05MzI4MDE5Ni1iODFkLTQ3ZWUtOWQzZi1kZDFiYjBiZDQ1YWIifQ.qpS40hyaYayx2ceMfsVCZ-_QbCblW8rwXscCLGeSysM'
      req.headers['Accept'] = 'application/vnd.api+json'
      req.headers['User-Agent'] = 'My Team'
    end

    @response = resp.get
    @json_resp = JSON.parse(@response.body, symbolize_names: true)

    @stats = @json_resp[:data][:attributes][:gameModeStats].map do |a|
              a[1]
            end
    
    @stats_total = [:kills => 0, :assists => 0, :losses => 0]

    @stats.each do |a|
      @stats_total[0][:assists] += a[:assists]
      @stats_total[0][:kills] += a[:kills]
      @stats_total[0][:losses] += a[:losses]
    end
  end
end