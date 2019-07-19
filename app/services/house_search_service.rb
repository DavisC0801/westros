class HouseSearchService
  def initialize(house)
    @house = house.downcase
  end

  def connection
    Faraday.new("https://westerosapi.herokuapp.com")
  end

  def search
    response = connection.get("/api/v1/house/#{@house}", api_key: ENV["WESTEROS_API_KEY"])
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
