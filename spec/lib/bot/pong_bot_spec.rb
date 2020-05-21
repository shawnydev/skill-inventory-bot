require 'rails_helper'

describe SlackRubyBot::Commands do
  let(:client) { PongBot.instance.send(:client) }
  it 'responds with pong' do
    expect(message: "#{SlackRubyBot::Config.user} ping").to respond_with_slack_message "pong"
  end
  it 'responds with pong2' do
    expect(message: "#{SlackRubyBot::Config.user} ping2").to respond_with_slack_message "pong2"
  end
end