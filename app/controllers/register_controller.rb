class RegisterController < ApplicationController
  def index
    @User = User.new
  end
end
