import consumer from "./consumer"

consumer.subscriptions.create({channel: "ChatroomChannel", chatroom_id: window.location.pathname.split('/')[2] }, {
  connected() {
    console.log("connected")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const chatroomBody = document.getElementById("chatroom-body")
    const current_user_id = document.getElementById("user_id").value
    chatroomBody.innerHTML = `<div class="${current_user_id == data.message_user_id ? 'self' : 'other'} message-bubble">` + data.html + '</div>' + chatroomBody.innerHTML
    // Called when there's incoming data on the websocket for this channel
  }
});
