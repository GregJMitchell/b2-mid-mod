# frozen_string_literal: true

require 'rails_helper'

describe 'As a user, When I go to a mechanics show page' do
  it 'I see their name, years of experience, and names of all rides they’re working on' do
    mechanic = Mechanic.create(name: 'Sal', experience: 5)
    amusement_park = AmusementPark.create(name: 'Turing Land', admission: 27.95)
    ride_1 = Ride.create(name: 'Ruby Coaster', thrill: 10, amusement_park_id: amusement_park.id)

    RideMechanic.create(ride_id: ride_1.id, mechanic_id: mechanic.id)
    visit "mechanics/#{mechanic.id}"

    expect(page).to have_content(mechanic.name)
    expect(page).to have_content(mechanic.experience)
    expect(page).to have_content(ride_1.name)
  end
  describe 'And I also see a form to add a ride to their workload' do
    describe 'When I fill in that field with an id of a ride that exists in the database' do
      it "And I click submit I’m taken back to that mechanics show page And I see the name
      of that newly added ride on this mechanics show page" do
        mechanic = Mechanic.create(name: 'Sal', experience: 5)
        amusement_park = AmusementPark.create(name: 'Turing Land', admission: 27.95)
        ride_1 = Ride.create(name: 'Ruby Coaster', thrill: 10, amusement_park_id: amusement_park.id)
        ride_2 = Ride.create(name: 'Java Coaster', thrill: 1, amusement_park_id: amusement_park.id)

        RideMechanic.create(ride_id: ride_1.id, mechanic_id: mechanic.id)
        visit "mechanics/#{mechanic.id}"

        fill_in 'mechanic[ride]', with: ride_2.name.to_s
        click_button 'Add Ride'

        expect(current_path).to eq("/mechanics/#{mechanic.id}")
        expect(page).to have_content(ride_2.name)
        
      end
    end
  end
end
