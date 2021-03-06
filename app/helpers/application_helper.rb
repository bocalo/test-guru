module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo, project_name)
    link_to "#{project_name}", "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end
end
