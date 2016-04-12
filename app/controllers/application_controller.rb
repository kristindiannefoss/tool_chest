class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :most_recent_tool
  helper_method :users_tool_box_quanity

  def most_recent_tool
    if session[:most_recent_tool_id] != nil
      Tool.find(session[:most_recent_tool_id])
    else
      Tool.new
    end
  end

  def users_tool_box_quanity
    if session[:most_recent_tool_id] != nil
      session[:most_recent_tool_count] = 0
    else
      session[:most_recent_tool_count] = Tool.all.count
    end
  end

end
