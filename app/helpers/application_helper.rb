# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def author_name
    'Корнеев Александр'
  end

  def author_git
    'alxkorn'
  end

  def repo
    'test-guru'
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: :_blank
  end

  def thinknetica
    link_to 'Учебный проект в онлайн-школе Thinknetica', 'http://thinknetica.com', target: :_blank
  end
end
