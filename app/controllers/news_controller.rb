require 'readability'
require 'open-uri'

class NewsController < ApplicationController
  def index
      @news = News.all
  end

  def show
      @feed = News.find(params[:id])
  end
end
