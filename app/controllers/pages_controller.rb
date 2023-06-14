class PagesController < ApplicationController
  def home # has to be the same name with view
    @blogs = Blog.all
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
end
