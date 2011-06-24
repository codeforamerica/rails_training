class ConfirmationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
      @users_not_confirmed = User.where(:confirmed_at => nil)
  end

end
