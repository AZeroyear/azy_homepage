class StaticPageController < ApplicationController
  before_action :authenticate_user!, only: :users
  before_action :set_title

  def index
    @static = "index"
    @blogs = Blog.all
    @informations = Information.where(close: false).reverse
  end

  def users
    @users = User.all
  end

  def webpage
    @static = "webpage"
  end

private
  def set_title
    @title = "Home"
    @meta = "Home page by Azy"
  end

end
