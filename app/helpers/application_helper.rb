module ApplicationHelper
  def year
    Date.current.year
  end

  def flash_message(type)
    content_tag :p, flash[type].html_safe, class: "flash #{type}" if flash[type]
  end

  def github_url(author: 'name', repo: 'testguru', title: 'TestGuru')
    link_to title.to_s, "https://github.com/#{author}/#{repo}", rel: 'nofollow', target: '_blank'
  end
end
