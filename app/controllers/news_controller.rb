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
      @feed.do_like()
      render :json => @feed.get_likes()
  end
end
