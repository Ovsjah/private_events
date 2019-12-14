module ApplicationHelper
  def full_title(title = '')
    base = 'Private Events'
    title.empty? ? base : "#{base} | #{title}"
  end

  def provide_all(path, txt)
    %i[title button h1 path].each  { |s| provide(s, s == :path ? path : txt) }
  end
end
