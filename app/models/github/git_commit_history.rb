module Github
  class GitCommitHistory < ApplicationRecord

    class << self
      def register(commit_url)
        self.create(commit_url: commit_url)
      rescue ActiveRecord::RecordNotUnique => e
        puts e
      end
      def already_exists?(commit_url)
        self.where(commit_url: commit_url).exists?
      end
    end

  end
end
