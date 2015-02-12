var Tinder = window.Tinder || {};

Tinder.notify = function(title, options) {
  if (!window.Notification) throw new Error("Notification API not supported!");

  // Ask the user for permission
  if (Notification.permission !== 'denied') {
    Notification.requestPermission(function (permission) {
      // If the user is okay, let's create a notification
      if (permission === "granted") {
        new Notification(title, options);
      }
    });
  }
};
