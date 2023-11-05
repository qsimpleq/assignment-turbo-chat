# frozen_string_literal: true

module Api
  module V1
    class MessagesController < Api::ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        chat = Chat.find params[:chat_id]
        message = chat.messages.build(message_params)
        if message.save
          render json: message, status: :created
        else
          render json: { errors: message.errors }, status: :unprocessable_entity
        end
      end

      private

      def message_params
        params.require(:message).permit(:user, :body)
      end
    end
  end
end
