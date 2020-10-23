# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
  end
  it 'Average thrill' do
    amusement_park = AmusementPark.create(name: 'Turing Land', admission: 27.95)
    ride_1 = Ride.create(name: 'Ruby Coaster', thrill: 10, amusement_park_id: amusement_park.id)
    ride_2 = Ride.create(name: 'Java Coaster', thrill: 1, amusement_park_id: amusement_park.id)
    expect(amusement_park.average_thrill).to eq(5.5)
  end
end
