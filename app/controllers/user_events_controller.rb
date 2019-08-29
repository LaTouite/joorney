require 'twilio-ruby'

class UserEventsController < ApplicationController
  def send_invitation
    raise
    account_sid = 'AC5d11bdbcef24cf1c35b2cfc4ea880985'
    auth_token = 'fc5f3b1a34a740678c21ee7863e20b9f'
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.api.account.messages.create(
      from: 'whatsapp:+14155238886',
      # to: 'whatsapp:+33616051380',
      to: "whatsapp:#{params[phone_number]}",
      body: 'Salut. Cest moi'
    )
  end

  # une fois que l user a cliqué sur le lien il faut qu il se sign up et que son compte soit joint à l event
  # def create
  #   # vraiment besoin d'un token ?
  #   @event = event.where(event.id = params[:id])
  #   @user_event = UserEvent.new(params @event)
  #   @user_event.event = current_user
  #   @user_event.save
  #   # redirect_to event_surveys
  #   # events/:event_id/user_events/new
  # end
end
