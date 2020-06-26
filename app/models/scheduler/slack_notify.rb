require 'sidekiq-scheduler'
require 'net/http'
require 'uri'
module Scheduler
  class SlackNotify
    include Sidekiq::Worker

    def perform
      post = Post.find_post_not_yet_notify
      if post.present?
        jandi_notify(post)
        slack_notify(post)
      end

      budongsan_notify if Time.now.strftime("%H").to_i < 15
    end

    def budongsan_notify
      house_secd = {
          '01' => 'APT 특별공급',
          '02' => 'APT 1순위',
          '03' => 'APT 2순위',
          '04' => '민간임대',
          '05' => '오피스텔/도시형',
          '06' => '무순위/잔여세대'
      }
      
      response = HTTParty.post('https://www.applyhome.co.kr/ai/aib/selectSubscrptCalender.do',
                               :body => {
                                   'reqData' => {
                                       'inqirePd' => Time.now.strftime("%Y%m")
                                   }
                               }.to_json,
                               :headers => {
                                   'Accept' => 'application/json',
                                   'Content-Type' => 'application/json'
                               })

      result = JSON.parse(response.body)
      today_infos = result['schdulList'].select { |obj| obj['IN_DATE'] == Time.now.strftime('%Y%m%d') }

      count = today_infos.count
      today_infos_txt = "**오늘의 청약 알림** , 총 #{count} 건!\n"

      today_infos.each_with_index { |item, index | today_infos_txt << "#{index+1}. [#{house_secd[item['HOUSE_SECD']]}] #{item['HOUSE_NM']} \n" }
      applyhome_url = 'https://www.applyhome.co.kr/ai/aib/selectSubscrptCalenderView.do'

      web_hook_url = URI('https://wh.jandi.com/connect-api/webhook/279/2b7f6b5b0b1fb67610f4bdc51ba7e7de')
      headers = {'Content-Type' => 'application/json',
                 'Accept' => 'application/vnd.tosslab.jandi-v2+json'}
      request = {
          body: today_infos_txt.html_safe,
          connectColor: "#00C473",
          connectInfo: [{
                            title: "청약홈 보러가기!",
                            description: applyhome_url
                        }]
      }.to_json
      Net::HTTP.post web_hook_url, request, headers
    end

    def slack_notify(post)
      web_hook_url = URI('https://hooks.slack.com/services/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')
      request = {
          channel: '#기술공유방',
          text: post.url.gsub('(', '').gsub(')', ''),
          username: '한번 읽어보게나!'
      }.to_json
      Net::HTTP.post web_hook_url, request, {}
    end

    def jandi_notify(post)
      web_hook_url = URI('https://wh.jandi.com/connect-api/webhook/279/9cc5dac442f7ac8aea3927b8040ee131')
      headers = {'Content-Type' => 'application/json',
                 'Accept' => 'application/vnd.tosslab.jandi-v2+json'}
      request = {
          body: post.url.gsub('(', '').gsub(')', ''),
          connectColor: "#00C473",
          # connectInfo: [{
          #                   title: "어이 이보게!",
          #                   description: "한번 읽어보게나!"
          #               }]{}
      }.to_json
      Net::HTTP.post web_hook_url, request, headers
    end
  end
end
