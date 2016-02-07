require 'readability'
require 'open-uri'

class NewsController < ApplicationController
  def index
      @news = News.order('created_at DESC').all
  end

  def show
      @feed = News.find(params[:id])
  end

  def do_like
      @feed = News.find(params[:id])
      Like.create({ :user_id => "", :news_id => @feed.id })
      render :json => @feed.get_likes()
  end
end
