class LoginController < ApplicationController
  def index
    @todosLosUsuarios = User.all
  end
end
