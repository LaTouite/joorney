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
      InvitationJob.perform_later(user_event.id)
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

  def user_event_params
    params.require(:user_event).permit(:present?, :phone_number)
  end
end
