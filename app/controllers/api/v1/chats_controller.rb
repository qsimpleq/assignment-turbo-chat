# frozen_string_literal: true

module Api
  module V1
    class ChatsController < Api::ApplicationController
      def index
        render json: Chat.all
      end
    end
  end
end
