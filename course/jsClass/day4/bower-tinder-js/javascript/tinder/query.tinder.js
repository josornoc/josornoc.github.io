var Tinder = window.Tinder || {};

// Query Selector Function
Tinder.query = function(selector) {
  return document.querySelector(selector);
};

// Event Listener Function
Tinder.on = function(element, event, callback) {
  element.addEventListener(event, callback);
};