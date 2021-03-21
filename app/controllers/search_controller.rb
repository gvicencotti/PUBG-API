class SearchController < ApplicationController
  def display

    url = "https://api.pubg.com/shards/steam/players?filter[playerNames]=Conkers_Mrc"
    conn = Faraday.new
    conn.token_auth( 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOi
      IyZDdlZGMxMC0yMDUyLTAxMzctNDU0Ni0wYjk1YTc3YTFhOGMiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTUxNjY2MTA0LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6Ii05MzI4MDE5Ni1iODFkLTQ3ZWUtOWQzZi1kZDFiYjBiZDQ1YWIifQ.qpS40hyaYayx2ceMfsVCZ-_QbCblW8rwXscCLGeSysM')
    @response = conn.get(url, {}, {'accept' => 'application/vnd.api+json'})
    
  end
end