class Helpers < ActiveRecord::Base

  def self.is_logged_in?(session)
    !!session[:id]
  end

  def self.current_user(session)
    @user = User.find_by(session[:id])
  end
  
end