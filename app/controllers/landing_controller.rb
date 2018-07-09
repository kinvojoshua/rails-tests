class LandingController < ApplicationController

  def index
    @name = "John Doe"
    @guests = ["a", "b" ,"c"]
  end

end
