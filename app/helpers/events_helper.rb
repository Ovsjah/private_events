module EventsHelper
  def format_date(date)
    date.in_time_zone('Tallinn').to_formatted_s(:long_ordinal)
  end
end
