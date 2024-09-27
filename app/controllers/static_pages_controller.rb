# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @posts = Post.all
    @post = current_user.posts.build if current_user
  end

  def contact; end

  def blog; end
end
