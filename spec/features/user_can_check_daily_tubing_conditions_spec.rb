require 'rails_helper'

describe 'As a user' do
  describe 'when I visit /' do
    it 'tells me if today is a good day to go tubing' do
      visit '/'

      expect(page).to have_content("Is today a good day to go tubing in Boulder Creek?")
      expect(page).to have_content("No")
      expect(page).to have_content("It's 59 degrees, partly cloudy and there's enough river flow for tubing")
    end
  end
end
