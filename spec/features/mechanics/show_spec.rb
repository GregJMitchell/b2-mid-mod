# frozen_string_literal: true

require 'rails_helper'

describe 'As a user, When I go to a mechanics show page' do
  it 'I see their name, years of experience, and names of all rides they’re working on' do
    mechanic = Mechanic.create(name: 'Sal', experience: 5)
    amusement_park = AmusementPark.create(name: "Turing Land", admission: 27.95)
    ride_1 = Ride.create(name: 'Ruby Coaster', thrill: 10, amusement_park_id: amusement_park.id)
    ride_2 = Ride.create(name: 'Java Coaster', thrill: 1, amusement_park_id: amusement_park.id)

    RideMechanic.create(ride_id: ride_1.id, mechanic_id: mechanic.id)
    visit "mechanics/#{mechanic.id}"

    expect(page).to have_content(mechanic.name)
    expect(page).to have_content(mechanic.experience)
    expect(page).to have_content(ride_1.name)
  end
end
