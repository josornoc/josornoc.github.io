'use strict';

/* Controllers */

var peopleApp = angular.module('angularApp', []);

peopleApp.controller('PeopleListCtrl', function ($scope, $http) {

  $http.get('http://tinder-api.herokuapp.com/people').success(function(data) {

    $scope.people = data;

    data.forEach(function(person) {
      var latitude = person.latitude;
      var longitude = person.longitude;
      var url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='+latitude+','+longitude+'&sensor=true_or_false';

      Tinder.ajax(url, {}, function(response) {
        var city = response.results[0].address_components[3].long_name;
        person.city = city;
        $scope.$apply();
      });
    });
  });
});
