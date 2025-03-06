class UsersController < ApplicationController
  def home
    render({ :template => "users/home"})
  end
end
