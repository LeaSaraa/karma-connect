
App.messages = App.cable.subscriptions.create('MessagesChannel', {
   connected: function (data) {
      // Called when the subscription is ready for use on the server
      console.log(data);

    },

    disconnected: function () {
      // Called when the subscription has been terminated by the server
    },

    received: function (data) {
      // Called when there's incoming data on the websocket for this channel. You could put plain jQuery into here to replace a div with html, for example.
      document.querySelector('#messages').classList.remove('hidden')
      var content = "<div class='message-container'><div class='avatar-wrapper-left'><img class='message-avatar' src='" + data.url + "'><p>" + data.user + "</p></div><div class='message-text-balloon-left'>" + data.message + "</div></div>"
      return document.querySelector('#messages').insertAdjacentHTML('beforeend', content);
    }
});
