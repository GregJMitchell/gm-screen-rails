# frozen_string_literal: true

class CityComponent < ViewComponent::Base
  def initialize(city:)
    @city = city
    @campaign = city.campaign
    @name = city.name
    @gov_type = city.gov_type
    @population = city.population
    @leader = city.leader
    @description = city.description
  end
end
