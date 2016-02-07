class News < ActiveRecord::Base
    def get_likes
        return Like.where([ "news_id = :n", { n: self.id } ]).length
    end

    def get_comments
        return Comment.where([ "news_id = :n", { n: self.id } ])
    end
end
