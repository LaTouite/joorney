require 'twilio-ruby'

class UserEventsController < ApplicationController
  def create
    user_event = UserEvent.create(
      phone_number: params[:user_event][:phone_number],
      event_id: params[:event_id]
    )
    authorize user_event
    send_invitation(user_event)
  end

  # custom routes GET - url envoye par twilio
  # /user_event/:id
  def confirm_invitation
    # if user_event.event.token} =
    # recupere l'user_event avec l'id
    # renseigne user avec current_user
    # redirige vers une vue
  end

  private

  def send_invitation(user_event)
    account_sid = 'AC5d11bdbcef24cf1c35b2cfc4ea880985'
    auth_token = 'fc5f3b1a34a740678c21ee7863e20b9f'
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.api.account.messages.create(
      from: 'whatsapp:+14155238886',
      to: "whatsapp:+33#{user_event.phone_number[1..-1]}",
      body: "Salut. localhost:3000/user_event/#{user_event.event.id}?token=#{user_event.event.token}"
      # confirm_invitation_path
    )
  end

  def user_event_params
    params.require(:user_event).permit(:present?, :phone_number)
  end
end
