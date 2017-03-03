Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'
  require 'sidekiq-status/web'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'

    get 'sms' => 'sms#index'
    post 'import' => 'sms#import'
  end

  root to: redirect('sms')
end
