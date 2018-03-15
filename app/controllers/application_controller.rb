# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_breadcrumb "Homepage", :root_path, options: {
    title: "Go to the homepage"
  }

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

end
