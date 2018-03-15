# spec/controllers/posts_controller_sepc.rb

require 'rails_helper'

RSpec.describe PostsController do

  describe "GET #index" do
    it "populates an array of posts"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested post to @post"
    it "renders the #show view"
  end

end
