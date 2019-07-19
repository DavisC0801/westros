class HouseSearchService
  def initialize(house)
    @house = format(house.downcase.to_sym)
  end

  def connection
    Faraday.new("https://westeros-as-a-service.herokuapp.com") do |faraday|
      faraday.headers['x_api_key'] = ENV["WESTEROS_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end

  #hardcoding to avoid a second API hit, more extensable to check the API for houses
  def format(house)
    house_ids = {
      stark: 1,
      lannister: 2,
      targaryen: 3,
      tyrell: 4,
      greyjoy: 5,
    }
    house_ids[house]
  end

  def search
    response = connection.get("/api/v1/house/#{@house}")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
