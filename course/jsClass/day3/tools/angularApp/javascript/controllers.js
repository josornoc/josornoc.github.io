'use strict';

/* Controllers */
var peopleApp = angular.module('angularApp', []);

peopleApp.controller('PeopleListCtrl', function ($scope, $http) {

	$http.get('http://tinder-api.herokuapp.com/people').success(function(data) {
    $scope.people = data;
    init($scope);
  });

  // $scope.people = [
  //   {'name': 'Adrià',
  //    'avatar': 'http://xoart.link/200/200/man/12',
  //    'description': 'On the weekends I play cricket.'},
  //   {'name': 'Moritz',
  //    'avatar': 'http://xoart.link/200/200/woman/22',
  //    'description': 'I like pizza and icecream.'},
  //   {'name': 'Hector',
  //    'avatar': 'http://xoart.link/200/200/man/26',
  //    'description': 'Amazing double rainbow.'}
  // ]

});