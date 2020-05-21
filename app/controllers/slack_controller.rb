class SlackController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    client = Slack::Web::Client.new
    logger.info client.auth_test
  end

  def create
    render plain: 'hello'
  end
end
