module ApplicationHelper
  TYPES_OF_ALERTS = {
    notice: 'success',
    alert: 'danger',
    error: 'danger',
    warning: 'warning',
    info: 'primary'
  }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    flash.map do |type, message|
      content_tag(:div, message, class: "alert alert-#{TYPES_OF_ALERTS[type.to_sym]}")
    end.join.html_safe
  end
end
