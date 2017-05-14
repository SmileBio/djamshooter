class WelcomeController < ApplicationController

  def index
    @regions = Region.all
  end

end
