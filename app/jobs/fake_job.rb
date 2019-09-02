class FakeJob < ApplicationJob
  queue_as :default

  # user_id: User.sample(1).first,

  def perform(event_id)
    sleep 5
    [{
    present: true,
    event_id: event_id,
    user: User.first,
    action1: true,
    action2: false,
    time_ago: "21 heures"
    },
    {
    present: true,
    event_id: event_id,
    user: User.last,
    action1: true,
    action2: true,
    time_ago: "9 heures"
    }]
    .each do |item|
      UserEvent.create!(item)
    end

    # .each do |item|
      # p item
      # UserEvent.create!(present: item.present?, event_id: item.event_id, user_id: item.user_id, action1: item.action1, action2: item.action2, time_ago: item.time_ago)
    # end
  end
end

# def perform(event)
#     sleep 10
#     [{
#     present?: true,
#     event_id: event,
#     user_id: User.first,
#     action1: true,
#     action2: false,
#     time_ago: "20 heures"
#     },
#     {
#     present?: true,
#     event_id: event,
#     user_id: 2,
#     action1: false,
#     action2: true,
#     time_ago: "20 heures"
#     },
#     {
#     present?: true,
#     event_id: event,
#     user_id: 3,
#     action1: true,
#     action2: false,
#     time_ago: "20 heures"
#     },
#     {
#     present?: true,
#     event_id: event,
#     user_id: 4,
#     action1: true,
#     action2: false,
#     time_ago: "20 heures"
#     },
#     {
#     present?: true,
#     event_id: event,
#     user_id: 5,
#     action1: true,
#     action2: false,
#     time_ago: "20 heures"
#     },
#     {
#     present?: true,
#     event_id: event,
#     user_id: User.last,
#     action1: false,
#     action2: true,
#     time_ago: "20 heures"
#     }].each do |item|
#       sleep 1
#       UserEvent.create(present: item.present?, event_id: item.event_id, user_id: item.user_id, action1: item.action1, action2: item.action2, time_ago: item.time_ago)
#     end
#   end
