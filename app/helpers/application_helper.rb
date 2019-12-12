module ApplicationHelper
  def full_title(title = '')
    base = 'Private Events'
    title.empty? ? base : "#{base} | #{title}"
  end
end
