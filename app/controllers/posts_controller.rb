# app/controllers/posts_controller.rb

class PostsController < ApplicationController

  add_breadcrumb "Blog", :posts_path

  def index
    @posts = Post.all
  end

  def show
    @post = Post.friendly.find(params[:id])
    fresh_when last_modified: @post.updated_at
    add_breadcrumb @post, post_path(@post)
  end

end
