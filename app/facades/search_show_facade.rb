class SearchShowFacade
  def initialize(house)
    @house = house
  end

  def members_count
    total_members
  end

  def members
    member_list.map do |member_attributes|
      Member.new(member_attributes)
    end
  end

  private

  def total_members
    house_service[:data].first[:attributes][:members].count
  end

  def member_list
    house_service[:data].first[:attributes][:members]
  end

  def house_service
    @service ||= HouseSearchService.new(@house)
    @service.search
  end
end
