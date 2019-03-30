class StaticPageController < ApplicationController
  before_action :authenticate_user!, only: :users
  def index
    @blogs = Blog.all
    @informations = Information.all
  end

  def users
    @users = User.all
  end

  def about
  end

  def contact
  end
end
