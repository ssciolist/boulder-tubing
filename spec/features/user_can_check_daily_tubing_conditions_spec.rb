require 'rails_helper'

describe 'As a user' do
  describe 'when I visit /' do
    it 'tells me if today is a good day to go tubing' do
      visit '/'

      expect(page).to have_context("Is today a good day to go tubing?")
      expect(page).to have_context("No")
      expect(page).to have_context("It's 59 degrees, partly cloudy and there's enough river flow for tubing")
    end
  end
end
