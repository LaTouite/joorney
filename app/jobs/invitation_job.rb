class InvitationJob < ApplicationJob
  queue_as :default

  def perform(user_event_id)
    user_event = UserEvent.find(user_event_id)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.api.account.messages.create(
      from: 'whatsapp:+14155238886',
      to: "whatsapp:+33#{user_event.phone_number[1..-1]}",
      body: "Hello. localhost:3000/user_events/#{user_event.event.id}/confirm_invitation?token=#{user_event.event.token}"
    )
    user_event.destroy
  end
end
