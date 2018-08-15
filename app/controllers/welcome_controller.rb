class WelcomeController < ApplicationController
  def index
    @tubing_presenter = TubingPresenter.new
  end
end
