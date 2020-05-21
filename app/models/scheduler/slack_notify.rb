require 'sidekiq-scheduler'
require 'net/http'
require 'uri'
module Scheduler
  class SlackNotify
    include Sidekiq::Worker

    def perform
      post = Post.find_post_not_yet_notify
      if post.present?
        web_hook_url = URI('https://wh.jandi.com/connect-api/webhook/279/9cc5dac442f7ac8aea3927b8040ee131')
        headers = {'Content-Type' => 'application/json',
                   'Accept' => 'application/vnd.tosslab.jandi-v2+json'}
        request = {
            body: post.url,
            connectColor: "#00C473",
            # connectInfo: [{
            #                   title: "어이 이보게!",
            #                   description: "한번 읽어보게나!"
            #               }]{}
        }.to_json

        response = Net::HTTP.post web_hook_url, request, headers

        logger.info(response.body)
      end
    end
  end
end
