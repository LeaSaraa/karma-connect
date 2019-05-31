
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
      let content = "<div class='message-container'><div class='avatar-wrapper'><img class='message-avatar' src='http://placehold.it/100/100'><p>" + data.user + "</p></div><div class='message-text-balloon'>" + data.message + "</div></div>"
      return document.querySelector('#messages').insertAdjacentHTML('beforeend', content);
    }
});
