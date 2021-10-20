module CampaignHelper
  def format_minutes(min)
    if min >= 1440
      day_formater((min / 60) / 24)
    elsif min >= 60
      hours = min / 60
      hours > 1 ? "#{hours} hours ago" : "#{hours} hour ago"
    elsif min == 0
      'now'
    else
      min > 1 ? "#{min} mins ago" : "#{min} min ago"
    end
  end

  private
    def day_formater(days)
      if days >= 365
        years = days / 365
        years > 1 ? "#{years} years ago" : "#{years} year ago"
      elsif days >= 28
        months = Time.now.month - Time.new.advance(days: -days).month
        months > 1 ? "#{months} months ago" : "#{months} month ago"
      else
        days > 1 ? "#{days} days ago" : "#{days} day ago"
      end
    end
end
