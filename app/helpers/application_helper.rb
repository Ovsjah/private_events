module ApplicationHelper
  def full_title(title = '')
    base = 'Private Events'
    title.empty? ? base : "#{base} | #{title}"
  end

  def provide_all(path, txt)
    %i[title button heading path].each  { |s| provide(s, s == :path ? path : txt) }
  end

  def to_possessive(name)
    name +=
      if name.ends_with? 's'
        "'"
      else
        "'s"
      end
  end
end
