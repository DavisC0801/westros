class SearchShowFacade
  def initialize(house)
    @house = house
  end

  def members_count
    house_service.count
  end

  def members
    house_service.map do |member_attributes|
      Member.new(member_attributes)
    end
  end

  private

  def house_service
    @service ||= HouseSearchService.new(@house)
    @service.search
  end
end
