class PingController < ApplicationController
  def pong
    render json: { 'ping': 'pong' }
  end
end
