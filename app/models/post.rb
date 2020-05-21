class Post < ApplicationRecord
  class << self
    def register(posting_info)
      self.create(title: posting_info[:title], url: posting_info[:url])
    rescue ActiveRecord::RecordNotUnique => e
      puts e
    end
    def find_post_not_yet_notify
      noy_yet_notify_post =  self.where(status: 0).first
      noy_yet_notify_post.status = 1
      noy_yet_notify_post.save!
      noy_yet_notify_post
    end
  end
end