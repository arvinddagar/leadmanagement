Rails.application.routes.draw do
  resources :daily_updates
  devise_for :users , controllers: { sessions: "sessions" }
  root 'daily_updates#index'
  namespace :admin do
    resources :manage_user
    resources :users
    resources :categories
    get 'deactivate' => 'manage_user#deactivate', :as=>'deactivate'
    get 'daily_updates/index'
  end
   get 'new_contract' => 'admin/daily_updates#new_contract'
   get 'scheduled_call' => 'daily_updates#scheduled_call'
     post 'create_contract' => 'admin/daily_updates#create_contract'
     get 'fetch_plans' => 'admin/daily_updates#fetch_plans'
     get 'index_contract' => 'admin/daily_updates#index_contract'
     get 'edit_contract' => 'admin/daily_updates#edit_contract'
     post 'update_contract' => 'admin/daily_updates#update_contract'
     get 'show_meetings' => 'admin/daily_updates#show_meetings'
  as :admin do
    post 'admin/new_users' => 'admin/users#create'
    post 'user_daily_updates' => 'admin/daily_updates#user_daily_updates'
    post 'schedule_meeting'=>'daily_updates#schedule_meeting'
    post 'schedule_meetings'=>'admin/daily_updates#meetings'
    get 'schedule_meetings'=>'admin/daily_updates#meetings'
    get 'user_daily_updates' => 'admin/daily_updates#user_daily_updates'
    get 'meetings'=>'admin/daily_updates#meetings'
     get 'edit_meetings'=>'admin/daily_updates#edit_meetings'
     post 'update_meetings'=>'admin/daily_updates#update_meetings'
     get 'client_management' => 'admin/daily_updates#client_management'
      get 'payment_history' => 'admin/daily_updates#payment_history'
       post 'create_payment' => 'admin/daily_updates#create_payment'
    
  end
end
