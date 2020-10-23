# frozen_string_literal: true

require 'rails_helper'

describe 'As a user,' do
  describe 'When I visit a mechanics index page' do
    it 'I see a header saying “All Mechanics” And I see a list of all mechanic’s names and their years of experience' do
      mechanic = Mechanic.create(name: "Sal", experience: 5)

      visit "/mechanics"

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content(mechanic.name)
      expect(page).to have_content(mechanic.experience)
    end
  end
end
