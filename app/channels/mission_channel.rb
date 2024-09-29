# app/channels/mission_channel.rb
class MissionChannel < ApplicationCable::Channel
  def subscribed
    @mission = Mission.find(params[:mission_id])  # Find the mission the user is subscribing to
    Rails.logger.info "---------------------------"
    Rails.logger.info "Subscribing to MissionChannel with mission_id: #{params[:mission_id]}"
    Rails.logger.info "---------------------------"
    stream_for @mission  # Start streaming updates for this specific mission
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
