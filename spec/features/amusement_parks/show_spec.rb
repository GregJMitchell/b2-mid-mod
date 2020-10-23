# frozen_string_literal: true

require 'rails_helper'

describe 'As a user,' do
  describe 'When I visit an amusement park’s show page' do
    describe "I see the name and price of admissions for that amusement park" do
      it "And I see the names of all the rides that are at that park And I see the average thrill rating of this amusement park’s rides" do 
        amusement_park = AmusementPark.create(name: "Turing Land", admission: 27.95)
        ride_1 = Ride.create(name: "Ruby Coaster", thrill: 10, amusement_park_id: amusement_park.id)
        ride_2 = Ride.create(name: "Java Coaster", thrill: 1, amusement_park_id: amusement_park.id)

        visit "/amusement-parks/#{amusement_park.id}"

        expect(page).to have_content(amusement_park.name)
        expect(page).to have_content(amusement_park.admission)
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_2.name)
        expect(page).to have_content("5.5")
      end
    end
  end
end
