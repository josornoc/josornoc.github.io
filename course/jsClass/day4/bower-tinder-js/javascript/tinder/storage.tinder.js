var Tinder = window.Tinder || {};

if(!window.localStorage) throw new Error("Local Storage API not available.");

Tinder.save = function(key, value) {
  window.localStorage.setItem(key, JSON.stringify(value));
};

Tinder.get = function(key) {
  return JSON.parse(window.localStorage.getItem(key));
};

Tinder.remove = function(key) {
  window.localStorage.removeItem(key);
};
