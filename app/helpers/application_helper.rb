module ApplicationHelper
  def title
    if @title
      "#{app_name} | #{@title}"
    else
      app_name
    end
  end
  
  def app_name
    "Paper Pusher"
  end
  
  def display_date(date)
    date.strftime("%b %e, %Y")
  end
end
