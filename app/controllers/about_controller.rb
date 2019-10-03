class AboutController < ApplicationController
  def project
    render '/about/project'
  end

  def author
    render '/about/author'
  end
end
