ActionCable = require('actioncable')

var cable = ActionCable.createConsumer('ws://localhost:3000/cable')

$(document).ready(function(){

    var multi_user_messages, multi_user_messages_to_bottom;
    multi_user_messages = $('#multi_user_messages');
    if ($('#multi_user_messages').length > 0) {
        multi_user_messages_to_bottom = function() {
            return multi_user_messages.scrollTop(multi_user_messages.prop("scrollHeight"));
        };
        multi_user_messages_to_bottom();
        appMultiUserPrivateChat = cable.subscriptions.create({
            channel: "MultiUserPrivateChatRoomsChannel",
            multi_user_private_chat_room_id: multi_user_messages.data('multi-user-private-chat-room-id')

        }, {
            connected: function() {},
            disconnected: function() {},
            received: function(data) {
                multi_user_messages.append(data['multi_user_message']);
                return multi_user_messages_to_bottom();
            },
            send_multi_user_message: function(multi_user_message, multi_user_private_chat_room_id) {
                return this.perform('send_multi_user_message', {
                    multi_user_message: multi_user_message,
                    multi_user_private_chat_room_id: multi_user_private_chat_room_id
                });
            }
        });
        return $('#multi_user_new_message').submit(function(e) {
            var $this, textarea;
            $this = $(this);
            textarea = $this.find('#multi_user_message_content');
            if ($.trim(textarea.val()).length > 1) {
                appMultiUserPrivateChat.send_multi_user_message(textarea.val(), multi_user_messages.data('multi-user-private-chat-room-id'));
                textarea.val('');
            }
            e.preventDefault();
            return false;
        });
    }
    //////////////////////////////////
    var private_messages, private_messages_to_bottom;
    private_messages = $('#private_messages');
    if ($('#private_messages').length > 0) {
        private_messages_to_bottom = function() {
            return private_messages.scrollTop(private_messages.prop("scrollHeight"));
        };
        private_messages_to_bottom();
        appPrivateChat = cable.subscriptions.create({
            channel: "PrivateChatRoomsChannel",
            private_chat_room_id: private_messages.data('private-chat-room-id')
        }, {
            connected: function() {},
            disconnected: function() {},
            received: function(data) {
                private_messages.append(data['private_message']);
                return private_messages_to_bottom();
            },
            send_private_message: function(private_message, private_chat_room_id) {
                return this.perform('send_private_message', {
                    private_message: private_message,
                    private_chat_room_id: private_chat_room_id
                });
            }
        });
        return $('#private_new_message').submit(function(e) {
            var $this, textarea;
            $this = $(this);
            textarea = $this.find('#private_message_content');
            if ($.trim(textarea.val()).length > 1) {
                appPrivateChat.send_private_message(textarea.val(), private_messages.data('private-chat-room-id'));
                textarea.val('');
            }
            e.preventDefault();
            return false;
        });
    }

    ///////////////////////
    var messages, messages_to_bottom;
    messages = $('#messages');
    if ($('#messages').length > 0) {
        messages_to_bottom = function() {
            return messages.scrollTop(messages.prop("scrollHeight"));
        };
        messages_to_bottom();
        appGlobalChat = cable.subscriptions.create({
            channel: "ChatRoomsChannel",
            chat_room_id: messages.data('chat-room-id')
        }, {
            connected: function() {},
            disconnected: function() {},
            received: function(data) {
                messages.append(data['message']);
                return messages_to_bottom();
            },
            send_message: function(message, chat_room_id) {
                return this.perform('send_message', {
                    message: message,
                    chat_room_id: chat_room_id
                });
            }
        });
        return $('#new_message').submit(function(e) {
            var $this, textarea;
            $this = $(this);
            textarea = $this.find('#message_body');
            if ($.trim(textarea.val()).length > 1) {
                appGlobalChat.send_message(textarea.val(), messages.data('chat-room-id'));
                textarea.val('');
            }
            e.preventDefault();
            return false;
        });
    }
});







