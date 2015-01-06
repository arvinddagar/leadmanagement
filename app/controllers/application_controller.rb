class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.admin?
     	renewal_date
      daily_updates_path
    else
      renewal_date
      new_daily_update_path
    end
  end
  def renewal_date
    @c=AddContract.all
    @c.each do |c|
      if c.plans.present?
        if  c.plans.last.renewal_date.present?
          if  c.plans.last.renewal_date<Date.today
            c.update(:status=>"expired")
          end
        end
      end
    end
  end
  
end

