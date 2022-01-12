module ApplicationHelper
  def year
    Date.current.year
  end

  def github_url(author: 'name', repo: 'testguru', title: 'TestGuru')
    link_to "#{title}", "https://github.com/#{author}/#{repo}"
  end
end
