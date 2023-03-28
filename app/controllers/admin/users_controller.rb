class Admin::UsersController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.all
  end
end
