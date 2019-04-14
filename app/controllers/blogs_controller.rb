class BlogsController < ApplicationController
  before_action :authenticate_user!, only: :edit
  before_action :set_title
  def index
    @blogs = Blog.all.order(:updated_at).reverse
    @tags = Blog.pluck(:tag).uniq
    @tag = "ALL"
  end

  def show
    @blog = Blog.find(params[:id])
    @blogs = Blog.where(tag: @blog.tag).where.not(id: params[:id]).reverse
    @blogs = Blog.where.not(id: params[:id]).reverse unless @blogs.count == 1
    @title = @blog.title
    @meta = @blog.content.truncate(50)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.save
    redirect_to blog_path(@blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      redirect_to blog_path(@blog.id)
    else
    end
  end

  def tag
    @blogs = Blog.where(tag: params[:tag])
    @tag = params[:tag]
    @tags = Blog.pluck(:tag).uniq
    render 'index'
  end

  def destroy
    Blog.find(params[:id]).destroy
    redirect_to blogs_path
  end

private

  def blog_params
    params.require(:blog).permit(:tag, :title, :content)
  end

  def set_title
    @header_title = "Blogs"
    @awesome = "rss"
    @title = "Blog"
    @meta = "Blogs made by Azy"
  end
end
