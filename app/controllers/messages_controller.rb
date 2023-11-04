# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html do
          redirect_back_or_to @message.chat, notice: 'Message was successfully created.'
        end
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:body, :chat_id, :user_id)
  end
end
