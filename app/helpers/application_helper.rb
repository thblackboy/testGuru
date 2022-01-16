module ApplicationHelper
  def year
    Date.current.year
  end

  def github_url(author: 'name', repo: 'testguru', title: 'TestGuru')
    link_to title.to_s, "https://github.com/#{author}/#{repo}", rel: 'nofollow', target: '_blank'
  end

  def flash_message(type)
    if flash[type]
      content_tag :p, flash[type], class: "flash #{type}"
    end
  end
end
