require 'sidekiq-scheduler'
module Scheduler
  class GitCrawler
    include Sidekiq::Worker

    def perform
      ::GithubPostingUrlCrawler.new("https://github.com/Integerous/goQuality-dev-contents/commits/master.atom").run
    end
  end
end

