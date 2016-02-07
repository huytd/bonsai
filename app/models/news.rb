class News < ActiveRecord::Base
    def get_likes
        return Like.where([ "news_id = :n", { n: self.id } ]).length
    end

    def do_like
        Like.create({ :user_id => "", :news_id => self.id })
    end
end
