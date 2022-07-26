require "rails_helper"

RSpec.describe CityComponent, type: :component do
  let(:city) { create(:city) }

  it "renders something useful" do
    render_inline(described_class.new(city: city))

    expect(page).to have_text(city.name)
    expect(page).to have_text(city.gov_type)
    expect(page).to have_text(city.population)
    expect(page).to have_text(city.leader)
  end
end
