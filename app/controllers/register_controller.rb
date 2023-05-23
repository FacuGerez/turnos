class RegisterController < ApplicationController
  def index
    @todosLosUsuarios = User.all
  end
end
