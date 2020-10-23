# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :ride_mechanics }
    it { should have_many(:rides).through(:ride_mechanics) }
  end
  it 'Should order rides in alphabetical order' do
    mechanic = Mechanic.create(name: 'Sal', experience: 5)
    amusement_park = AmusementPark.create(name: 'Turing Land', admission: 27.95)
    ride_1 = Ride.create(name: 'Ruby Coaster', thrill: 10, amusement_park_id: amusement_park.id)
    ride_2 = Ride.create(name: 'Java Coaster', thrill: 1, amusement_park_id: amusement_park.id)

    RideMechanic.create(ride_id: ride_1.id, mechanic_id: mechanic.id)
    RideMechanic.create(ride_id: ride_2.id, mechanic_id: mechanic.id)
    expect(mechanic.order_rides).to eq([ride_2, ride_1])
  end
end
