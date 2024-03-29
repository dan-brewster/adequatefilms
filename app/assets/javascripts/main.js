var app = angular.module("adequatefilms", ['ngResource']);

// This makes Angular play nice with getting JSON responses
// back from Rails
app.config(function($httpProvider) {
  $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
});

// # This line is related to our Angular app, not to our
// # HomeCtrl specifically. This is basically how we tell
// # Angular about the existence of our application.
// @restauranteur = angular.module('restauranteur', [])
//
// # This routing directive tells Angular about the default
// # route for our application. The term "otherwise" here
// # might seem somewhat awkward, but it will make more
// # sense as we add more routes to our application.
// @restauranteur.config(['$routeProvider', ($routeProvider) ->
//   $routeProvider.
//     otherwise({
//       templateUrl: '../templates/home.html',
//       controller: 'HomeCtrl'
//     })
// ])
