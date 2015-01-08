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
    get 'past_clients'=>"admin/daily_updates#past_clients"
    get 'add_contracts'=>'admin/daily_updates#index_contract'
    get 'new_contract' => 'admin/daily_updates#new_contract'
    get 'scheduled_call' => 'daily_updates#scheduled_call'
    post 'create_contract' => 'admin/daily_updates#create_contract'
    get 'fetch_plans' => 'admin/daily_updates#fetch_plans'
    get 'fetch_meetings' => 'admin/daily_updates#fetch_meetings'
    get 'fetch_logs' => 'admin/daily_updates#logs'
    get 'fetch_contract' => 'admin/daily_updates#fetch_contract'
    get 'fetch_daily' => 'daily_updates#fetch_daily'
    get 'index_contract' => 'admin/daily_updates#index_contract'
    get 'edit_contract' => 'admin/daily_updates#edit_contract'
    post 'update_contract' => 'admin/daily_updates#update_contract'
    post 'call' => 'daily_updates#call'
    post 'call_meeting' => 'daily_updates#call_meeting'
    get 'show_meetings' => 'admin/daily_updates#show_meetings'
    get 'lead_statuses' => 'daily_updates#scheduled_call'
    get 'meeting_logs' => 'daily_updates#meeting_logs'
  as :admin do
    post 'notify_expiry'=>'admin/daily_updates#notify_expiry'
    post 'lead_statuses'=>'admin/daily_updates#daily_report'
     get 'daily_report'=>'admin/daily_updates#daily_report'
    post 'admin/new_users' => 'admin/users#create'
    post 'user_daily_updates' => 'admin/daily_updates#user_daily_updates'
    post 'schedule_meeting'=>'daily_updates#schedule_meeting'
    post 'schedule_meetings'=>'admin/daily_updates#meetings'
    get 'schedule_meetings'=>'admin/daily_updates#meetings'
    get 'payment_histories'=>'admin/daily_updates#reports'
    post 'reports'=>'admin/daily_updates#reports'
    get 'user_daily_updates' => 'admin/daily_updates#user_daily_updates'
    get 'meetings'=>'admin/daily_updates#meetings'
    get 'edit_meetings'=>'admin/daily_updates#edit_meetings'
    post 'update_meetings'=>'admin/daily_updates#update_meetings'
    get 'client_management' => 'admin/daily_updates#client_management'
    get 'payment_history' => 'admin/daily_updates#payment_history'
    get 'contract_expiry' => 'admin/daily_updates#contract_expiry'
    post 'contract_expiry' => 'admin/daily_updates#contract_expiry'
    post 'create_payment' => 'admin/daily_updates#create_payment'
    
  end
end
