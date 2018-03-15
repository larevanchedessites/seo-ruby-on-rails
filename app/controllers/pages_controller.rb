# app/controllers/pages_controller.rb

class PagesController < ApplicationController

  def home
  end

  def contact
    add_breadcrumb "Contact", contact_path
  end

  def robots
    # Don't forget to delete /public/robots.txt
    respond_to :text
  end

end
