require 'twilio-ruby'

class UserEventsController < ApplicationController
  def create
    numbers = params[:user_event][:phone_number]
    numbers_arr = numbers.split(', ')

    user_events = numbers_arr.map do |number|
      user_event = UserEvent.create(
      phone_number: number,
      event_id: params[:event_id]
    )
      authorize user_event
    end

    # user_event = UserEvent.create(
    #   phone_number: params[:user_event][:phone_number],
    #   event_id: params[:event_id]
    # )

    user_events.each do |user_event|
      send_invitation(user_event)
    end
    # Attention, destroy les event-user à qui ont envoie le message whatsapp avant de seeder des user-event dans le FakeJob
    user_events.each do |user_event|
      user_event.destroy
    end

    Event.find(params[:event_id]).populate_event
    redirect_to event_path(params[:event_id])
  end

  # custom routes GET - url envoye par twilio
  # /user_event/:id
  def confirm_invitation
    # recupere l'user_event avec l'id
    @user_event = UserEvent.find(params[:id])
    if params[:token] == @user_event.event.token
      # renseigne user avec current_user
      @user_event.user = current_user
      # redirige vers une vue
      redirect to
    else
      # redirige vers ... a definir
    end
  end

  private

  def send_invitation(user_event)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.api.account.messages.create(
      from: 'whatsapp:+14155238886',
      to: "whatsapp:+33#{user_event.phone_number[1..-1]}",
      body: "Hello. localhost:3000/user_events/#{user_event.event.id}/confirm_invitation?token=#{user_event.event.token}"
    )
  end

  def user_event_params
    params.require(:user_event).permit(:present?, :phone_number)
  end
end
