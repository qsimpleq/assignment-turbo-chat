# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user, optional: true

  after_create_commit -> { broadcast_append_to chat }
end
