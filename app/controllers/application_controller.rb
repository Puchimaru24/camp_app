class ApplicationController < ActionController::Base
    
  def camp
    render html: "camp_appへようこそ!"
  end
end
