class ApplicationController < ActionController::Base
    
  def cafe
    render html: "camp_appへようこそ!"
  end
end
