# require "rails_helper"
#
# RSpec.describe MessageBroadcastJob, :type => :job do
#   describe "#perform_later" do
#     it "uploads a backup" do
#       chat_room = ChatRoom.create(title: '12345')
#       message = Message.create(body: 'aaaa',chat_room_id: chat_room.id)
#       ActiveJob::Base.queue_adapter = :test
#       expect {
#         MessageBroadcastJob.perform_now(message)
#       }.to have_enqueued_job
#     end
#   end
# end