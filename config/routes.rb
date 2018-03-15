Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Force www redirect
  # Start server with rails s -p 3000 -b lvh.me
  # Then go to http://www.lvh.me:3000
  # constraints(host: /^(?!www\.)/i) do
  #   match '(*any)' => redirect { |params, request|
  #     URI.parse(request.url).tap { |uri| uri.host = "www.#{uri.host}" }.to_s
  #   }
  # end

  root to: "pages#home"

  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unacceptable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all


  get "/robots.:format", to: "pages#robots"
  get '/sitemap.xml' => 'sitemaps#index', defaults: { format: 'xml' }

  get "contact", to: "pages#contact"

  resources :posts, only: [:index, :show], path: :blog

  # 301 redirect from old URLs
  # match "/old_path_to_blog_posts/:id", to: redirect("/blog_posts/%{id}s")
end
