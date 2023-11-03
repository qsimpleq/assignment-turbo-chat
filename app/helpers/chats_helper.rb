# frozen_string_literal: true

module ChatsHelper
  def chat_owner?(chat)
    user_signed_in? && chat.user_id == current_user.id
  end
end
