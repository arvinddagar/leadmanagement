json.array!(@daily_updates) do |daily_update|
  json.extract! daily_update, :id, :business, :contact_person, :number, :designation, :status, :summary, :address, :email
  json.url daily_update_url(daily_update, format: :json)
end
